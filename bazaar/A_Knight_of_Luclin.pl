sub EVENT_SAY {
    $key = $client->AccountID() . "-kunark-flag";
    $expansion = quest::get_data($key);
	
    if ($text=~/hail/i) {
        if ($expansion >= 14) {
            plugin::Whisper("EXCEPTIONAL! It looks like you are ready to join us in the battle for the future of Luclin! Good luck to you, hero!");
        }

        if ($expansion < 14) {
            plugin::Whisper("Ah... I see you have yet to unlock Luclin! You have two options. One is the route of the [hero]. The other, is the route of the [collector].");
        }

            if ($text =~/hero/i) {
            plugin::Whisper("Refinement by fire is the only way we will be ready for Aten Ha Ra. Slay the mighty dragons of Velious.");
            $progressionCount = 8;
		    $progressCount = 0;
            $progressText = "";
            if (quest::get_data($client->AccountID() . "sky") > 0) {
            $progressCount++;
            $progressText .= "Yelinak in Skyshrine, ";
            }

            if (quest::get_data($client->AccountID() . "sleepers") > 0) {
            $progressCount++;
            $progressText .= "Tukaarak the Warder in Sleepers Tomb, ";
            }

            if (quest::get_data($client->AccountID() . "sle") > 0) {
            $progressCount++;
            $progressText .= "Nanzata the Warder in Sleepers Tomb, ";
            }

            if (quest::get_data($client->AccountID() . "slee") > 0) {
            $progressCount++;
            $progressText .= "Ventani the Warder in Sleepers Tomb, ";
            }

            if (quest::get_data($client->AccountID() . "sleep") > 0) {
            $progressCount++;
            $progressText .= "Hraasha the Warder in Sleepers Tomb, ";
            }

            if (quest::get_data($client->AccountID() . "wuo") > 0) {
            $progressCount++;
            $progressText .= "Wuoshi in Wakening Lands, ";
            }

            if (quest::get_data($client->AccountID() . "kla") > 0) {
            $progressCount++;
            $progressText .= "Klandicar in the Western Wastes, ";
            }

            if (quest::get_data($client->AccountID() . "zla") > 0) {
            $progressCount++;
            $progressText .= "Zlandicar in Dragon Necropolis, ";
            }

            if ($progressCount > 0) {
            $progressText = substr($progressText, 0, -2);
            plugin::Whisper("You have defeated $progressCount of $progressionCount targets: $progressText.");
            }
        }

     if (($text =~/collector/i) && ($expansion <14)){
      plugin::Whisper("You are one of patience, I see. All you need to do is bring me an Apocryphal Stronghorn's Horn, an Apocryphal Shackle of Auctoritias, an Apocryphal Sword of Pain, and an Apocryphal Siren Hair Earring");
      return;
    }
}

sub EVENT_ITEM {
  $key = $client->AccountID() . "-kunark-flag";
  $expansion = quest::get_data($key);

  if ($expansion < 14){
    if (plugin::takeItems(827200 => 1, 84189 => 1, 825319 => 1, 824741 =>1)) {
      plugin::Whisper("Here are three tokens. Hand them back to me for your flag!");
      quest::summonfixeditem(99102);
      quest::summonfixeditem(99102);
      quest::summonfixeditem(99102);

      quest::ding();
      quest::exp(1000000);
    }
    
    if (plugin::takeItems(99102 => 1)){
      plugin::Whisper("Beware of the evils that lurk Luclin $name!");
      quest::ding();
      quest::set_data($client->AccountID() . "sky", 1);
      quest::set_data($client->AccountID() . "sle", 1);
      quest::set_data($client->AccountID() . "slee", 1);
      quest::set_data($client->AccountID() . "sleep", 1);
      quest::set_data($client->AccountID() . "sleepers", 1);
      quest::set_data($client->AccountID() . "zla", 1);
      quest::set_data($client->AccountID() . "kla", 1);
      quest::set_data($client->AccountID() . "wuo", 1);

      quest::set_data($key, 14);
    }       
  }
  plugin::returnUnusedItems();
}