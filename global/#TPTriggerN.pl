sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();

    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {    
    quest::debug("Attempting to update attunement point...");    

    my $client = plugin::val('$client');

    if (plugin::AddWaypoint($zonesn, $client)) {
        $client->Message(16, "This place seems familiar. You are sure to remember it later.");
    } else {
        
    }
}