sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();

    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {    
    quest::debug("Attempting to update attunement point...");    

    if (plugin::AddWaypoint($client, $zonesn)) {
        quest::message(15, "This place seems familiar. You are sure to remember it later.");
    }
}