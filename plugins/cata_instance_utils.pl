my $zone_duration   = 86400;

# Design:
# This NPC will offer two instances for this zone; <Zone>: Challenge and <Zone>: Opportunity (names tbd)
# Challenge is limited to those who have either A) Not yet completed the specified progression stage or B) Have not exceeeded
# that stage by a full degree (ie, SoV-complete cannot participate in RoK instance)
# Both instances are limited to 6 characters. Both instance last 7 days, but can be left early.
# Challenge is an objective-based, non-respawning instance that allows for completing unlock tasks.
# Challenge rewards a TBD alt-currency which can be used to purchase items from LDON vendor pool
# Challenge $reward pool is evenly (rounded up) distributed among all participants
# Challenge locks tasks so players cannot be added after the first person zones in
# Opportunity is an open zone with respawns, etc, that can be requested by anyone who *has* cleared Challenge at least once
# Opportunity costs some quantity of plat to open

#plugin::HandleSay($client, $npc, $zone_name, $reward, @task_id, $prog_stage, $prog_substage, $flavor_text);
sub HandleSay
{
    my ($client, $npc, $zone_name, $reward, $prog_stage, $prog_substage, $flavor_text, @task_id) = @_;
    my $text   = plugin::val('text');

    my $challenges                  = quest::saylink("challenges", 1);
    my $opportunities               = quest::saylink("opportunities", 1);
    my $wish_to_proceed_challenge   = quest::saylink("wish to proceed_challenge", 1, "wish to proceed");
    my $wish_to_proceed_opportunity = quest::saylink("wish to proceed_opportunity", 1, "wish to proceed");
    my $proceed                     = quest::saylink("proceed", 1);

    if ($text =~ /hail/i) {
        if (plugin::HasDynamicZoneAssigned($client, '%')) {
            if (plugin::HasDynamicZoneAssigned($client, quest::GetZoneLongName($zone_name))) {
                plugin::NPCTell("The way before you is clear. [$proceed] when you are ready.");
            } else {
                plugin::NPCTell("You already have a task assigned to you by another Servant. Finish or abandon it before speaking to me.");
            }  
            return;
        } else {
            plugin::NPCTell("Hail, Hero. I offer [$challenges] and [$opportunities] alike.");
        }
    }

    if ($text =~ /challenges/i) {
        quest::debug($prog_stage);
        my $next_stage = plugin::get_next_stage($prog_stage);

            plugin::NPCTell("$flavor_text Seek the challenges before you, and be rewarded. Do you [$wish_to_proceed_challenge]?");
            plugin::YellowText("You must complete all instance objectives in order to recieve a progression flag. You may leave and re-enter the instance. Creatures within
                                will not respawn. Once any member of your party enters, you may not add any additional members. Rewards will be calculated based upon the number 
                                of members in the task when it locks.");
        
    }

    if ($text =~ /opportunities/i) {
        plugin::NPCTell("$flavor_text Seek the opportunities before you, and be rewarded. Do you [$wish_to_proceed_opportunity]?");
        plugin::YellowText("The instance will remain open for one day. You may leave and re-enter the instance. You may add additional players, up to 6 total at a given time, at any time.");        
    }

    if ($text =~ /wish to proceed_challenge/i) {        
        my $task = $task_id[0];
        my %dz = (
            "instance"      => { "zone" => $zone_name, "version" => 20 },
            "compass"       => { "zone" => plugin::val('zonesn'), "x" => $npc->GetX(), "y" => $npc->GetY(), "z" => $npc->GetZ() },
            "safereturn"    => { "zone" => plugin::val('zonesn'), "x" => $client->GetX(), "y" => $client->GetY(), "z" => $client->GetZ(), "h" => $client->GetHeading() }
        );

        $client->AssignTask($task);    
        $client->CreateTaskDynamicZone($task, \%dz);    

        plugin::NPCTell("As you wish. When you and your companions are prepared, come speak to me so that you may [$proceed].");
        return;
    }

    if ($text =~ /wish to proceed_opportunity/i) {
        my $task = $task_id[1];
        my %dz = (
            "instance"      => { "zone" => $zone_name, "version" => 0 },
            "compass"       => { "zone" => plugin::val('zonesn'), "x" => $npc->GetX(), "y" => $npc->GetY(), "z" => $npc->GetZ() },
            "safereturn"    => { "zone" => plugin::val('zonesn'), "x" => $client->GetX(), "y" => $client->GetY(), "z" => $client->GetZ(), "h" => $client->GetHeading() }
        );

        $client->AssignTask($task);    
        $client->CreateTaskDynamicZone($task, \%dz); 

        plugin::NPCTell("As you wish. When you and your companions are prepared, come speak to me so that you may [$proceed].");
        return;
    }

    if ($text =~ /proceed/i) {
        my $group = $client->GetGroup();
        if($group)
        {
            for(my $count = 0; $count < $group->GroupCount(); $count++)
            {
                $player = $group->GetMember($count);
                if (plugin::HasDynamicZoneAssigned($player, quest::GetZoneLongName($zone_name))) {
                    $player->MovePCDynamicZone($zone_name);
                } else {
                    plugin::RedText("$player is not part of your Shared Task.");
                }
            }
        }
        $client->MovePCDynamicZone($zone_name);         
    }
}

sub HandleTaskAccept {
    my $client     = plugin::val('$client');
    my $task_id    = shift;
    my $task_name  = quest::gettaskname($task_id);
    my $challenge  = IsChallengeTask($task_id);

    if (0) {
        my $ineligible  = 0;
        my $dbh         = plugin::LoadMysql(); 

        my $query = "SELECT min_level, max_level FROM tasks WHERE id = ?";
        my $sth = $dbh->prepare($query);
        $sth->execute($task_id);

        my ($min_level, $max_level) = $sth->fetchrow_array();
        $sth->finish();
        $dbh->disconnect();

        if ($client->GetLevel() > $max_level || $client->GetLevel() < $min_level) {
            $client->EndSharedTask(1);
            plugin::RedText("You are not eligible to participate in this Challenge.");           

            $group = $client->GetGroup();
            if($group) {
                for ($count = 0; $count < $group->GroupCount(); $count++) {
                    $player = $group->GetMember($count);
                    if($player) {
                        plugin::RedText("Your Challenge has ended due to an ineligible player joining the Shared Task.");
                    }
                }
            }
        }        
    }        
}

sub HandleTaskComplete
{
    my $client      = plugin::val('$client');
    my $task_id     = shift;
    my $task_name   = quest::gettaskname($task_id);
    my $challenge   = IsChallengeTask($task_id);

    if ($challenge) {
        plugin::set_subflag($client, plugin::get_subflag_stage($challenge), $challenge);
    } 
}

sub HasDynamicZoneAssigned {
    my $client  = shift;
    my $zone    = shift;
    my $dbh     = plugin::LoadMysql();

    my $character_id = $client->CharacterID();

    my $query = "SELECT COUNT(*) FROM dynamic_zone_members, dynamic_zones WHERE dynamic_zones.id = dynamic_zone_members.dynamic_zone_id AND character_id = ? AND name LIKE ?";
    my $sth = $dbh->prepare($query);
    $sth->execute($character_id, $zone);

    my $count = $sth->fetchrow();
    $sth->finish();
    $dbh->disconnect();

    return $count > 0 ? 1 : 0;
}

# Returns 1 if the task_id is an 'opportunity' task
sub IsOpportunityTask {
    my $task_id = shift;    
    
    my @opportunity_tasks = (
        4, # Nagafen's Lair
    );    
   
    if (grep { $_ == $task_id } @opportunity_tasks) {
        return 1;  
    } else {
        return 0;  
    }
}

# Returns the reward value of a challenge task-Id
sub IsChallengeTask {
    my $task_id = shift;

    my %challenge_tasks = (
        3 => 'Lord Nagafen',
    );

    if (exists $challenge_tasks{$task_id}) {
        return $challenge_tasks{$task_id};  
    }
    return 0;
}
