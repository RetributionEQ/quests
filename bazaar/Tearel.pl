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

      # Get the list of all continents
      my @categories = plugin::GetContinents();

      # Display only those continents which have waypoints
      while (my ($index, $continent) = each @categories) {
          if (plugin::GetWaypoints($index, $client)) {  
              my $mode_indicator = $text =~ /group/i ? "group" : "single";
              $client->Message(257, "-[ " . quest::saylink("select-continent-$index-$mode_indicator", 0, $continent));
          }
      }
  }

  elsif ($text =~ /select-continent-(\d+)-(group|single)/) {
    my $continent_id = $1;  # This captures the numerical ID.
    my $mode = $2;
    my %waypoints = plugin::GetWaypoints($continent_id, $client);

    $client->Message(257, " ------- Select a Location ------- ");

    if (keys %waypoints) {
      foreach my $wp_id (keys %waypoints) {
        $client->Message(257, "-[ " . quest::saylink("teleport-$wp_id-$2"));
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