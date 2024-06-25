
sub EVENT_SIGNAL {
    if ($signal = 666) {
        plugin::UpdateEoMAward($client);
    }

    if ($signal == 100) {
        plugin::CheckWorldWideBuffs($client);
    } else {
        # Title Semaphore from lua scripts
        my $semaphore_title = $client->GetBucket('flag-semaphore');
        if ($semaphore_title) {
            plugin::AddTitleFlag($semaphore_title, $client);
            $client->DeleteBucket('flag-semaphore');
        }

        plugin::EnableTitles($client);
    }
}

sub EVENT_ENTERZONE { 
	plugin::CommonCharacterUpdate($client);    
	if (!plugin::is_eligible_for_zone($client, $zonesn)) {
		$client->Message(4, "Your vision blurs. You lose conciousness and wake up in a familiar place.");
		$client->MovePC(151, 185, -835, 4, 390); # Bazaar Safe Location.
	}
}

sub EVENT_CONNECT {
    plugin::CommonCharacterUpdate($client);  
    if (!$client->GetBucket("First-Login")) {
        $client->SetBucket("First-Login", 1);
		$client->SummonItem(18471); #A Faded Writ
        $client->Message(263, "You find a small note in your pocket.");
		$client->SetBucket('FirstLogin', 1);

        my $name = $client->GetCleanName();
        my $full_class_name = plugin::GetPrettyClassString($client);

        plugin::WorldAnnounce("$name ($full_class_name) has logged in for the first time.");        
        plugin::AwardSeasonalItems($client);
    }

    if (!plugin::is_eligible_for_zone($client, $zonesn)) {
		$client->Message(4, "Your vision blurs. You lose conciousness and wake up in a familiar place.");
		$client->MovePC(151, 185, -835, 4, 390); # Bazaar Safe Location.
	}
}

sub EVENT_LEVEL_UP {
    plugin::CommonCharacterUpdate($client);

    my $new_level = $client->GetLevel();
    if (($new_level % 10 == 0) || $new_level == 5 || $new_level == $client->GetBucket("CharMaxLevel")) {
        my $name = $client->GetCleanName();
        my $full_class_name = plugin::GetPrettyClassString($client);

        my $capped = $new_level == $client->GetBucket("CharMaxLevel") ? " (Level Cap)" : "";

        plugin::WorldAnnounce("$name ($full_class_name) has reached Level $new_level$capped.");
    }
}

sub EVENT_CLICKDOOR {
	my $target_zone = plugin::get_target_door_zone($zonesn, $doorid, $version);

    if (!plugin::is_eligible_for_zone($client, $target_zone, 1)) {		
		return 1;
    }
}

sub EVENT_ZONE { 
    # TO-DO: Use magic to determine where we zoned from, then find the reverse zone connection landing point and send us there.
}

sub EVENT_WARP {
    my $name = $client->GetCleanName();
    my $current_x = $client->GetX();
    my $current_y = $client->GetY();
    my $current_z = $client->GetZ();

    quest::debug("from_x " . $from_x);
    quest::debug("from_y " . $from_y);
    quest::debug("from_z " . $from_z);
    quest::debug("current_x " . $current_x);
    quest::debug("current_y " . $current_y);
    quest::debug("current_z " . $current_z);    

    my $distance = sqrt(($current_x - $from_x) ** 2 + ($current_y - $from_y) ** 2 + ($current_z - $from_z) ** 2);

    my $flag1 = "";
    my $flag2 = "";

    if ($distance > 100) {
        my $flag1 = "(Warp distance greater than 100 units: $distance)";
    }

    if (($current_x % 2 == 0) && ($current_y % 2 == 0) && ($current_z % 2 == 0)) {
        quest::debug("Target coordinates are all even numbers: ($current_x, $current_y, $current_z)");
    }

    quest::discordsend("admin", "Warp Detected. Character: $name Zone: $zonesn From: $from_x, $from_y, $from_z To: $current_x, $current_y, $current_z $flag1 $flag2");
}


sub EVENT_DISCOVER_ITEM {
    my $name = $client->GetCleanName();
    
    # Only announce upgraded items
    if ($itemid > 999999) {        
        plugin::WorldAnnounceItem("$name has discovered: {item}.",$itemid);  
    }  
}

sub EVENT_COMBINE_VALIDATE {
	if ($recipe_id == 10344) {
		if ($validate_type =~/check_zone/i) {
			if ($zone_id != 289 && $zone_id != 290) {
				return 1;
			}
		}
	}
	
	return 0;
}

sub EVENT_COMBINE_SUCCESS {
    if ($recipe_id =~ /^1090[4-7]$/) {
        $client->Message(1,
            "The gem resonates with power as the shards placed within glow unlocking some of the stone's power. ".
            "You were successful in assembling most of the stone but there are four slots left to fill, ".
            "where could those four pieces be?"
        );
    }
    elsif ($recipe_id =~ /^10(903|346|334)$/) {
        my %reward = (
            melee  => {
                10903 => 67665,
                10346 => 67660,
                10334 => 67653
            },
            hybrid => {
                10903 => 67666,
                10346 => 67661,
                10334 => 67654
            },
            priest => {
                10903 => 67667,
                10346 => 67662,
                10334 => 67655
            },
            caster => {
                10903 => 67668,
                10346 => 67663,
                10334 => 67656
            }
        );
        my $type = plugin::ClassType($class);
        quest::summonfixeditem($reward{$type}{$recipe_id});
        quest::summonfixeditem(67704); # Item: Vaifan's Clockwork Gemcutter Tools
        $client->Message(1,"Success");
    }
}

sub EVENT_SAY {
	if ($client->GetGM()) {
		if ($text=~/enable seasonal/i) {
			plugin::EnableSeasonal($client);
			$client->Message(15, "Seasonal Enabled");
            $client->Message(15, "IsSeasonal() == " . plugin::IsSeasonal($client));
		} elsif ($text=~/disable seasonal/i) {
			plugin::DisableSeasonal($client);
			$client->Message(15, "Seasonal Disabled");
            $client->Message(15, "IsSeasonal() == " . plugin::IsSeasonal($client));
		} elsif ($text=~/diag/i) {
            $client->Message(15, "Season: " . plugin::GetSeasonID());
            $client->Message(15, "IsSeasonal? : " . plugin::IsSeasonal($client));
            $client->Message(15, "IsSeasonal? : " . $client->IsSeasonal());
            $client->Message(14, "MC:? " . plugin::MultiClassingEnabled());

            quest::debug("zone: $zonesn". plugin::is_eligible_for_zone($client, $zonesn));

            quest::discordsend('admin', "TEST!");

            my ($sec, $min, $hour, $day, $mon, $year) = localtime();
            $year += 1900; # Adjust year to get the current year
            $mon++;
            plugin::YellowText("Date: $year-$mon-$day");
        }
	}
}