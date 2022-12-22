sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("Hello, $name. If you give me a rose colored or apocryphal dark elf illusion mask, I can change you permanently into a Dark Elf.");
    }
}

sub EVENT_ITEM 
{    
    if (plugin::check_handin(\%itemcount, 72469 => 1)  || # Rose Colored Guise of the Deceiver
        #plugin::check_handin(\%itemcount, 72469 => 1) || # Rose Colored Guise of the Deceiver
        plugin::check_handin(\%itemcount, 82469 => 1) || # Apocryphal Guise of the Deceiver
        #plugin::check_handin(\%itemcount, 2472 => 1)  || # Mask of Deception
        plugin::check_handin(\%itemcount, 72472 => 1) || # Rose Colored Mask of Deception
        plugin::check_handin(\%itemcount, 82472 => 1))   # Apocryphal Mask of Deception
    {
        quest::say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are.");
        quest::say("(Log out to see your changes)");
        $client->SetBaseRace(6);
    }
    plugin::return_items(\%itemcount);
}