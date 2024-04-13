sub EVENT_SLAY {
    quest::spawn2(179136, 0, 0, $npc->GetX() - 10, $npc->GetY(), $npc->GetZ(), $npc->GetHeading()); # NPC: A_mind_worm
    quest::spawn2(179136, 0, 0, $npc->GetX() + 10, $npc->GetY(), $npc->GetZ(), $npc->GetHeading()); # NPC: A_mind_worm
    quest::spawn2(179136, 0, 0, $npc->GetX(), $npc->GetY() - 10, $npc->GetZ(), $npc->GetHeading()); # NPC: A_mind_worm
    quest::spawn2(179136, 0, 0, $npc->GetX(), $npc->GetY() + 10, $npc->GetZ(), $npc->GetHeading()); # NPC: A_mind_worm
    quest::spawn2(179136, 0, 0, $npc->GetX(), $npc->GetY() + 15, $npc->GetZ(), $npc->GetHeading()); # NPC: A_mind_worm
}

sub EVENT_DEATH_COMPLETE {
    plugin::handle_death($npc, $x, $y, $z, $entity_list);
}

sub EVENT_KILLED_MERIT {
    plugin::handle_killed_merit($npc, $client, $entity_list);
}