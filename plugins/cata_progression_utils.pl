# Breakpoints for original flagging system:
# Kunark: 2
# Velious: 3
# Luclin: 14
# Planes of Power: 19
# 'Fabled Classic'/Quarm-Kill: 20

#Some Constants
my $BERSERKER = 16;
my $BEASTLORD = 15;
my $IKSAR     = 128;
my $VAH_SHIR  = 130;
my $DRAKKIN   = 522;
my $GUKTAN    = 330;

my %atlas = (
    'cabeast'        => 'RoK',
    'cabwest'        => 'RoK',
    'burningwood'    => 'RoK',
    'dreadlands'     => 'RoK',
    'emeraldjungle'  => 'RoK',
    'fieldofbone'    => 'RoK',
    'firiona'        => 'RoK',
    'lakeofillomen'  => 'RoK',
    'swampofnohope'  => 'RoK',
    'timorous'       => 'RoK',
    'trakanon'       => 'RoK',
    'warslikswood'   => 'RoK',
    'chardok'        => 'RoK',
    'citymist'       => 'RoK',
    'dalnir'         => 'RoK',
    'charasis'       => 'RoK',
    'kaesora'        => 'RoK',
    'kurn'           => 'RoK',
    'nurga'          => 'RoK',
    'droga'          => 'RoK',
    'sebilis'        => 'RoK',

    'cobaltscar'     => 'SoV',
    'crystal'        => 'SoV',
    'necropolis'     => 'SoV',
    'eastwastes'     => 'SoV',
    'greatdivide'    => 'SoV',
    'iceclad'        => 'SoV',
    'kael'           => 'SoV',
    'sleeper'        => 'SoV',
    'growthplane'    => 'SoV',
    'mischiefplane'  => 'SoV',
    'sirens'         => 'SoV',
    'templeveeshan'  => 'SoV',
    'thurgadina'     => 'SoV',
    'thurgadinb'     => 'SoV',
    'frozenshadow'   => 'SoV',
    'wakening'       => 'SoV',
    'westwastes'     => 'SoV',
    'gunthak'        => 'SoV',
    'nadox'          => 'SoV',
    'dulak'          => 'SoV',
    'hatesfury'      => 'SoV',
    'torgiran'       => 'SoV',
    'veksar'         => 'SoV', # Out of Era

    'acrylia'        => 'SoL',
    'akheva'         => 'SoL',
    'dawnshroud'     => 'SoL',
    'echo'           => 'SoL',
    'fungusgrove'    => 'SoL',
    'griegsend'      => 'SoL',
    'hollowshade'    => 'SoL',
    'netherbian'     => 'SoL',
    'paludal'        => 'SoL',
    'sseru'          => 'SoL',
    'scarlet'        => 'SoL',
    'shadeweaver'    => 'SoL',
    'shadowhaven'    => 'SoL',
    'sharvahl'       => 'SoL',
    'ssratemple'     => 'SoL',
    'thedeep'        => 'SoL',
    'thegrey'        => 'SoL',
    'tenebrous'      => 'SoL',
    'twilight'       => 'SoL',
    'umbral'         => 'SoL',
    'vexthal'        => 'SoL',
    'nexus'          => 'SoL',
    'veeshan'        => 'PoP', # Out of Era

    'poknowledge'    => 'PoP',
    'potranquility'  => 'PoP',
    'ponightmare'    => 'PoP',
    'nightmareb'     => 'PoP',
    'podisease'      => 'PoP',
    'poinnovation'   => 'PoP',
    'pojustice'      => 'PoP',
    'postorms'       => 'PoP',
    'povalor'        => 'PoP',
    'potorment'      => 'PoP',
    'codecay'        => 'PoP',
    'hohonora'       => 'PoP',
    'hohonorb'       => 'PoP',
    'bothunder'      => 'PoP',
    'potactics'      => 'PoP',
    'solrotower'     => 'PoP',
    'pofire'         => 'PoP',
    'poair'          => 'PoP',
    'powater'        => 'PoP',
    'poeartha'       => 'PoP',
    'poearthb'       => 'PoP',
    'potimea'        => 'PoP',
    'potimeb'        => 'PoP',    

    'barindu'        => 'GoD',
    'ferubi'         => 'GoD',
    'ikkinz'         => 'GoD',
    'kodtaz'         => 'GoD',
    'natimbi'        => 'GoD',
    'qinimi'         => 'GoD',
    'qvic'           => 'GoD',
    'riwwi'          => 'GoD',
    'snlair'         => 'GoD',
    'snpool'         => 'GoD',
    'snplant'        => 'GoD',
    'sncrematory'    => 'GoD',
    'tacvi'          => 'GoD',
    'tipt'           => 'GoD',
    'txevu'          => 'GoD',
    'uqua'           => 'GoD',
    'vxed'           => 'GoD',
    'yxtta'          => 'GoD',

    'anguish'        => 'OoW',
    'harbingers'     => 'OoW',
    'provinggrounds' => 'OoW',
    'causeway'       => 'OoW',
    'dranik'         => 'OoW',
    'draniksscar'    => 'OoW',
  'dranikcatacombsa' => 'OoW',
  'dranikcatacombsb' => 'OoW',
  'dranikcatacombsc' => 'OoW',
    'dranikhollowsa' => 'OoW',
    'dranikhollowsc' => 'OoW',
    'dranikhollowsd' => 'OoW',
    'draniksewersa'  => 'OoW',
    'draniksewersc'  => 'OoW',
    'draniksewersd'  => 'OoW',
    'riftseekers'    => 'OoW',
    'bloodfields'    => 'OoW',
    'wallofslaughter'=> 'OoW',

    'thenest'        => 'DoN',
    'delvea'         => 'DoN',
    'stillmoona'     => 'DoN',
    'stillmoonb'     => 'DoN',
    'broodlands'     => 'DoN',
    'thundercrest'   => 'DoN',
    'delveb'         => 'DoN',
);

# Global hash of valid stages
my @STAGES = qw(RoK SoV SoL PoP GoD OoW DoN FNagafen);
my %VALID_STAGES = map { $_ => 1 } @STAGES;

# Global hash of stage prerequisites
my %STAGE_PREREQUISITES = (
    'RoK' => ['Lord Nagafen', 'Lady Vox'],  
    'SoV' => ['Trakanon', 'Gorenaire', 'Severilous', 'Talendor'],
    'SoL' => ['Lord Yelinak', 'Tukaarak the Warder', 'Nanzata the Warder', 'Ventani the Warder', 'Hraashna the Warder', 'Wuoshi', 'Klandicar', 'Zlandicar'],
    'PoP' => ['Thought Horror Overfiend', 'The Insanity Crawler', 'Greig Veneficus', 'Xerkizh the Creator', 'Emperor Ssraeshza'],
    'GoD' => ['Saryrn'],
    'OoW' => ['Disabled'],
    'DoN' => ['Disabled'],
    'FNagafen' => ['Quarm'],
    # ... and so on for each stage
);

my %STAGE_DESCRIPTIONS = (
    'RoK' => "Ruins of Kunark",
    'SoV' => "Scars of Velious",
    'SoL' => "Shadows of Luclin",
    'PoP' => "Planes of Power",
    'GoD' => "Gates of Discord",
    'OoW' => "Omens of War",
    'DoN' => "Dragons of Norrath",
    'FNagafen' => "Fabled Nagafen's Lair",
);

# Convert to a direct lookup hash
our %DIRECT_LOOKUP;
foreach my $stage (keys %STAGE_PREREQUISITES) {
    foreach my $objective (@{$STAGE_PREREQUISITES{$stage}}) {
        $DIRECT_LOOKUP{$objective} = 1;
    }
}

sub list_unlock_progress {
    my $client = shift;
    foreach my $stage (keys %STAGE_DESCRIPTIONS) {
        if (is_stage_complete($client, $STAGE_DESCRIPTIONS{$stage})) {
            plugin::YellowText("You have unlocked access to $STAGE_DESCRIPTIONS{$stage}.");
        } else {
            plugin::YellowText("You have NOT unlocked access to $STAGE_DESCRIPTIONS{$stage}.");
        }
    }
}

sub list_stage_prereq {
    my ($client, $target_stage) = @_;

    if (exists $STAGE_PREREQUISITES{$target_stage}) {
        my $prereqs = $STAGE_PREREQUISITES{$target_stage};
        
        if ($prereqs && @$prereqs ne 'Disabled') {
            foreach my $objective (@$prereqs) {
                my $completed = get_subflag($client, $target_stage, $objective) ? "completed" : "not completed";
                plugin::YellowText("$objective: $completed");
            }
        }
    }
}

sub get_subflag_stage {
    my ($subflag_name) = @_;  # The name of the subflag to search for

    # Iterate through each stage in the hash
    foreach my $stage (keys %STAGE_PREREQUISITES) {
        # Check if the subflag name is in the list of prerequisites for this stage
        if (grep { $_ eq $subflag_name } @{$STAGE_PREREQUISITES{$stage}}) {
            return $stage; # Return the stage name if found
        }
    }
    return undef; # Return undefined if the subflag name is not found in any stage
}

sub subflag_exists {
    my ($search_term) = @_;
    return $DIRECT_LOOKUP{$search_term} // 0; # Returns 1 if present, 0 otherwise
}

# Subroutine to find the next stage
sub get_next_stage {
    my ($current_stage) = @_;

    # Find the index of the current stage
    my ($index) = grep { $STAGES[$_] eq $current_stage } 0..$#STAGES;

    # If the current stage is not the last one, return the next stage
    if (defined $index && $index < $#STAGES) {
        return $STAGES[$index + 1];
    }

    # Return undefined if the current stage is the last one or not found
    return;
}

# Breakpoints for original flagging system:
# Kunark: 2
# Velious: 3
# Luclin: 14
# Planes of Power: 19
# 'Fabled Classic'/Quarm-Kill: 20

# The new data structure will be independent flag variables for each stage, ie AccountID-progress-flag-RoK
# This is stored as a serialized hash using plugin::SerializeHash and plugin::DeserializeHash
# set_subflag does all the heavy lifting of setting flags

sub get_subflag {
    my ($client, $stage, $objective) = @_;

    my %flag = plugin::DeserializeHash(quest::get_data($client->AccountID() . "-progress-flag-$stage"));

    return $flag{$objective};
}

#usage plugin::set_subflag($client, 'Rok', 'Lord Nagafen', 1); flags $client for Lord Nagafen in RoK stage.
sub set_subflag {
    my ($client, $stage, $objective, $value) = @_;
    $value //= 1; # Default value is 1 if not otherwise defined

    # Check if the stage is valid
    return 0 unless exists $VALID_STAGES{$stage};

    # Deserialize the current account progress into a hash
    my %account_progress = plugin::DeserializeHash(quest::get_data($client->AccountID() . "-progress-flag-$stage"));

    # Check if the objective value has changed
    if (!exists $account_progress{$objective} || $account_progress{$objective} != $value) {
        # Update the flag since the value has changed
        $account_progress{$objective} = $value;

        # Serialize and save the updated account progress
        quest::set_data($client->AccountID() . "-progress-flag-$stage", plugin::SerializeHash(%account_progress));

        # Send messages only if there was a change
        plugin::YellowText("You have gained a progression flag!");
        plugin::BlueText("Your memories become more clear, you see the way forward drawing closer.");

        # Check if the stage is now complete
        if (is_stage_complete($client, $stage)) {       
            plugin::YellowText("You have completed a progression stage!");
            plugin::BlueText("Your memories gain sudden, sharp focus. You see the path forward.");
            UpdateCharMaxLevel($client);
            UpdateRaceClassLocks($client);
        }
    }

    return 1;
}

# Returns 1 if the client has completed all objectives needed to unlock the indicated stage
# Optional final parameter is used to inform player if they fail the check
# Example; is_stage_complete($client, 'SoL') == 1 indicates that the player has unlocked access to Luclin.
sub is_stage_complete {
    my ($client, $stage, $inform) = @_;
    $inform //= 0; # Set to 0 if not defined

    quest::debug("Checking if stage is complete: $stage");

    # Return false if the stage is not valid
    unless (exists $VALID_STAGES{$stage}) {
        quest::debug("ERROR: Invalid stage: $stage for " . $client->GetCleanName());
        return 0;
    }

    quest::debug("Valid Stage: $stage");

    # Check prerequisites
    foreach my $prerequisite (@{$STAGE_PREREQUISITES{$stage}}) {
        my %objective_progress = plugin::DeserializeHash(quest::get_data($client->AccountID() . "-progress-flag-$stage"));

        unless ($objective_progress{$prerequisite}) {
            quest::debug("Prerequisite not met: $prerequisite");
            if ($inform) {
                 $client->Message(263, "You are not yet ready to experience that memory.");
            }
            return 0;
        }
        quest::debug("Prerequisite met: $prerequisite");
    }

    # If all prerequisites are met
    quest::debug("All prerequisites for stage $stage have been met");
    return 1;
}


sub is_eligible_for_race {
    my $client = shift;
    my $race   = shift // $client->GetRace();

    # Iksar
    if ($race == $IKSAR && !is_stage_complete($client, 'RoK')) {
        return 0;
    }

    # Vah Shir
    if ($race == $VAH_SHIR && !is_stage_complete($client, 'SoL')) {
        return 0;
    }

    # Drakkin
    if ($race == $DRAKKIN) {
        return 0;
    }

    # Guktan
    if ($race == $GUKTAN) {
        return 0;
    }

    return 1;
}

sub is_eligible_for_class {
    my $client = shift;
    my $class  = shift // $client->GetClass();

    if ($class == $BEASTLORD && !is_stage_complete($client, 'PoP')) {
        return 0;
    }

    # Vah Shir
    if ($class == $BERSERKER && !is_stage_complete($client, 'SoL')) {
        return 0;
    }

    return 1;
}

sub is_eligible_for_zone {
    my ($client, $zone_name, $inform) = @_;    
    $inform //= 0; # Set to 0 if not defined

    if ($client->GetGM()) {
        return 1;
    }

    # Check if the zone exists in the atlas
    if (exists $atlas{$zone_name}) {
        # Use is_stage_complete to check if the client has completed the required stage
        return is_stage_complete($client, $atlas{$zone_name}, $inform);
    } else {
        # If the zone is not in the atlas, assume it's accessible or handle as needed
        #quest::debug("ERROR: Zone $zone_name not found in Atlas");
        return 1;
    }
}

sub is_valid_stage {
    my $stage_name = shift;
    if (exists $VALID_STAGES{$stage_name}) {
        return 1;
    } else {
        quest::debug("ERROR: NON-VALID PROGRESSION STAGE WAS CHECKED!");
        return 0;
    }
}

# Returns the destination zone of a specified door
sub get_target_door_zone {
    my ($zonesn, $doorid, $version) = @_;
    my $return_value = "";

    my $dbh = plugin::LoadMysql();
    my $sth = $dbh->prepare('SELECT * FROM doors WHERE zone = ? AND doorid = ? AND version = ?');

    $sth->execute($zonesn, $doorid, $version);

    if (my $row = $sth->fetchrow_hashref()) {
       $return_value = $row->{dest_zone};
    }

    $sth->finish();
    $dbh->disconnect();

    return $return_value;
}

sub UpdateCharMaxLevel
{
    my $client = shift;
    my $update = 0;
    my $CharMaxLevel = $client->GetBucket("CharMaxLevel");

    if (!$CharMaxLevel) {
		$CharMaxLevel = 51;
        $updated = 1;
	}

    if (is_stage_complete($client, 'RoK') && $CharMaxLevel < 60) {
        $CharMaxLevel = 60;
        $updated = 1;
    }

    if (is_stage_complete($client, 'PoP') && $CharMaxLevel < 65) {
        $CharMaxLevel = 65;
        $updated = 1;
    }

    if (is_stage_complete($client, 'GoD') && $CharMaxLevel < 70) {
        $CharMaxLevel = 70;
        $updated = 1;
    }    

    if ($updated) {
        $client->SetBucket("CharMaxlevel", $CharMaxLevel);
        plugin::YellowText("Your Level Cap has been set to $CharMaxLevel.");
    }
}

sub ConvertFlags {
    my $client = shift;
    
    # Old Flag Data
    $expansion = quest::get_data($client->AccountID() . "-kunark-flag") || 0;

    if ($expansion) {
        # Kunark
        if (!is_stage_complete($client, 'RoK')) {
            if ($expansion > 2 || quest::get_data($client->AccountID() . "nag")) {
                set_subflag($client, 'RoK', 'Lord Nagafen', 1);
            }

            if ($expansion > 2 || quest::get_data($client->AccountID() . "vox")) {
                set_subflag($client, 'RoK', 'Lady Vox', 1);
            }
        }
        
        # Velious
        if (!is_stage_complete($client, 'SoV')) {
            if ($expansion > 3 || quest::get_data($client->AccountID() . "trak")) {
                set_subflag($client, 'SoV', 'Trakanon', 1);
            }

            if ($expansion > 3 || quest::get_data($client->AccountID() . "tal")) {
                set_subflag($client, 'SoV', 'Talendor', 1);
            }

            if ($expansion > 3 || quest::get_data($client->AccountID() . "goren")) {
                set_subflag($client, 'SoV', 'Gorenaire', 1);
            }

            if ($expansion > 3 || quest::get_data($client->AccountID() . "sev")) {
                set_subflag($client, 'SoV', 'Severilous', 1);
            }
        }

        # Luclin
        if (!is_stage_complete($client, 'SoL')) {
            if ($expansion > 14 || quest::get_data($client->AccountID() . "sky")) {
                set_subflag($client, 'SoL', 'Lord Yelinak', 1);
            }

            if ($expansion > 14 || quest::get_data($client->AccountID() . "sleepers")) {
                set_subflag($client, 'SoL', 'Tukaarak the Warder', 1);
            }

            if ($expansion > 14 || quest::get_data($client->AccountID() . "sle")) {
                set_subflag($client, 'SoL', 'Nanzata the Warder', 1);
            }

            if ($expansion > 14 || quest::get_data($client->AccountID() . "slee")) {
                set_subflag($client, 'SoL', 'Ventani the Warder', 1);
            }

            if ($expansion > 14 || quest::get_data($client->AccountID() . "sleep")) {
                set_subflag($client, 'SoL', 'Hraashna the Warder', 1);
            }

            if ($expansion > 14 || quest::get_data($client->AccountID() . "wuo")) {
                set_subflag($client, 'SoL', 'Wuoshi', 1);
            }

            if ($expansion > 14 || quest::get_data($client->AccountID() . "kla")) {
                set_subflag($client, 'SoL', 'Klandicar', 1);
            }

            if ($expansion > 14 || quest::get_data($client->AccountID() . "zla")) {
                set_subflag($client, 'SoL', 'Zlandicar', 1);
            }
        }

        # Planes of Power
        if (!is_stage_complete($client, 'PoP')) {
            if ($expansion > 19 || quest::get_data($client->AccountID() . "deep")) {
                set_subflag($client, 'PoP', 'Thought Horror Overfiend', 1);
            }

            if ($expansion > 19 || quest::get_data($client->AccountID() . "akh")) {
                set_subflag($client, 'PoP', 'The Insanity Crawler', 1);
            }

            if ($expansion > 19 || quest::get_data($client->AccountID() . "griegs")) {
                set_subflag($client, 'PoP', 'Greig Veneficus', 1);
            }

            if ($expansion > 19 || quest::get_data($client->AccountID() . "ssraone")) {
                set_subflag($client, 'PoP', 'Xerkizh the Creator', 1);
            }

            if ($expansion > 19 || quest::get_data($client->AccountID() . "ssratwo")) {
                set_subflag($client, 'PoP', 'Emperor Ssraeshza', 1);
            }
        }

        # Gates of Discord
        if (!is_stage_complete($client, 'GoD')) {
            if ($expansion > 20 || quest::get_data($client->AccountID() . "-saryrn-flag")) {
                set_subflag($client, 'GoD', 'Saryrn', 1);
            }
        }

        # Fabled Nagafen
        if (!is_stage_complete($client, 'FNagafen') && $expansion > 20) {
            set_subflag($client, 'FNagafen', 'Quarm', 1);
        }

        UpdateRaceClassLocks($client);
    }    
}

sub UpdateRaceClassLocks {
    my $client = shift;
    my $account_progression = quest::get_data($client->AccountID() . "-account-progression") || 0;

    if ($account_progression < 1 && is_stage_complete($client, 'RoK')) {
        quest::set_data($client->AccountID() . "-account-progression", 1);
    }

    if ($account_progression < 2 && is_stage_complete($client, 'SoV')) {
        quest::set_data($client->AccountID() . "-account-progression", 2);
    }

    if ($account_progression < 3 && is_stage_complete($client, 'SoL')) {
        quest::set_data($client->AccountID() . "-account-progression", 3);
    }

    if ($account_progression < 4 && is_stage_complete($client, 'PoP')) {
        quest::set_data($client->AccountID() . "-account-progression", 4);
    }

    if ($account_progression < 5 && is_stage_complete($client, 'GoD')) {
        quest::set_data($client->AccountID() . "-account-progression", 5);
    }

    if ($account_progression < 6 && is_stage_complete($client, 'OoW')) {
        quest::set_data($client->AccountID() . "-account-progression", 6);
    }

    if ($account_progression < 7 && is_stage_complete($client, 'DoN')) {
        quest::set_data($client->AccountID() . "-account-progression", 7);
    }
}

sub handle_death {
    my ($npc, $x, $y, $z, $entity_list) = @_;
    if (plugin::subflag_exists($npc->GetCleanName())) {        
        my $flag_mob = quest::spawn2(26000, 0, 0, $x, $y, ($z + 10), 0); # Spawn a flag mob
        my $new_npc = $entity_list->GetNPCByID($flag_mob);       
        
        $new_npc->SetEntityVariable("Flag-Name", $npc->GetCleanName());
        $new_npc->SetEntityVariable("Stage-Name", plugin::get_subflag_stage($npc->GetCleanName()));
    }    
}

sub handle_killed_merit {
    my $npc   = shift;
    my $client = shift;
    if (plugin::subflag_exists($npc->GetCleanName())) {
        plugin::set_subflag($client, plugin::get_subflag_stage($npc->GetCleanName()), $npc->GetCleanName());
    }
}