
sub EVENT_SAY {
    $key = $client->AccountID() . "-kunark-flag";
    $expansion = quest::get_data($key);
    if ($text=~/hail/i) {
        if ($expansion >= 6) {
            plugin::Whisper("You have already unlocked Velious!");
            return;
        }
        
 
        if ($expansion < 6) {
            plugin::Whisper("Ah... I see you have yet to unlock Velious! You have two options. One is the route of the [hero]. The other, is the route of the [collector].");
        }
        return;
    }

    if (($text =~/collector/i) && ($expansion <6)){
      quest::say("You are one of patience, I see. All you need to do is bring me an Apocryphal Mask of Secrets, an Apocryphal Sebilite Scale Mask, an Apocryphal Helot Skull Helm, and an Apocryphal Helm of the Rile");
      return;
    }
    if ($text =~/hero/i) {
        quest::say("Find my missing brothers. The last I heard of them, they were studying the dragons of Kunark.");
        $progressionCount = 0;
        $progressText = "";
        if (quest::get_data($client->AccountID() . "trak") > 0) {
            $progressCount++;
            $progressText += "Trakanon in Sebilis, ";
        }

        if (quest::get_data($client->AccountID() . "tal") > 0) {
            $progressCount++;
            $progressText += "Talendor in Skyfire, ";
        }

        if (quest::get_data($client->AccountID() . "goren") > 0) {
            $progressCount++;
            $progressText += "Gorenaire in Dreadlands, ";
        }

        if (quest::get_data($client->AccountID() . "sev") > 0) {
            $progressCount++;
            $progressText += "Severilous in Emerald Jungle, ";
        }

        if ($progressionCount > 0 && $progressionCount <= 8) {
            $progressText = substr($progressText, 0 -2);
            plugin::Whisper("You have defeated $progressionCount of $progressionCount targets: $progressText.");
        }
    }
}

sub EVENT_ITEM {
$key = $client->AccountID() . "-kunark-flag";
$expansion = quest::get_data($key);

$nagkey = $client->AccountID() . "nag";
$voxkey = $client->AccountID() . "vox";

      if ($expansion < 6){
    if (plugin::takeItems(85772 => 1, 83201 => 1, 81414 => 1, 84578 =>1)) {
		quest::say("Here are three tokens. Hand them back to me for your flag!");
    quest::summonfixeditem(99101);
    quest::summonfixeditem(99101);
    quest::summonfixeditem(99101);

		quest::ding();
		quest::exp(1000000);
    }
    if (plugin::takeItems(99101 => 1)){
		quest::say("Beware of the evils that lurk Velious $name!");
    quest::ding();
    quest::set_data($key, 6);
    quest::set_data($gorenkey, 1);
    quest::set_data($sevkey, 1);
    quest::set_data($talkey, 1);
    }
      }
      plugin::return_items(\%itemcount);
}