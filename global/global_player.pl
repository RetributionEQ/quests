
sub EVENT_CLICKDOOR {
	my $target_zone = plugin::get_target_door_zone($zonesn, $doorid, $version);

	if (plugin::is_eligible_for_zone($client, $target_zone, 1)) {
		return 0;
	} else {
		return 1;
	}
}

sub EVENT_ENTERZONE {
	quest::debug("Just entered: $zonesn");
	quest::safemove();

}

sub EVENT_ZONE {
	my $zone_counter = $client->GetBucket("zone_counter") || 0;

	if ($zone_counter > 1) {
		return 0;
	}

	$client->SetBucket("zone_counter", $zone_counter++);
	return 1;
}

sub EVENT_CONNECT {
	if (!(plugin::is_eligible_for_race($client) && plugin::is_eligible_for_class($client))) {
		$client->SendToGuildHall();
	}

	if (plugin::is_stage_complete($client, 'RoK') && $client->GetBucket("CharMaxLevel") == "51") {
		$client->SetBucket("CharMaxlevel", 60);
	}

	if (plugin::is_stage_complete($client, 'PoP') && $client->GetBucket("CharMaxLevel") == "60") {
		$client->SetBucket("CharMaxlevel", 65);
	}

$bazkey = $client->CharacterID() . "baz";

if (quest::get_data($bazkey) == "") {
	quest::summonitem(18471);
    quest::set_data($bazkey, 1);
	
    $client->Message(15, "You have learned Bazaar Portal! Open up your AA window (Default V) to find it and other abilities!");
	$client->IncrementAA(1000); #origin
	$client->IncrementAA(12636); #Eyes Wide Open 1
	$client->IncrementAA(12637); #2
	$client->IncrementAA(8445); #3
	$client->IncrementAA(8446); #4
	$client->IncrementAA(8447); #5
	$client->IncrementAA(16419); #6
	$client->IncrementAA(16420); #7
	$client->IncrementAA(16421); #8
	$client->IncrementAA(1021); #Mystical Attuning 1
	$client->IncrementAA(1022); #2
	$client->IncrementAA(1023); #3
	$client->IncrementAA(1024); #4
	$client->IncrementAA(1025); #5
    
}

$maxlvl = $client->GetBucket("CharMaxLevel"); #Code for Max Level

if (($maxlvl) == "") {
	$client->SetBucket("CharMaxlevel", 51); #By default, on initial log in (first time) we are setting Max Level to 51.
}

if($PCClass == 1){ #War AA
	$waraa = $client->CharacterID() . "war";
	if (quest::get_data($waraa) == "") {
    quest::set_data($waraa, 1);
	$client->Message(15, "You have learned Infused by Rage, Killing Spree, and Vehement Rage! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(6283); #Infused by Rage
	$client->IncrementAA(6607); #Vehement Rage
	$client->IncrementAA(4739); #Killing Spree
	$client->IncrementAA(1597); #Call of Challenge
    

}
}

if($PCClass == 2){ #Clr AA
	$clraa = $client->CharacterID() . "clr";
	if (quest::get_data($clraa) == "") {
    quest::set_data($clraa, 1);
	$client->Message(15, "You have learned Twincast and Divine Arbitration! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(12652); #Twincast   
	$client->IncrementAA(507); #Divine Arbitration
	$client->IncrementAA(746); #Divine Avatar
    

}
}

if($PCClass == 3){ #Pal AA
	$palaa = $client->CharacterID() . "pal";
	if (quest::get_data($palaa) == "") {
    quest::set_data($palaa, 1);
	$client->Message(15, "You have learned Divine Stun and Blessing of Life! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(188); #Divine Stun
	$client->IncrementAA(6395); #Blessing of Life  
    

}
}

if($PCClass == 4){ #Rng AA
	$rngaa = $client->CharacterID() . "rng";
	if (quest::get_data($rngaa) == "") {
    quest::set_data($rngaa, 1);
	$client->Message(15, "You have learned Endless Quiver, Bow Mastery, Entrap, and Auspice of the Hunter! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(205); #Endless Quiver
	$client->IncrementAA(1196); #Bow Mastery 
	$client->IncrementAA(645); #Entrap
	$client->IncrementAA(1345); #Auspice of the Hunter   

}
}

if($PCClass == 5){ #SK AA
	$skaa = $client->CharacterID() . "sk";
	if (quest::get_data($skaa) == "") {
    quest::set_data($skaa, 1);
	$client->Message(15, "You have Mortal Coil and Explosion of Spite! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(5085); #Mortal Coil
	$client->IncrementAA(13165); #Explosion of Spite
    

}
}

if($PCClass == 6){ #Dru AA
	$druaa = $client->CharacterID() . "dru";
	if (quest::get_data($druaa) == "") {
    quest::set_data($druaa, 1);
	$client->Message(15, "You have learned Spirit of the Wood and Paralytic Spores! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(548); #Spirit of the Wood
	$client->IncrementAA(14264); #Paralytic Spores
	$client->IncrementAA(767); #Critical Affliction
	$client->IncrementAA(6375); #Destructive Cascade
    

}
}

if($PCClass == 7){ #Monk AA
	$mnkaa = $client->CharacterID() . "mnk";
	if (quest::get_data($mnkaa) == "") {
    quest::set_data($mnkaa, 1);
	$client->Message(15, "You have learned Stonewall and Crippling Strike! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(810); #Stonewall
	$client->IncrementAA(1352); #Crippling Strike
    

}
}

if($PCClass == 8){ #Bard AA
	$brdaa = $client->CharacterID() . "brd";
	if (quest::get_data($brdaa) == "") {
    quest::set_data($brdaa, 1);
	$client->Message(15, "You have learned Fading Memories and Dance of Blades! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(630); #Fading Memories
	$client->IncrementAA(556); #Harmonious Attack I
	$client->IncrementAA(557); #Harmonious Attack II
	$client->IncrementAA(558); #Harmonious Attack III
	$client->IncrementAA(559); #Harmonious Attack IV
	$client->IncrementAA(560); #Harmonious Attack V
	$client->IncrementAA(1110); #Dance of Blades
	$client->IncrementAA(225); #Jam Fest I
    

}
}

if($PCClass == 9){ #Rogue AA
	$rogaa = $client->CharacterID() . "rog";
	if (quest::get_data($rogaa) == "") {
    quest::set_data($rogaa, 1);
	$client->Message(15, "You have learned Chaotic Stab and Shroud of Stealth! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(287); #Chaotic Stab
	$client->IncrementAA(605); #Shroud of Stealth
	$client->IncrementAA(4739); #Killing Spree
    

}
}

if($PCClass == 10){ #Shaman AA
	$shmaa = $client->CharacterID() . "shm";
	if (quest::get_data($shmaa) == "") {
    quest::set_data($shmaa, 1);
	$client->Message(15, "You have learned Group Shrink and Ancestral Aid! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(10957); #Group Shrink
	$client->IncrementAA(1327); #Ancestral Aid
    

}
}

if($PCClass == 11){ #Necromancer AA
	$necaa = $client->CharacterID() . "nec";
	if (quest::get_data($necaa) == "") {
    quest::set_data($necaa, 1);
	$client->Message(15, "You have learned Death's Fury, Pet Affinity, and Pestilent Paralysis! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(767); #Critical Affliction
	$client->IncrementAA(6375); #Destructive Cascade
	$client->IncrementAA(734); #Pet Affinity
	$client->IncrementAA(12770); #Pestilent Paralysis

    

}
}

if($PCClass == 12){ #Wizard AA
	$wizaa = $client->CharacterID() . "wiz";
	if (quest::get_data($wizaa) == "") {
    quest::set_data($wizaa, 1);
	$client->Message(15, "You have learned Improved Familiar, Harvest of Druzzil, and Arcane Overkill! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(155); #Improved Familiar
	$client->IncrementAA(516); #Harvest of Druzzil
	$client->IncrementAA(5295); #Arcane Overkill


    

}
}

if($PCClass == 13){ #Mage AA
	$magaa = $client->CharacterID() . "mag";
	if (quest::get_data($magaa) == "") {
    quest::set_data($magaa, 1);
	$client->Message(15, "You have learned Companion's Fury, Pet Affinity, and Host in the Shell! Open up your AA window (Default V) to find it!");
	$client->IncrementAA(8201); #Companion's Fury
	$client->IncrementAA(734); #Pet Affinity
	$client->IncrementAA(8342); #Host in the Shell

    

}
}

if($PCClass == 14){ #Enchanter AA
	$encaa = $client->CharacterID() . "enc";
	if (quest::get_data($encaa) == "") {
    quest::set_data($encaa, 1);
	$client->Message(15, "You have learned Permanent Illusion, Project Illusion, Phantasmic Reflex, and Animation Empathy! Open up your AA window (Default V) to find them!");
	$client->IncrementAA(158); #Permanent Illusion
	$client->IncrementAA(643); #Project Illusion
	$client->IncrementAA(10551); #Phantasmic Reflex
	$client->IncrementAA(580); #Animation Empathy 1
	$client->IncrementAA(581); #Animation Empathy 2
	$client->IncrementAA(582); #Animation Empathy 3
	$client->IncrementAA(734); #Pet Affinity

    

}
}

if($PCClass == 15){ #Beastlord AA
	$blaa = $client->CharacterID() . "bl";
	if (quest::get_data($blaa) == "") {
    quest::set_data($blaa, 1);
	$client->Message(15, "You have learned Chameleon Strike! Open up your AA window (Default V) to find it!");
	$client->IncrementAA(11080); #Chameleon Strike
	$client->IncrementAA(6984); #Bite of the Asp
	$client->IncrementAA(734); #Pet Affinity

    

}
}

if($PCClass == 16){ #Zerker AA
	$zerkaa = $client->CharacterID() . "zerk";
	if (quest::get_data($zerkaa) == "") {
    quest::set_data($zerkaa, 1);
	$client->Message(15, "You have learned ! Open up your AA window (Default V) to find it!");
	$client->IncrementAA(4739); #Killing Spree
	$client->IncrementAA(258); #Rampage    
}
}

}

sub EVENT_SAY {
	$key = $client->AccountID() . "-kunark-flag";
    $expansion = quest::get_data($key);

if (($text =~ /Expansions/i) && ($expansion == 0)) {
	$client->Message(15, "You don't have any expansions unlocked!");

#  quest::say("You don't have any expansions unlocked!");
 }

 if (($text =~ /Expansions/i) && ($expansion == 1)) {
	$client->Message(15, "You don't have any expansions unlocked!");

 # quest::say("You don't have any expansions unlocked!");
 }

 if (($text =~ /Expansions/i) && ($expansion >= 2)) {
	$client->Message(15, "Expansions Unlocked: Kunark");

  #quest::say("Expansions Unlocked: Kunark");
 }
  if (($text =~ /Expansions/i) && ($expansion >= 6)) {
	$client->Message(15, "Expansions Unlocked: Velious");
	  #quest::say("Expansions Unlocked: Velious");
 }
  if (($text =~ /Expansions/i) && ($expansion >= 14)) {
	$client->Message(15, "Expansions Unlocked: Luclin");
	
#  quest::say("Expansions Unlocked: Luclin");
 }
  if (($text =~ /Expansions/i) && ($expansion >= 19 )) { #Change this to 19
	$client->Message(15, "Expansions Unlocked: Planes of Power");

 # quest::say("Expansions Unlocked: Planes of Power/Legacy of Ykesha");
 }

}

sub EVENT_DISCOVER_ITEM {
	$itemname = quest::getitemname($itemid);
	quest::discordsend("ooc", "$name discovered $itemname!");
	quest::gmsay("$name discovered " . quest::varlink($itemid) . "!", 335, 1, 0, 0);
}