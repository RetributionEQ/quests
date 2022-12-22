sub EVENT_SAY {
    $key = $client->AccountID() . "-kunark-flag";
    $expansion = quest::get_data($key);

    $nagkey = $client->AccountID() . "nag";
    $voxkey = $client->AccountID() . "vox";

    if ($text=~/hail/i){
        
        if ($expansion >= 2)
        {
            plugin::Whisper("You have already unlocked the Ruins of Kunark!");
            return;
        }

        if($expansion < 2){
            plugin::Whisper("Ah... I see you have yet to unlock Kunark! You have two options. One is the route of the [hero]. The other, is the route of the [collector].");
        }

    }

    if ($text =~/hero/i){
        plugin::Whisper("You enjoy spilling blood, don't you? Fair enough! Find the Lost Iksars of Fire and Ice.");
        
        if ($expansion < 2) {
            $progressionCount = 2;
            $progressCount = 0;
            $progressText = "";
            if (quest::get_data($client->AccountID() . "nag") > 0) {
                $progressCount++;
                $progressText .= "Lord Nagafen in Nagafen's Lair, ";
            }

            if (quest::get_data($client->AccountID() . "vox") > 0) {
                $progressCount++;
                $progressText .= "Lady Vox in Permafrost, ";
            }

            if ($progressionCount > 0) {
                $progressText = substr($progressText, 0, -2);
                plugin::Whisper("You have defeated $progressCount of $progressionCount targets: $progressText.");
            }
        }
    }
    if (($text =~/collector/i) && ($expansion <2)){
        plugin::Whisper("You are one of patience, I see. All you need to do is bring me an Apocryphal Elemental Binder, an Apocryphal Djarn's Amethyst Ring, an Apocryphal Crown of the Froglok Kings, and an Apocryphal Scalp of the Ghoul Lord");
    }
}

sub EVENT_ITEM {
    $key = $client->AccountID() . "-kunark-flag";
    $expansion = quest::get_data($key);

    $nagkey = $client->AccountID() . "nag";
    $voxkey = $client->AccountID() . "vox";

    if ($expansion < 2){
        if (plugin::takeItems(828043 => 1, 810366 => 1, 810142 => 1, 826997 =>1)) {
		    plugin::Whisper("Here are three tokens. Hand them back to me for your flag!");
            quest::ding();
            quest::exp(100000);
            quest::summonfixeditem(99100);
            quest::summonfixeditem(99100);
            quest::summonfixeditem(99100);
        }
        if (plugin::takeItems(99100 => 1)) {
		    plugin::Whisper("Beware of the evils that lurk Kunark $name!");
            quest::ding();
            quest::set_data($key, 2);
            quest::set_data($nagkey, 1);
            quest::set_data($voxkey, 1);
	    }
	    #:: Return unused items
    }
    
	    plugin::returnUnusedItems();
}