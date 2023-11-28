my %atlas = (
    'cabeast'       => 'RoK',
    'cabwest'       => 'RoK',
    'burningwood'   => 'RoK',
    'dreadlands'    => 'RoK',
    'emeraldjungle' => 'RoK',
    'fieldofbone'   => 'RoK',
    'firiona'       => 'RoK',
    'lakeofillomen' => 'RoK',
    'swampofnohope' => 'RoK',
    'timorous'      => 'RoK',
    'trakanon'      => 'RoK',
    'warslikswood'  => 'RoK',
    'chardok'       => 'RoK',
    'citymist'      => 'RoK',
    'dalnir'        => 'RoK',
    'charasis'      => 'RoK',
    'kaesora'       => 'RoK',
    'kurn'          => 'RoK',
    'nurga'         => 'RoK',
    'droga'         => 'RoK',
    'sebilis'       => 'RoK',


    'veeshan'       => 'PoP', # Out of Era
);

#Some Constants
my $BERSERKER = 16;
my $BEASTLORD = 15;
my $IKSAR     = 128;
my $VAH_SHIR  = 130;
my $DRAKKIN   = 522;
my $GUKTAN    = 330;

# Global hash of valid stages
my %VALID_STAGES = map { $_ => 1 } qw(RoK SoV SoL PoP GoD OoW DoN);

# Global hash of stage prerequisites
my %STAGE_PREREQUISITES = (
    'RoK' => ['Lord Nagafen', 'Lady Vox'],  # Objectives with spaces
    'SoV' => ['Trakanon', 'Gorenaire', 'Severilous', 'Talendor'],
    'SoL' => ['Yelinak', 'Tukaarak the Warder', 'Nanzata the Warder', 'Ventani the Warder', 'Hraasha the Warder', 'Wuoshi', 'Klandicar', 'Zlandicar'],
    'PoP' => ['Thought Horror Overfiend', 'The Insanity Crawler', 'Greg Veneficus', 'Xerkizh the Creator', 'Emperor Ssraeshza'],
    'GoD' => ['Quarm'],
    # ... and so on for each stage
);

# The new data structure for flag is the top level 'AccountID-progress-flag', which is a serialized 2-level hash
# The first layer of the hash uses 'stages' as keys, (such as RoK, SoV, SoL, PoP, GoD, OoW, DoN), and the 2nd layer hash as value
# The second layer uses objective names as the keys and truthy\falsey value.

# Breakpoints for original flagging system:
# Kunark: 2
# Velious: 3
# Luclin: 14
# Planes of Power: 19
# 'Fabled Classic'/Quarm-Kill: 20

# This method is used to bridge the old system to the new system.
# When full cut-over happens and everything is confirmed to work, this should be updated remove the original values.
sub convert_expansion_flag {
    my $client = shift;

    my $original_flag = quest::get_data($client->AccountID() . "-kunark-flag") || 0;
    my %account_progress = plugin::DeserializeHashComplex(quest::get_data($client->AccountID() . "-progress-flag"));

    if (quest::get_data($client->AccountID() . "vox")) {
        set_subflag($client, 'RoK', "Lady Vox");
    }

    if (quest::get_data($client->AccountID() . "nag")) {
        set_subflag($client, 'RoK', "Lord Nagafen");
    }
}

      quest::set_data($client->AccountID() . "trak", 1);
      quest::set_data($client->AccountID() . "goren", 1);
      quest::set_data($client->AccountID() . "sev", 1);
      quest::set_data($client->AccountID() . "tal", 1);



sub get_subflag {
    my ($client, $stage, $objective) = @_;

    return 0 unless exists $VALID_STAGES{$stage};

    my %account_progress = plugin::DeserializeHashComplex(quest::get_data($client->AccountID() . "-progress-flag"));
    return $account_progress{$stage}{$objective} ? 1 : 0;
}


sub set_subflag {
    my ($client, $stage, $objective) = @_;

    # Default value is 1 if not otherwise defined
    my $value = shift // 1;

    # Check if the stage is valid
    return 0 unless exists $VALID_STAGES{$stage};

    # Deserialize the current account progress
    my %account_progress = plugin::DeserializeHashComplex(quest::get_data($client->AccountID() . "-progress-flag"));

    # Check if the flag is already set to the desired value
    if (exists $account_progress{$stage} && (defined $account_progress{$stage}{$objective}) && ($account_progress{$stage}{$objective} == $value)) {
        # No change needed
        return 0;
    }

    # Update the flag
    $account_progress{$stage}{$objective} = $value;

    # Serialize and save the updated account progress
    quest::set_data($client->AccountID() . "-progress-flag", plugin::SerializeHashComplex(\%account_progress));

    $client->Message(4, "You have gained a progression flag!");

    # Check if the stage is now complete
    if (is_stage_complete($client, $stage)) {
        if ($stage == 'RoK' && $client->GetBucket("CharMaxLevel") == "51") {
            $client->SetBucket("CharMaxlevel", 60);
        }

        if ($stage == 'PoP' && $client->GetBucket("CharMaxLevel") == "60") {
            $client->SetBucket("CharMaxlevel", 65);
        }

        $client->Message(4, "You have completed a progression stage!");
    }

    return 1;
}

# Returns 1 if the client has completed all objectives needed to unlock the indicated stage
# Example; is_stage_complete($client, 'SoL') == 1 indicates that the player has unlocked access to Luclin.
sub is_stage_complete {
    my ($client, $stage) = @_;

    my %account_progress = plugin::DeserializeHashComplex(quest::get_data($client->AccountID() . "-progress-flag"));

    # Return false if the stage is not valid
    return 0 unless exists $VALID_STAGES{$stage};

    # Check prerequisites
    for my $prerequisite (@{$STAGE_PREREQUISITES{$stage}}) {
        return 0 unless $account_progress{$stage}{$prerequisite};
    }

    # All prerequisites are met
    return 1;
}

sub is_valid_stage {
    my $stage_name = shift;
    if (exists $VALID_STAGES{$stage_name}) {
        return 1;
    } else {
        quest::debug("NON-VALID PROGRESSION STAGE WAS CHECKED!");
        return 0;
    }
}

sub is_eligible_for_race {
    my $client = shift;
    my $race   = shift // $client->GetRace();

    # Iksar
    if ($race == $IKSAR && is_stage_complete($client, 'RoK')) {
        return 0;
    }

    # Vah Shir
    if ($race == $VAH_SHIR && is_stage_complete($client, 'SoL')) {
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

    if ($class == $BEASTLORD && is_stage_complete($client, 'SoL')) {
        return 0;
    }

    # Vah Shir
    if ($class == $BERSERKER && is_stage_complete($client, 'GoD')) {
        return 0;
    }

    return 1;
}

sub is_eligible_for_zone {
    my ($client, $zone_name) = @_;

    # Check if the zone exists in the atlas
    if (exists $atlas{$zone_name}) {
        # Use is_stage_complete to check if the client has completed the required stage
        return is_stage_complete($client, $atlas{$zone_name});
    } else {
        # If the zone is not in the atlas, assume it's accessible or handle as needed
        return 1;
    }
}
