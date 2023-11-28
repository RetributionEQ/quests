sub EVENT_SPAWN {
	#:: Create a proximity 400 units across, without proximity say
	quest::set_proximity($x - 200, $x + 200, $y - 88, $y + 88, $z - 50, $z + 50, 0);
	#:: Create a HP event at 96 percent health
	quest::setnexthpevent(96);

 my $roll = quest::ChooseRandom(1,2,3,4,5,6,7);
 
   if($roll == 1)
   {
	$npc->AddItem(11608,10);
   }
   if($roll == 2)
   {
	$npc->AddItem(11604);
   }
   if($roll == 3)
   {
	$npc->AddItem(11605,1);
   }
   if($roll == 4)
   {
	$npc->AddItem(711608,50);
   }
   if($roll == 5)
   {
	$npc->AddItem(711604);
   }
   if($roll == 6)
   {
	$npc->AddItem(811608,100);
   }
   if($roll == 7)
   {
	$npc->AddItem(811604);
   }


}

sub EVENT_AGGRO {
	#:: Create a timer 'leash' that triggers every second
	quest::settimer("leash", 1);
}

sub EVENT_HP {
	#:: Stop the timer 'leash' from triggering
	quest::stoptimer("leash");
	#:: Trigger EVENT_AGGRO subroutine to makue sure the timer is running
	EVENT_AGGRO();
	#:: Set another HP event to catch any HP loss
	quest::setnexthpevent(int($npc->GetHPRatio())-9);
}

sub EVENT_ENTER {
	if (($ulevel > 65) && ($status < 80)) {
		quest::echo(0, "I will not fight you, but I will banish you!");
		#:: Move player to Lavastorm (27) at the specified coordinates, facing North
		$client->MovePC(30, -7024, 2020, -60.7, 0);
	}
}

sub EVENT_TIMER {
	#:: Match timer 'leash'
	if ($timer eq "leash") {
		if ($x < -431 || $x > -85 || $y < 770 || $y > 1090 || $z < -50) {
			#:: Trigger WIPE_AGGRO subroutine
			WIPE_AGGRO();
		}
		my @hate_list = $npc->GetHateList();
		my $hate_count = @hate_list;
		if ($hate_count > 0) {
			foreach $ent (@hate_list) {
				my $h_ent = $ent->GetEnt();
				if ($h_ent->IsClient()) {
					if ($h_ent->GetLevel() > 65) {
						quest::ze(0, "I will not fight you, but I will banish you!");
						#:: Move player to everfrost (30) at the specified coordinates, facing North
						$h_ent->CastToClient()->MovePC(30, -7024, 2020, -60.7, 0);
					}
				}
			}
		} 
		else {
			#:: Trigger WIPE_AGGRO subroutine
			WIPE_AGGRO();
		}
	}
}

sub WIPE_AGGRO {
	$npc->BuffFadeAll();
	$npc->WipeHateList();
	$npc->SetHP($npc->GetMaxHP());
	$npc->GMMove($npc->GetSpawnPointX(), $npc->GetSpawnPointY(), $npc->GetSpawnPointZ(), $npc->GetSpawnPointH());
	#:: Stop the timer 'leash' from triggering
	quest::stoptimer("leash");
	#:: Create a HP event at 96 percent health
	quest::setnexthpevent(96);
}

sub EVENT_KILLED_MERIT {
	plugin::set_subflag($client, 'RoK', 'Lady Vox');
}