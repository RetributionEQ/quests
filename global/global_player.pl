
sub EVENT_DISCOVER_ITEM {
	$itemname = quest::getitemname($itemid);
	quest::discordsend("ooc", "$name discovered $itemname!");
	quest::gmsay("$name discovered " . quest::varlink($itemid) . "!", 335, 1, 0, 0);
}

sub EVENT_CLICKDOOR {
	my $target_zone = plugin::get_target_door_zone($zonesn, $doorid, $version);

	if (!plugin::is_eligible_for_zone($client, $target_zone, 1)) {
		#Disallow Zone
		return 1;
	}
}

sub EVENT_ENTERZONE {
	if (!plugin::is_eligible_for_zone($client, $zonesn)) {
		$client->Message(4, "Your vision blurs. You lose conciousness and wake up in a familiar place.");
		$client->MovePC(151, 185, -835, 4, 390); # Bazaar Safe Location.
	}
}

sub EVENT_CONNECT {
	if (!$client->GetBucket("CharMaxLevel")) {
		$client->SetBucket("CharMaxlevel", 51); #By default, on initial log in (first time) we are setting Max Level to 51.
	}

	if (plugin::is_stage_complete($client, 'RoK') && $client->GetBucket("CharMaxLevel") == "51") {
		$client->SetBucket("CharMaxlevel", 60);
	}

	if (plugin::is_stage_complete($client, 'PoP') && $client->GetBucket("CharMaxLevel") == "60") {
		$client->SetBucket("CharMaxlevel", 65);
	}

	my %message_list = (
		'0' => "You have learned Bazaar Portal! Open up your AA window (Default V) to find it and other abilities!",
		'1' => "You have learned Infused by Rage, Killing Spree, and Vehement Rage! Open up your AA window (Default V) to find them!",
		'2' => "You have learned Twincast and Divine Arbitration! Open up your AA window (Default V) to find them!",
		'3' => "You have learned Divine Stun and Blessing of Life! Open up your AA window (Default V) to find them!",
		'4' => "You have learned Endless Quiver, Bow Mastery, Entrap, and Auspice of the Hunter! Open up your AA window (Default V) to find them!",
		'5' => "You have Mortal Coil and Explosion of Spite! Open up your AA window (Default V) to find them!",
		'6' => "You have learned Spirit of the Wood and Paralytic Spores! Open up your AA window (Default V) to find them!",
		'7' => "You have learned Stonewall and Crippling Strike! Open up your AA window (Default V) to find them!",
		'8' => "You have learned Fading Memories and Dance of Blades! Open up your AA window (Default V) to find them!",
		'9' => "You have learned Chaotic Stab and Shroud of Stealth! Open up your AA window (Default V) to find them!",
		'10' => "You have learned Group Shrink and Ancestral Aid! Open up your AA window (Default V) to find them!",
		'11' => "You have learned Death's Fury, Pet Affinity, and Pestilent Paralysis! Open up your AA window (Default V) to find them!",
		'12' => "You have learned Improved Familiar, Harvest of Druzzil, and Arcane Overkill! Open up your AA window (Default V) to find them!",
		'13' => "You have learned Companion's Fury, Pet Affinity, and Host in the Shell! Open up your AA window (Default V) to find them!",
		'14' => "You have learned Permanent Illusion, Project Illusion, Phantasmic Reflex, and Animation Empathy! Open up your AA window (Default V) to find them!",
		'15' => "You have learned Chameleon Strike! Open up your AA window (Default V) to find them!",
		'16' => "You have learned Killing Spree and Rampage! Open up your AA window (Default V) to find them!"
	);

	my %aa_list = (
		'0'  => [1000, 12636, 12637, 8445, 8446, 8447, 16419, 16420, 16421, 1021, 1022, 1023, 1024, 1025],
		'1'  => [6283, 6607, 4739, 1597], # Warrior AA abilities
		'2'  => [12652, 507, 746], # Cleric AA abilities
		'3'  => [188, 6395], # Paladin AA abilities
		'4'  => [205, 1196, 645, 1345], # Ranger AA abilities
		'5'  => [5085, 13165], # Shadow Knight AA abilities
		'6'  => [548, 14264, 767, 6375], # Druid AA abilities
		'7'  => [810, 1352], # Monk AA abilities
		'8'  => [630, 556, 557, 558, 559, 560, 1110, 225], # Bard AA abilities
		'9'  => [287, 605, 4739], # Rogue AA abilities
		'10' => [10957, 1327], # Shaman AA abilities
		'11' => [767, 6375, 734, 12770], # Necromancer AA abilities
		'12' => [155, 516, 5295], # Wizard AA abilities
		'13' => [8201, 734, 8342], # Mage AA abilities
		'14' => [158, 643, 10551, 580, 581, 582, 734], # Enchanter AA abilities
		'15' => [11080, 6984, 734], # Beastlord AA abilities
		'16' => [4739, 258] # Berserker AA abilities
	);

	if (!$client->GetBucket("InitialLoginFlag")) {
		foreach my $aa (@{$aa_list{'0'}}, @{$aa_list{$client->GetClass()}}) {
			quest::debug($aa);
			$client->IncrementAA(int($aa));
		}

		$client->Message(14, $message_list{$client->GetClass()});
		$client->Message(14, $message_list{'0'});

		$client->SetBucket("InitialLoginFlag", 1);
	}

	if (!$zonesn == 'guildhall') {
		if (!(plugin::is_eligible_for_race($client) || plugin::is_eligible_for_class($client))) {
			$client->SendToGuildHall();
		}
	} else {
		if (plugin::is_eligible_for_race($client) && plugin::is_eligible_for_class($client)) {
			$client->GoToBind();
		}
	}
}