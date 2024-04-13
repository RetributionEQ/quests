sub EVENT_SAY {
    if ($faction <= 5) {
        if ($text =~ /hail/i) {
            quest::say("Hmm, I have been watching you. You made it further than I thought you would. I will have to work on my defenses in the future. So, what do you seek of me?");
        }
        elsif ($text =~ /Jaled Dar/i) {
            quest::say("Jaled Dar is quite dead, you know. But he was tasty, I feasted on his remains long ago. I do wish his spirit would go away, his incessant wailing disturbs me, and worse, it makes other dragons wary of this place. I have not eaten as well as I would have liked since his shade came to stay. If you wish to speak with him yourself, I can arrange that, for I hold a key that will unlock his tomb.");
        }
        elsif ($text =~ /key/i) {
            quest::say("This IS my realm, after all. Nothing is barred to me. But I did not become who I am by doing something for nothing. If you wish to talk to Jaled Dar, you will have to do something for me first. Are you willing to do this task?");
        }
        elsif ($text =~ /task/i) {
            quest::say("There is an annoying uprising taking place among the Chetari and Paebala. This is affecting my diet. I get cranky when I don't eat right. I am VERY cranky right now. The rebellion is led by a Paebala named Neb. He has taken his followers into a part of the Necropolis that I have difficulty reaching, and he has somehow tamed the goo there as well, preventing my Chetari followers from assaulting them directly. If Neb were to fall, I am certain the rebellion would quickly falter. Bring me Neb's head, and I will give you the key to Jaled Dar's tomb.");
        }
    }
}

sub EVENT_TRADE {
    my $item1 = 26010; # Nebs Head
    my $item2 = 28060; # Jaled Dars Tomb Key

    if ($faction <= 5) {
        if (plugin::check_handin(\%itemcount, $item1 => 1)) {
            quest::say("Excellent work! Here is your key, go bother that prattling fool Jaled Dar, and leave me be.");
            $client->Message(15, "You have gained an item."); # Ding message
            quest::summonitem($item2);  # Jaled Dars Tomb Key
            quest::faction(462, 50);    # Chetari
            quest::faction(464, 500);   # Zlandicar
            quest::faction(430, -50);   # Claws of Veeshan
            quest::faction(304, -50);   # Ring of Scale
            quest::exp(250000);
        }
    }
    plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
    plugin::handle_death($npc, $x, $y, $z, $entity_list);
}

sub EVENT_KILLED_MERIT {
    plugin::handle_killed_merit($npc, $client, $entity_list);
}