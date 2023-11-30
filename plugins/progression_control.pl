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
    'veeshan'        => 'PoP', # Out of Era
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
    'SoL' => ['Lord Yelinak', 'Tukaarak the Warder', 'Nanzata the Warder', 'Ventani the Warder', 'Hraasha the Warder', 'Wuoshi', 'Klandicar', 'Zlandicar'],
    'PoP' => ['Thought Horror Overfiend', 'The Insanity Crawler', 'Greig Veneficus', 'Xerkizh the Creator', 'Emperor Ssraeshza'],
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

    if (quest::get_data($client->AccountID() . "trak")) {
        set_subflag($client, 'SoV', "Trakanon");
    }

    if (quest::get_data($client->AccountID() . "goren")) {
        set_subflag($client, 'SoV', "Gorenaire");
    }

    if (quest::get_data($client->AccountID() . "sev")) {
        set_subflag($client, 'SoV', "Severilous");
    }

    if (quest::get_data($client->AccountID() . "tal")) {
        set_subflag($client, 'SoV', "Talendor");
    }

    if (quest::get_data($client->AccountID() . "sky")) {
        set_subflag($client, 'SoL', "Lord Yelinak");
    }

    if (quest::get_data($client->AccountID() . "sleepers")) {
        set_subflag($client, 'SoL', "Tukaarak the Warder");
    }

    if (quest::get_data($client->AccountID() . "sle")) {
        set_subflag($client, 'SoL', "Nanzata the Warder");
    }

    if (quest::get_data($client->AccountID() . "slee")) {
        set_subflag($client, 'SoL', "Ventani the Warder");
    }

    if (quest::get_data($client->AccountID() . "sleep")) {
        set_subflag($client, 'SoL', "Hraasha the Warder");
    }

    if (quest::get_data($client->AccountID() . "wuo")) {
        set_subflag($client, 'SoL', "Wuoshi");
    }

    if (quest::get_data($client->AccountID() . "kla")) {
        set_subflag($client, 'SoL', "Klandicar");
    }

    if (quest::get_data($client->AccountID() . "zla")) {
        set_subflag($client, 'SoL', "Zlandicar");
    }

    if (quest::get_data($client->AccountID() . "deep")) {
        set_subflag($client, 'PoP', "Thought Horror Overfiend");
    }

    if (quest::get_data($client->AccountID() . "akh")) {
        set_subflag($client, 'PoP', "The Insanity Crawler");
    }

    if (quest::get_data($client->AccountID() . "griegs")) {
        set_subflag($client, 'PoP', "Greig Veneficus");
    }

    if (quest::get_data($client->AccountID() . "ssraone")) {
        set_subflag($client, 'PoP', "Xerkizh the Creator");
    }

    if (quest::get_data($client->AccountID() . "ssratwo")) {
        set_subflag($client, 'PoP', "Emperor Ssraeshza");
    }
}

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
# Optional final parameter is used to inform player if they fail the check
# Example; is_stage_complete($client, 'SoL') == 1 indicates that the player has unlocked access to Luclin.
sub is_stage_complete {
    my ($client, $stage) = @_;
    my $inform = shift // 0;

    my %account_progress = plugin::DeserializeHashComplex(quest::get_data($client->AccountID() . "-progress-flag"));

    # Return false if the stage is not valid
    return 0 unless exists $VALID_STAGES{$stage};

    # Check prerequisites
    for my $prerequisite (@{$STAGE_PREREQUISITES{$stage}}) {
        return 0 unless $account_progress{$stage}{$prerequisite};
    }

    # All prerequisites are met
    if ($inform) {
        $client->Message(4, "You are not yet ready to experience this memory.");
    }

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
    my $inform = shift // 0;

    # Check if the zone exists in the atlas
    if (exists $atlas{$zone_name}) {
        # Use is_stage_complete to check if the client has completed the required stage
        return is_stage_complete($client, $atlas{$zone_name}, $inform);
    } else {
        # If the zone is not in the atlas, assume it's accessible or handle as needed
        return 1;
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
