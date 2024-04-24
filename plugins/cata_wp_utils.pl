my @categories = (
    'Antonica',  # 0 
    'Faydwer',   # 1 
    'Odus',      # 2 
    'Kunark',    # 3 
    'Velious',   # 4 
    'Luclin',    # 5 
    'The Planes',# 6 
    'Taelosia',  # 7 
    'Discord'    # 8 
);

my %waypoints = (
    'qeynos2'       => ["North Qeynos", 0, 392, 165, 4, 310],
    'qrg'           => ["Surefall Glade", 0, -66, 45, 4, 200],
    'freportw'      => ["West Freeport", 0, -396, -283, -23, 500],
    'rivervale'     => ["Rivervale", 0, -140, -10, 4, 220],
    'qey2hh1'       => ["Western Plains of Karana (Combine Spires)", 0, -14816, -3570, 36, 400],
    'northkarana'   => ["Northern Plains of Karana (Gypsy Camp)", 0, -175, -688, -7.5, 10],
    'southkarana'   => ["Southern Plains of Karana (Aviak Village)", 0, 1027, -6689, 0, 260],
    'eastkarana'    => ["Eastern Plains of Karana (Druid Ring)", 0, 423, 1333, 1, 210],
    'blackburrow'   => ["Blackburrow", 0, -7, 38, 3, 300],
    'commons'       => ["West Commonlands (Roadside Inn)", 0, 503, -127, -51, 128],
    'erudnext'      => ["Erudin", 2, -240, -1216, 52, 510],
    'lavastorm'     => ["Lavastorm Mountains (Druid Ring)", 0, 1318, 918, 119, 270],
    'halas'         => ["Halas", 0, 0, 26, 3.75, 256],
    'oasis'         => ["Oasis of Marr", 0, 110, 532, 6, 225],
    'hole'          => ["The Ruins of Old Paineel", 2, -543, 287, -140, 125],
    'neriakb'       => ["Neriak Commons", 0, -493, 3, -10, 128],
    'feerrott'      => ["The Feerrott", 0, -1830, 430, 18, 33],
    'cazicthule'    => ["Accursed Temple of Cazic-Thule", 0, -466, 255, 20, 400],    
    'oggok'         => ["Oggok", 0, 513, 465, 3.75, 205],
    'grobb'         => ["Grobb", 0, -200, 223, 3.75, 414],
    'gfaydark'      => ["Greater Faydark (Druid Ring)", 1, -385, 458, 0, 0],
    'akanon'        => ["Ak'anon", 1, -761, 1279, -24.25, 182.25],
    'mistmoore'     => ["Castle of Mistmoore", 1, 122, -294, -179, 135],
    'kaladima'      => ["Southern Kaladim", 1, 197, 90, 3.75, 492],
    'felwithea'     => ["Northern Felwithe", 1, -626, 240, -10.25, 330],
    'oot'           => ["The Ocean of Tears", 0, -9172, 394, 6, 188],
    'cauldron'      => ["Dagnor's Cauldron (Near Unrest)", 1, -700, -1790, 100, 11],
    'paineel'       => ["Paineel", 2, 553, 746, -118, 0],
    'fieldofbone'   => ["The Field of Bone", 3, 1617, -1684, -55, 0],
    'firiona'       => ["Firiona Vie", 3, 1825, -2397, -98, 423],
    'lakeofillomen' => ["Lake of Ill Omen", 3, -1070, 985, 78, 145],
    'dreadlands'    => ["The Dreadlands", 3, 9633, 3005, 1049, 0],
    'karnor'        => ["Karnor's Castle", 3, 160, 251, 3.75, 310],
    'cityofmist'    => ["The City of Mist", 3, -784, 0, 3, 115],
    'skyfire'       => ["The Skyfire Mountains", 3, 780, -3100, -158, 0],
    'overthere'     => ["The Overthere", 3, 1480, -2757, 11, 500],
    'trakanon'      => ["Trakanon's Teeth", 3, -4720, -1620, -473, 320],
    'cabeast'       => ["Eastern Cabilis", 3, -136, 969, 4.68, 271],
    'iceclad'       => ["The Iceclad Ocean (Tower of Frozen Shadow)", 4, 3127, 1300, 111, 500],
    'eastwastes'    => ["Eastern Wastes (Crystal Caverns)", 4, 464, -4037, 144, 178],
    'cobaltscar'    => ["Cobalt Scar", 4, -1633, -1064, 296, 115],
    'wakening'      => ["The Wakening Land", 4, 4552, 1455, -60, 130],
    'westwastes'    => ["The Western Wastes (Temple of Veeshan)", 4, 808, 1323, -196, 373],
    'sharvahl'      => ["The City of Shar Vahl", 5, 250, 55, -188, 400],
    'ssratemple'    => ["Ssraeshza Temple", 5, -6.5, 0, 4, 0],
    'dawnshroud'    => ["The Dawnshroud Peaks", 5, -1260, -280, 97, 500],
    'umbral'        => ["The Umbral Plains", 5, 1840, -640, 24, 0],
    'hateplaneb'    => ["The Plane of Hate", 6, -400, 680, 4, 330], 
    'airplane'      => ["The Plane of Sky", 6, 700, 1560, -680, 300],
    'fearplane'     => ["The Plane of Fear", 6, 1065, -1305, 3, 500],
    'poknowledge'   => ["The Plane of Knowledge", 6, -215, 50, -160, 128],
    'potranquility' => ["The Plane of Tranquility", 6, -8, -192, -528, 115],
    'gunthak'       => ["The Gulf of Gunthak", 0, -410, 1402, 3, 0],
    'natimbi'       => ["Natimbi, the Broken Shores", 7, -310, 125, 520, 70],
    'barindu'       => ["Barindu, Hanging Gardens", 7, 210, -515, -117, 510],
    'kodtaz'        => ["Kod'Taz, Broken Trial Grounds", 7, 1536, -2422, -348, 4],
    'qvic'          => ["Qvic, Prayer Grounds of Calling", 7, -1018, -1403, -490, 3],
    'txevu'         => ["Txevu, Lair of the Elite", 7, -316, -20, -420, 430],
);

sub AddDefaultAttunement {
    my $client = shift || plugin::val('$client');
    if ($client && !($client->IsSeasonal() || $client->IsHardcore())) {
        AddWaypoint('qeynos2');
        AddWaypoint('freportw');
        AddWaypoint('rivervale');
        AddWaypoint('erudnext');
        AddWaypoint('halas');
        AddWaypoint('neriakb');
        AddWaypoint('oggok');
        AddWaypoint('grobb');
        AddWaypoint('gfaydark');
        AddWaypoint('felwithea');
        AddWaypoint('akanon');
        AddWaypoint('kaladima');
        AddWaypoint('cabeast');
        AddWaypoint('sharvahl');
        AddWaypoint('paineel');
    }
}

sub AwardBonusUnlocks {
    my $client   = shift || plugin::val('$client');
    my $eligible = quest::get_data($client->AccountID() . "-TL-Account-A") ||
                   quest::get_data($client->AccountID() . "-TL-Account-G") ||
                   quest::get_data($client->AccountID() . "-TL-Account-O") ||
                   quest::get_data($client->AccountID() . "-TL-Account-F") ||
                   quest::get_data($client->AccountID() . "-TL-Account-K") ||
                   quest::get_data($client->AccountID() . "-TL-Account-V") ||
                   quest::get_data($client->AccountID() . "-TL-Account-L") ||
                   quest::get_data($client->AccountID() . "-TL-Account-P") ||
                   quest::get_data($client->AccountID() . "-TL-Account-T") ||
                   quest::get_data($client->AccountID() . "-TL-Account-D");


    if ($eligible) {
        foreach my $zone (keys %waypoints) {
            AddWaypoint($zone);
        }
    }
}

sub GetContinents {
    return @categories;
}

sub CheckSpawnWaypoints {
    my $entity_list = plugin::val('$entity_list');
    my $zonesn      = plugin::val('$zonesn');

    if (exists $waypoints{$zonesn}) {
        my @waypoint = @{$waypoints{$zonesn}};
        if (!$entity_list->IsMobSpawnedByNpcTypeID(26999)) {
            my $npc = quest::spawn2(26999, 0, 0, $waypoint[2], $waypoint[3], $waypoint[4], $waypoint[5]);
        }
    }
}

sub AddWaypoint {
    my $waypoint = shift || plugin::val('$zonesn');
    my $client   = shift || plugin::val('$client');
    my $return_feedback = 0;

    if ($client) {
        my %account_data = map { $_ => 1 } split(',', quest::get_data("Waypoints-" . $client->AccountID()));
        my %character_data = map { $_ => 1 } split(',', $client->GetBucket("Waypoints"));        

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
    my $continent = shift || -1;  # Defaults to -1 if no argument is given
    my $client = shift || plugin::val('$client');
    my %data;
    my %return;
    
    if ($client) {        
        if (!($client->IsSeasonal() || $client->IsHardcore())) {
            %data = map { $_ => 1 } split(',', quest::get_data("Waypoints-" . $client->AccountID()));
        } else {
            %data = map { $_ => 1 } split(',', $client->GetBucket("Waypoints"));
        }

        foreach my $key (keys %waypoints) {
            if (exists $data{$key} && ($continent == -1 || $waypoints{$key}[1] == $continent)) {
                $return{$key} = $waypoints{$key};
            }
        }          
    } else {
        quest::debug("Attempted to get waypoints for an invalid or unspecified client.");
        return undef;
    }
    return %return;
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