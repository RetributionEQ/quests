
sub EVENT_SPAWN {
  quest::settimer("appearance", 1);
}

sub EVENT_TIMER {
  quest::stoptimer("appearance");
  $npc->SetAppearance(3);
}


sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("Hello, $name. If you give me a rose colored or apocryphal iksar hide mask, I can change you permanently into an Iksar.");
    }
}

sub EVENT_ITEM 
{    
    if (plugin::check_handin(\%itemcount, 72741 => 1)  || # Rose Colored Iksar Hide Mask
        plugin::check_handin(\%itemcount, 82741 => 1)) # Apocryphal Iksar Hide Mask
    {
        quest::say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are.");
        quest::say("(Log out to see your changes)");
        $client->SetBaseRace(128);
    }
    plugin::return_items(\%itemcount);
}