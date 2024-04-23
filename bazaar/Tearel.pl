sub EVENT_SAY {
  my $group_flg       = quest::get_data($client->AccountID() ."-group-ports-enabled");  
  my $eom_available   = $client->GetAlternateCurrencyValue(6);
  my $cost            = 1000 * get_cost_for_level();

  my %waypoints       = plugin::GetWaypoints($client);

  if ($text=~/hail/i) { 
    quest::say("Greetings $name! I can help you get to almost anywhere! I sell
                    [teleportion stones] which, when handed back to me, will attune this magic map 
                    to several notable places that I've visted before. If you are a more experienced adventurer however, 
                    I can [transport you] or [your group] to places that you have visted, in this life or in others, 
                    and attuned yourself to by discovering Rune Circles.");
  }

  elsif ($text=~/teleportion stones/i) {
    quest::say("Absolutely. The process is simple! Purchase the teleportation stone of your choosing 
                    then give it to me. I will then enchant the map to take you to your destination! 
                    Simply click on the map afterwards and you will be off!");
  }

  elsif ($text=~/your group/i && !$group_flg) {
    quest::say("If you'd like for me to transport your group, I'll need a stronger connection to your memories. Bring me five
                [Echo of Memory], and I can transport all of you any time you ask.");
    return;
  }

  elsif ($text=~/Echo of Memory/i && !$group_flg) {
    if ($eom_available >= 5) {
      quest::say("Simply [confirm] to me that you'd like to spend your Echoes in this way, and it will be done.");
    } else {
      quest::say("I'm sorry, but you don't have enough Echoes in order to resonante with those memories at the moment.");
    }
  }

  elsif ($text=~/confirm/ && !$group_flg && $eom_available >= 5) {
    if (plugin::SpendEOM($client, 5)) {
        quest::set_data($client->AccountID() ."-group-ports-enabled",1);
        quest::say("Excellent! I can transport [your group], whenever you'd like.");
    }
  }

  elsif ($text =~ /transport you/i || ($text =~ /your group/i && $group_flg)) {
      quest::say("Very good! Tell me about this place that you remember. This transportation will cost " . get_cost_for_level() . " platinum pieces.");
      $client->Message(257, " ------- Select a Continent ------- ");

      my $continents = GetContinents();
      my %continent_has_waypoints;

      # Determine which continents have waypoints
      foreach my $zone (keys %waypoints) {
          my $continent_id = $waypoints{$zone}[1]; # Get the continent ID from waypoints
          if (defined $continent_id && $continent_id < @$continents) {
              $continent_has_waypoints{$continents->[$continent_id]} = 1;
          }
      }

      # Display only those continents that have waypoints
      foreach my $continent (@$continents) {
          if ($continent_has_waypoints{$continent}) {
              my $mode_indicator = $text =~ /group/i ? ":group" : "";
              $client->Message(257, "-[ " . quest::saylink($continent . $mode_indicator, 1, $continent));
          }
      }
  }

  elsif ($text =~ /^(.+?)(:group)?$/) { # Capture the location and optional group indicator
    my $location = $1; # This captures the actual location name
    my $is_group_transport = defined $2; # True if it's a group transport

    if (!$is_group_transport || $group_flg) {
      if ($text =~ /^($continent_regex)(:group)?$/i) {
        my $continent = ucfirst(lc($1));
        my $suffix = plugin::get_suffix_by_continent($continent);
        my $continent_data = $zone_data->{$suffix};
      
        # Check if we're in the stage of selecting a location
        if ($continent_data && ref($continent_data) eq 'HASH') {
            $client->Message(257, " ------- Select a Location ------- ");
            foreach my $key (keys %{$continent_data}) {
                my $mode_indicator = $is_group_transport ? ":group" : "";
                $client->Message(257, "-[ " . quest::saylink($key . $mode_indicator, 1, $key));
            }
        }
      }
      
      # Execute transport when a specific location is selected
      if (exists($flat_data->{$location})) {
        my $zone_id = quest::GetZoneID($flat_data->{$location}[0]);
        my $x = $flat_data->{$location}[1];
        my $y = $flat_data->{$location}[2];
        my $z = $flat_data->{$location}[3];
        my $heading = $flat_data->{$location}[4];  

        if ($client->TakeMoneyFromPP($cost, 1)) { 

          if ($is_group_transport) {
            my $raid = $client->GetRaid();
            if($raid) {
              for($count = 0; $count < $raid->RaidCount(); $count++) {
                my $player = $raid->GetMember($count);
                if($player) {
                  if($player->IsClient() && $client->CharacterID() != $player->CharacterID()) {
                    $player->CastToClient()->MovePC($zone_id, $x, $y, $z, $heading);
                  }
                }
              }
            }

            my $group = $client->GetGroup();
            if ($group) {
              for (my $count = 0; $count < $group->GroupCount(); $count++) {
                  my $player = $group->GetMember($count);
                  if ($player && $client->CharacterID() != $player->CharacterID()) {
                      $player->CastToClient()->MovePC($zone_id, $x, $y, $z, $heading);
                  }
              }
            }
          }

          $client->MovePC($zone_id, $x, $y, $z, $heading);
        } else {
          quest::say("I'm sorry, but you don't have enough platinum to pay for this transport.");
        }
      }
    }
  }
}

sub EVENT_ITEM {
    my %portal_destinations = %{ plugin::get_portal_destinations() };
    
    foreach my $item (keys %portal_destinations) {
        if (plugin::check_handin(\%itemcount, $item => 1)) {
            # Set the destination using the item ID
            quest::set_data("magic_map_target", $item); 
            quest::emote("takes the crystal from you and mutters some arcane words over it. 'The floating map is now active! Just click on the map and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
            quest::ze(15, "The Magic Map has been aligned to " . $portal_destinations{$item}[0]);
            plugin::return_items(\%itemcount);
            return;
        }
    }

    plugin::return_items(\%itemcount); # Ensure items are returned if no matching case is found
}

sub get_cost_for_level {
  my $client = plugin::val('$client');
  my $level  = $client->GetLevel();

  my %cost_map = (
    0  => 10,  # Default for levels 1-50
    51 => 25,  # Cost for levels 51-60
    61 => 75,  # Cost for levels 61-65
    66 => 150, # Cost for levels above 65
  );

  for my $threshold (sort { $b <=> $a } keys %cost_map) {
    return $cost_map{$threshold} if $level >= $threshold;
  }
}