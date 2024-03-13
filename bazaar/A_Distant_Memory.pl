sub EVENT_SAY {
    if ($text=~/hail/i) {
        
    }
}

sub EVENT_ITEM {
    my $item_count = 0;
    foreach my $item (keys %itemcount) {
        if ($item > 0) {
            $item_count++;
        }
        if ($item_count > 1) {
            quest::say("I am only willing to consider one item for upgrade at a time.");
            plugin::return_items(\%itemcount);
            plugin::CheckCashPayment(0, $copper, $silver, $gold, $platinum);
        }
    }

    foreach my $item (keys %itemcount) {
        if ($item > 0) {
            my @item_ids = plugin::GetItemUpgrades(plugin::GetBaseID($item));
            if (plugin::IsItemTier2($item) || ($item_ids[1] == undef || $item_ids[2] == undef)) {
                quest::say("I cannot infuse this item with any additional power.");
                plugin::return_items(\%itemcount);
            }
            
            else {
                my @item_counts = ($client->CountItem($item_ids[0]), 
                                   $client->CountItem($item_ids[1]), 
                                   $client->CountItem($item_ids[2]));

            }
        }
    }
}