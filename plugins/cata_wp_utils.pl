my @categories = [
    'Antonica',  # 0 
    'Faydwer',   # 1 
    'Odus',      # 2 
    'Kunark',    # 3 
    'Velious',   # 4 
    'Luclin',    # 5 
    'The Planes',# 6 
    'Taelosia',  # 7 
    'Discord'    # 8 
];

my %waypoints = (
    # "Pretty Name" => [continent_id, zonesn, x, y, z, h, unique_id]
    "North Qeynos"                                => [0,  'qeynos2',   392,    165,    4,  310],
    "Surefall Glade"                              => [0,  'qrg',   -66,     45,    4,  200],
    "West Freeport"                               => [0,  'freportw',  -396,   -283,  -23,  500],
    "Rivervale"                                   => [0, 'rivervale',  -140,    -10,    4,  220],
    "Western Plains of Karana (Combine Spires)"   => [0, 'qey2hh1', -14816, -3570,   36,  400],
    "Northern Plains of Karana (Gypsy Camp)"      => [0, 'northkarana',  -175,   -688,  -7.5,  10],
    "Southern Plains of Karana (Aviak Village)"   => [0, 'southkarana',  1027,  -6689,    0,  260],
    "Eastern Plains of Karana (Druid Ring)"       => [0, 'eastkarana',   423,   1333,    1,  210],
    "Blackburrow"                                 => [0, 'blackburrow',    -7,     38,    3,  300],
    "West Commonlands (Roadside Inn)"             => [0, 'commons',   503,   -127,  -51,  128],
    "Erudin"                                      => [2, 'erudnext',  -240,  -1216,   52,  510],
    "Lavastorm Mountains (Druid Ring)"            => [0, 'lavastorm',  1318,    918,  119,  270],
    "Halas"                                       => [0, 'halas',     0,     26, 3.75,  256],
    "Oasis of Marr"                               => [0, 'oasis',   110,    532,    6,  225],
    "The Ruins of Old Paineel"                    => [2, 'hole',  -543,    287, -140,  125],
    "Neriak Commons"                              => [0, 'neriakb',  -493,      3,  -10,  128],
    "The Feerrott"                                => [0, 'feerrott', -1830, 430, 18, 33],
    "Accursed Temple of Cazic-Thule"              => [0, 'cazicthule', -466, 255, 20, 400],
    "Timorous Deep (The Firepots)"                => [3, 'timorous',  4366, -12270, -279,    0],
    "Oggok"                                       => [0, 'oggok', 513, 465, 3.75, 205],
    "Grobb"                                       => [0, 'grobb', -200, 223, 3.75, 414],
    "Greater Faydark (Druid Ring)"                => [1, 'gfaydark', -385, 458, 0, 0],
    "Ak'anon"                                     => [1, 'akanon', -761, 1279, -24.25, 182.25],
    "Castle of Mistmoore"                         => [1, 'mistmoore', 122, -294, -179, 135],
    "Southern Kaladim"                            => [1, 'kaladima', 197, 90, 3.75, 492],
    "Northern Felwithe"                           => [1, 'felwithea', -626, 240, -10.25, 330],
    "The Ocean of Tears"                          => [0, 'oot', -9172, 394, 6, 188],
    "Dagnor's Cauldron (Near Unrest)"             => [1, 'cauldron', -700, -1790, 100, 11],
    "Paineel"                                     => [2, 'paineel', 553, 746, -118, 0],
    "The Field of Bone"                           => [3, 'fieldofbone', 1617, -1684, -55, 0],
    "Firiona Vie"                                 => [3, 'firiona', 1825, -2397, -98, 423],
    "Lake of Ill Omen" => [3, 'lakeofillomen', -1070, 985, 78, 145],
    "The Dreadlands" => [3, 'dreadlands', 9633, 3005, 1049, 0],
    "Karnor's Castle" => [3, 'karnor', 160, 251, 3.75, 310],
    "The City of Mist" => [3, 'cityofmist', -784, 0, 3, 115],
    "The Skyfire Mountains" => [3, 'skyfire', 780, -3100, -158, 0],
    "The Overthere" => [3, 'overthere', 1480, -2757, 11, 500],
    "Trakanon's Teeth" => [3, 'trakanon', -4720, -1620, -473, 320],
    "Eastern Cabilis" => [3, 'cabeast', -136, 969, 4.68, 271],
    "The Iceclad Ocean (Tower of Frozen Shadow)" => [4, 'iceclad', 3127, 1300, 111, 500],
    "Eastern Wastes (Crystal Caverns)" => [4, 'eastwastes', 464, -4037, 144, 178], 
    "Cobalt Scar" => [4, 'cobaltscar', -1633, -1064, 296, 115],
    "The Wakening Land" => [4, 'wakening', 4552, 1455, -60, 130],
    "The Western Wastes (Temple of Veeshan)" => [4, 'westwastes', 808, 1323, -196, 373],
    "The City of Shar Vahl" => [5, 'sharvahl', 250, 55, -188, 400],
);

sub CheckSpawnWaypoints {
    my $entity_list = plugin::val('$entity_list');
    quest::debug("CheckSpawnWaypoints");
    foreach my $location_name (keys %waypoints) {
        quest::debug("Checking $location_name");
        my @waypoint = @{$waypoints{$location_name}};                
        if (!$entity_list->IsMobSpawnedByNpcTypeID(26999)) {
            my $npc = quest::spawn2(26999, 0, 0, $waypoint[2], $waypoint[3], $waypoint[4], $waypoint[5]);
        }
    }
}

sub AddWaypoint {
    my $waypoint = shift;
    my $client   = shift || plugin::val('$client');

    if ($client) {
        my %account_data = map { $_ => 1 } split(',', quest::get_data("Waypoints-" . $client->AccountID()));
        my %character_data = map { $_ => 1 } split(',', $client->GetBucket("Waypoints"));
        my $return_feedback = 0;

        if (exists $waypoints{$waypoint}) {
            if (!exists $account_data{$waypoint}) {
                $account_data{$waypoint} = 1;
                quest::set_data("Waypoints-" . $client->AccountID(), join(',', keys %account_data));
                $return_feedback = 1;
            }

            if (!exists $character_data{$waypoint}) {
                $character_data{$waypoint} = 1;
                $client->SetBucket("Waypoints", join(',', keys %character_data));
                if ($client->IsSeasonal() || $client->IsHardcore()) {
                    $return_feedback = 1;
                }
            }
        } else {
            quest::debug("Attempted to add an invalid or undefined waypoint to " . $client->GetName());
        }
    } else {
        quest::debug("Attempted to add a waypoint to a nonspecified client.");
    }

    return $return_feedback;
}


sub GetWaypoints {
    my $client = shift || plugin::val('$client');
    my %data;
    my %return;
    
    if ($client) {        
        if ($client->IsSeasonal() || $client->IsHardcore()) {
            %data = map { $_ => 1 } split(',', quest::get_data("Waypoints-" . $client->AccountID()));
        } else {
            %data = map { $_ => 1 } split(',', $client->GetBucket("Waypoints"));
        }

        foreach my $key (keys %waypoints) {
            if (exists $data{$key}) {
                $return{$key} = $waypoints{$key};
            }
        }          
    } else {
        quest::debug("Attempted to get waypoints for an invalid or unspecified client.");
        return undef;
    }
    return \%return;
}

sub AddDefaultAttunement {
    use feature 'switch'
    my $client = shift || plugin::val('$client');
    if ($client) {
        my $bind_zone = quest::GetZoneShortName($client->GetBindZoneID());

        if (!$bind_zone || $bind_zone eq 'poknowledge' || $bind_zone eq 'tutorialb' || !plugin::is_eligible_for_zone($client, $bind_zone)) {
            AddWaypoint($client, 'freportw');
            AddWaypoint($client, 'gfaydark');
        }

        AddWaypoint($client, $bind_zone);
    }
}

sub get_portal_destinations {
    return {
        10092   => ['The Plane of Hate', 666, 186, -393, 656, 3],
        10094   => ['The Plane of Sky', 674, 71, 539, 1384, -664],
        876000  => ['The Northern Plains of Karana', 2708, 13, 1209, -3685, -5],
        876001  => ['East Commonlands', 4176, 22, -140, -1520, 3],
        876002  => ['The Lavastorm Mountains', 534, 27, 460, 460, -86],
        876003  => ['Toxxulia Forest', 2707, 38, -916, -1510, -33],
        876004  => ['The Greater Faydark', 2706, 54, -441, -2023, 4],
        876005  => ['The Dreadlands', 2709, 86, 9658, 3047, 1052],
        876006  => ['The Iceclad Ocean', 2284, 110, 385, 5321, -17],
        876007  => ['Cobalt Scar', 2031, 117, -1634, -1065, 299],
        876009  => ['The Twilight Sea', 3615, 170, -1028, 1338, 39],
        876010  => ['Stonebrunt Mountains', 3794, 100, 673, -4531, 0],
        876011  => ['Wall of Slaughter', 6180, 300, -943, 13, 130],
        976016  => ['Barindu, Hanging Gardens', 5733, 283, 590, -1457, -123],
        88739   => ['The Plane of Time', 20543, 219, 0, 110, 8],
        976015  => ['Field of Bone', 11178, 78, 2802, 1194, -7],
        976014  => ['Western Wastes', 111120, 120, 2307, 889, -21],
        976013  => ['Scarlet Desert', 111175, 175, -1777, -956, -99],
        976010  => ['Everfrost', 11130, 30, 590, -791, -54],
    };
}