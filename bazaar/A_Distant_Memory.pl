sub EVENT_SAY {
    if ($text=~/hail/i) {
        quest::say("Do you remember that item being stronger than it is?... That's because it was. Bring me four of any basic item 
                    and 500pp and I will give you a version worthy of your Rose Colored memories. Bring me four copies of any 
                    Rose Colored item and 2,000pp and I will give you exactly what your memory desires- absolute Apocrypha.");
    }
}

sub EVENT_ITEM {
    my $found_item_id   = 0; 
    foreach my $item (keys %itemcount) {
        if ($item > 0) {
            $found_item_id = $item;            
            last;
        } elsif (plugin::IsItemTier2($item)) {
            quest::say("This object is already Apocryphal. I can do nothing further.");
            $found_item_id = -1;
        }
    }

    my @upgrades = plugin::GetUpgrades(plugin::GetBaseID($found_item_id));

    if ($found_item_id > 0 && (plugin::IsItemTier0($found_item_id) && !defined($upgrades[1]) || (plugin::IsItemTier1($found_item_id) && !defined($upgrades[2])))) {
        quest::say("This object has no further potential to unlock.");
        $found_item_id = -1;
    }

    if ($found_item_id >= 0) {
        if ($itemcount{$found_item_id} < 4 || $found_item_id == 0) {
            quest::say("You need to give me exactly four identical objects that you want me to upgrade.");
        } else {
            my $platinum_cost = 0;
            my $upgrade_item  = 0;
            
            if (defined($upgrades[1]) && $found_item_id < 1000000) {
                $platinum_cost = 500;
                $upgrade_item  = $upgrades[1];
            } elsif (defined($upgrades[2]) && $found_item_id < 2000000) {
                $platinum_cost = 2000;
                $upgrade_item  = $upgrades[2];
            } else {
                quest::say("I cannot upgrade this object.");
            }

            if ($upgrade_item > 0 && plugin::CheckCashPayment($platinum_cost * 1000, $copper, $silver, $gold, $platinum)) {
                quest::say("Here. Infused with greater power.");
                $client->SummonFixedItem($upgrade_item);
                return;
            } else {
                quest::say("You did not give me enough money to pay for this infusion.");
            }
        }
    }

    plugin::CheckCashPayment(0, $copper, $silver, $gold, $platinum);
    plugin::return_items(\%itemcount, 1);
}