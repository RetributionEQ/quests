my @rewards = (
    { range => [0, 24],    items => [36995, 57825, 64489, 57819, 57818, 37538], message => "Better luck next time! Here, have some food. A loss is better on a full stomach!" },
    { range => [25, 49],   items => [56942, 56940, 56938, 56934, 56935, 56944, 56937], message => "Better luck next time! Here, drink this down, it should cheer you up!" },
    { range => [50, 70],   items => [41961, 48083], message => "Let the experience flow!" },
    { range => [71, 81],   items => [67923, 56052, 61036, 62774, 66783, 64711, 66431, 66449, 67953, 67883, 52193, 66598, 61979, 67145, 66564], message => "Nicely done! Pets love a facelift every now and then \$name!" },
    { range => [82, 87],   items => [37954, 67008, 43993, 37999, 40638, 40714, 40686, 50854, 40656, 31861], message => "An illusion?! In case I don't recognize you next time, congratulations \$name!" },
    { range => [88, 90],   items => [59508, 59513, 43970, 57798, 54983, 60437, 52098, 64560, 54934, 60945, 62787, 57191], message => "Wow! Looks like \$name will be traveling in style now!" },
    { range => [91, 92],   items => [52024], message => "Urthron's... what?! How'd that get in there?! Congratulations \$name!" },
    { range => [93, 95],   items => [976008], message => "Oooo! Your very own Clockwork Banker \$name!" },
    { range => [96, 98],   items => [976009], message => "Your friends will be SO jealous! Congratulations on your Clockwork Merchant \$name!" },
    { range => [99, 100],  items => [36995, 57825, 64489, 57819, 57818, 37538], message => "Better luck next time! Here, have some food. A loss is better on a full stomach!" }
);

sub EVENT_SAY {
    if ($text =~ /hail/i) {
        quest::say("Well looky there! Feeling lucky? Come win a prize! Mounts, Petamorph Wands, Illusions, Clockwork friends... 
                    delicious foods and potions to boot! If you want to try your luck at a game of chance, simply hand me 5,000 
                    platinum pieces, or consider donating to wager five [Echo of Memory], I'll accept those, too!");
    }
    if ($text =~ /Echo of Memory/i) {
        if (plugin::SpendEOM($client, 5)) {
            GetRandomResult();
        } else {
            quest::say("You don't have enough Echoes of Memory, dear friend. Come back when you do!");
        }
    }
}

sub EVENT_ITEM {
    foreach my $key (keys %itemcount) {
        my $value = $itemcount{$key};
        quest::debug("Key: $key, Value: $value");
    }

    if (plugin::CheckCashPayment(5000000, $copper, $silver, $gold, $platinum)) { # 5000 Platinum
        GetRandomResult();    
    } else {
        quest::say("You'll need to give me enough money for the casino ticket!");
    }
    plugin::return_items(\%itemcount);
}

sub GetRandomResult {
    quest::say("Okay, here we go! Rolling the dice!");
    my $random_result = int(rand(100));
    
    foreach my $reward (@rewards) {
        if ($random_result >= $reward->{range}[0] && $random_result <= $reward->{range}[1]) {
            quest::summonfixeditem(quest::ChooseRandom(@{$reward->{items}}));
            quest::say($reward->{message});
            return;  # Exit the subroutine after finding the matching range and processing the reward
        }
    }
}