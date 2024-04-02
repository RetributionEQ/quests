sub EVENT_DEATH_COMPLETE {
    plugin::handle_death($npc, $npc->GetSpawnPointX() || $x, $npc->GetSpawnPointY() || $y, $npc->GetSpawnPointZ() || $z, $entity_list);
}

sub EVENT_KILLED_MERIT {
    plugin::handle_killed_merit($npc, $client, $entity_list);
}