sub EVENT_DEATH_COMPLETE {
    plugin::handle_death($npc, $npc->GetSpawnPointX() || $x, $npc->GetSpawnPointY() || $y, $npc->GetSpawnPointZ() || $z, $entity_list);
    
    my $ventani = $entity_list->GetMobByNpcTypeID(128091);
    my $tukaarak = $entity_list->GetMobByNpcTypeID(128092);
    my $hraashna = $entity_list->GetMobByNpcTypeID(128093);

    if (!$ventani && !$tukaarak && !$hraashna) {
        quest::shout("Warders, I have fallen. Prepare yourselves, these fools are determined to unleash doom!");
    } else {
        quest::shout("Warders, I have fallen. Prepare yourselves, these fools are determined to unleash doom!");
    }
}

sub EVENT_KILLED_MERIT {
    plugin::handle_killed_merit($npc, $client, $entity_list);
}