sub EVENT_SAY {
    if ($text=~/hail/i) {
        
    }
}

sub EVENT_ITEM {
    foreach my $item (keys %itemcount) {
        if ($item > 0) {
            quest::debug($item . " : " . $itemcount->{$item});
        }
    }
}