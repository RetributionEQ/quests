sub EVENT_SAY {
    quest::debug("data " . $data);
    quest::debug("text " . $text);
    quest::debug("langid " . $langid);

    if($text=~/hail/i) {
        quest::say("Do you remember that item being stronger than it is?... That's because it was. Bring me four of any basic item and 500pp and I will give you a version worthy of your Rose Colored memories. Bring me four copies of any Rose Colored item  and 2,000pp and I will give you exactly what your memory desires- absolute Apocrypha.");
    }
}

sub EVENT_ITEM {
    quest::debug("QuestItem " . $QuestItem);
    quest::debug("copper " . $copper);
    quest::debug("silver " . $silver);
    quest::debug("gold " . $gold);
    quest::debug("platinum " . $platinum);

    my $platinum_cost = 0;
    my $eligible_item = 0;
    foreach my $item (keys %itemcount) {
        quest::debug("$item has count: " . $itemcount->{$item});
        # Check if the item count is a number before comparing it to 4
        if ($itemcount->{$item} =~ /^\d+$/) {  # This regex checks if $itemcount->{$item} is a whole number
            if ($itemcount->{$item} == 4) {
                quest::debug("test $item");
                $eligible_item = $item;
                last;  
            }
        } else {
            quest::debug("$item count is not numeric");
        }
    }

    if ($eligible_item) {
        if ($eligible_item < 1000000) {
            $eligible_item += 1000000;
            $platinum_cost = 500;
        } elsif ($eligible_item < 2000000) {
            $eligible_item += 2000000;
            $platinum_cost = 2000;
        }      
    }

    if ($eligible_item > 1000000) {
        if ($platinum >= $platinum_cost) {
            $client->SummonFixedItem($eligible_item);
            return;
        } else {
            quest::say("Cannot afford, Aporia needs to write better text here");
        }
    }

    quest::say("invalid items, Aporia needs to write better text here");
    plugin::return_items(\%itemcount);
}