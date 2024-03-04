#Altar_Adherent (294639)
sub EVENT_SPAWN {
  if(!defined($qglobals{$instanceid.adhere4})) {
    $adhere = int(rand(4)) + 1;
    quest::setglobal($instanceid.adhere4,$adhere,3,"H6");
  }
  else {
    $adhere = $qglobals{$instanceid.adhere4};
  }
}

sub EVENT_DEATH_COMPLETE {
  if ($status >= 80 ) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
    }
  elsif(((plugin::HasClass("Bard")) || (plugin::HasClass("Beastlord")) || (plugin::HasClass("Paladin")) || (plugin::HasClass("Ranger")) || (plugin::HasClass("Shadowknight"))) && ($qglobals{$instanceid.adhere4} == 2)) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
  }
  elsif(((plugin::HasClass("Berserker")) || (plugin::HasClass("Monk")) || (plugin::HasClass("Rogue")) || (plugin::HasClass("Warrior"))) && ($qglobals{$instanceid.adhere4} == 3)) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
  }
  elsif(((plugin::HasClass("Cleric")) || (plugin::HasClass("Druid")) || (plugin::HasClass("Shaman"))) && ($qglobals{$instanceid.adhere4} == 4)) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
  }
  elsif(((plugin::HasClass("Enchanter")) || (plugin::HasClass("Magician")) || (plugin::HasClass("Necromancer")) || (plugin::HasClass("Wizard"))) && ($qglobals{$instanceid.adhere4} == 1)) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
  }
  else {
    quest::spawn2(294639 ,0,0,$x,$y,$z,$h); # NPC: #Altar_Adherent___
	quest::ze(0,"Your energy didn't match that required to kill the stone worker.");
    if($adhere == 1) {
      quest::ze(0,"The creature will perish under the strength of intelligent magic");
    }
    if($adhere == 2) {
      quest::ze(0,"The creature appears weak to the combined effort of might and magic!");
    }
    if($adhere == 3) {
      quest::ze(0,"The creature appears weak to the combined effort of strength and cunning!");
    }
    if($adhere == 4) {
      quest::ze(0,"The creature cannot stand up to the power of healers");
    }
	quest::ze(0,"It reforms instantly!");
  }
}
