sub EVENT_SPAWN {
  quest::settimer(1, 1200);
  quest::emote("rises from the corpse and stares around, as if waiting...");

  $npc->MoveTo($npc->GetX(), $npc->GetY(), $npc->FindGroundZ($npc->GetX(), $npc->GetY()));

  $npc->SetRace(quest::ChooseRandom(587, 588, 605));
  if ($npc->GetRace() == 587 || $npc->GetRace == 588) {
    $npc->SetGender(quest::ChooseRandom(0, 1));
  } else {
    $npc->SetGender(2);
  }
}

sub EVENT_SAY {
    my $flag_stage = $npc->GetEntityVariable("Stage-Name");
    my $flag_name  = $npc->GetEntityVariable("Flag-Name");

    if ($text =~ /hail/i) {
        
        if ($flag_stage eq 'RoK') {
            plugin::BlueText("Your mind flashes with recollections of savage lands; dense jungles, desolate swamps, and fiery wastes.");
        }
        elsif ($flag_stage eq 'SoV') {
            plugin::BlueText("You almost feel a chill in your bones as your mind fills with visions of endless ice plains, and fortresses filled with Giants and Dragons alike.");
        }
        elsif ($flag_stage eq 'SoL') {
            plugin::BlueText("Your mind recoils at the eldritch horror; dark shadows whisper to you of rites and mysteries alike.");
        }
        elsif ($flag_stage eq 'PoP') {
            plugin::BlueText("You sense a disturbance in the planes; a power grows near... again.");
        }
        elsif ($flag_stage eq 'GoD') {
            plugin::BlueText("You remember an island lost to the mists, conqurered and shattered, yet its people's will remains unbroken.");
        }
        elsif ($flag_stage eq 'OoW') {
            plugin::BlueText("You recall the Overlord of the invasion, sitting in his throne as he surveys the worlds he regards as prey.");
        }
        elsif ($flag_stage eq 'DoN') {
            plugin::BlueText("You recall the ancient dragons, and grow fearful at the prospect of them stirring once more.");
        }
        
        plugin::set_subflag($client, $flag_stage, $flag_name);
    }
}

sub EVENT_TIMER {
    quest::emote("vanishes.");
    quest::depop();
}