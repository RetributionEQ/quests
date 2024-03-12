sub CommonCharacterUpdate {    
    my $client = shift || plugin::val('$client');
    GrantClassesAA();
}


sub WelcomePopUp {
    my $color_end = "</c>";
    my $break = "<br>";
    my $yellow = plugin::PWColor("Yellow");
    my $red    = plugin::PWColor("Red");
    my $green  = plugin::PWColor("Green");

    my $website = plugin::PWHyperLink("https://heroesjourneyeq.com","website");
    my $discord = plugin::PWHyperLink("https://discord.gg/h4eRaGjc5T","discord");

    my $popup_title = "Welcome to The Heroes' Journey";
    my $popup_message = 
        "The Heroes' Journey is a single-box, small-group focused server with a variety of ${yellow}UNIQUE${color_end} mechanics and features. " .
        "We have worked hard on this project to deliver an experience never seen before, and hope that you enjoy the result! Please visit our $website and $discord for more information!${break}${break}" .
        "${green}Multiclassing${color_end}: Characters on The Heroes' Journey each have three classes. You chose one during character creation, " .
        "and you will choose two more now. You will gain the abilities and attributes of each of the chosen classes; " .
        "Spells, Skills, Equipment, Alternate Advancement abilities, and even more 'hidden' features like AC caps and melee damage bonuses. ${break}${break}" .
        "${green}Patcher and Client software${color_end}: You ${red}MUST${color_end} use our client on this server. " .
        "This isn't a simple matter of spell and string files; much of the multiclassing system will not work at all without the custom client modifications we have made. ${break}${break}" .
        "${green}Permanent Buffs${color_end}: Buff timers do not count down if they were cast by yourself or a group member. This also applies to pets! ${break}${break}" .
        "${green}Large Bags${color_end}: Bags of greater than 10 slots are available! ${break}${break}";

    quest::popup($popup_title, $popup_message);
}

sub GetClassMap {
    return (
        1 => "Warrior",
        2 => "Cleric",
        3 => "Paladin",
        4 => "Ranger",
        5 => "Shadow Knight",
        6 => "Druid",
        7 => "Monk",
        8 => "Bard",
        9 => "Rogue",
        10 => "Shaman",
        11 => "Necromancer",
        12 => "Wizard",
        13 => "Magician",
        14 => "Enchanter",
        15 => "Beastlord",
        16 => "Berserker",
    );
}

sub GetClassBitmask {
    my ($class_id) = @_;
    if ($class_id < 1 || $class_id > 16) {
        return -1;
    }
    my $bitmask = 1 << ($class_id - 1);
    return $bitmask;
}

sub IsMeleeClass {
    my $class_id = shift;
    my @melee_classes = (1, 3, 4, 5, 7, 8, 9, 15, 16);

    foreach my $melee_class (@melee_classes) {
        if ($melee_class == $class_id) {
            return 1;
        }
    }
    return 0;
}


sub HasMeleeClass {
    my $client   = shift || plugin::val('$client');
    my $class_bits = $client->GetClassesBitmask();
    
    # Iterate through each possible class ID
    for my $class_id (1..16) {
        # Check if the class bit is set in the bitmask
        if ($class_bits & (1 << ($class_id - 1))) {
            # Check if the class is a melee class
            return 1 if IsMeleeClass($class_id);
        }
    }
    
    # Return 0 if no melee class is found
    return 0;
}

sub AddClass {
    my $class_id = shift;
    my $client = shift || plugin::val('$client');

    if ($class_id && $class_id > 0 && $class_id < 17 && GetClassesCount($client) < 3) {
        $client->AddExtraClass($class_id);
        quest::ding();

        my $name = $client->GetCleanName();
        my $class_name = quest::getclassname($class_id);
        my $full_class_name = GetPrettyClassString();        

        $client->Message(15, "You have permanently gained access to the $class_name class, and are now a $full_class_name.");
        GrantClassesAA();

        if (CheckUniqueClass($client->GetClassesBitmask())) {
            my $class_bits          = $client->GetClassesBitmask();
            quest::set_data("class-$class_bits", $class_bits);
            plugin::WorldAnnounce("$name has become the FIRST $full_class_name.");            
        } else {
            plugin::WorldAnnounce("$name has become a $full_class_name.");
        }        

        if ($class_id == 8) {
            quest::permaclass(8);
        } elsif (plugin::IsMeleeClass($class_id) && !plugin::IsMeleeClass($client->GetClass())) {
            quest::permaclass($class_id);
        }
    }    
}

sub CheckUniqueClass {
    my $client              = plugin::val('$client');
    my $class_bits          = $client->GetClassesBitmask();
    my $class_bit_bucket    = quest::get_data("class-$class_bits");    

    if ($class_bit_bucket) {
        return 0;
    } else {
        return 1;
    }
}



sub GetPrettyClassString {
    my $client = shift || plugin::val('$client');  # Ensure $client is available
    my %class_map = GetClassMap();  # Get the full class map
    my $class_bits = $client->GetClassesBitmask();  # Retrieve the class bits for the client

    my @client_classes;

    # Iterate through class IDs to check which classes the client has
    foreach my $class_id (sort { $a <=> $b } keys %class_map) {
        if ($class_bits & (1 << ($class_id - 1))) {
            push @client_classes, $class_map{$class_id};  # Add class name if the client has it
        }
    }

    # Join the client's class names with slashes
    my $pretty_class_string = join('/', @client_classes);

    return $pretty_class_string;
}

sub GetClassesCount {
    my $client = shift || plugin::val('$client');

    if ($client) {
        my $class_bits = $client->GetClassesBitmask();
        my $count = 0;
        
        while ($class_bits) {
            $count += $class_bits & 1;
            $class_bits >>= 1;
        }

        return $count;
    }

    # Return 0 or an appropriate value if $client is not provided or no classes bits are set
    return 0;
}

sub GetExtraClassesList {
    my $client = shift || plugin::val('$client');
    my %class_map = GetClassMap();
    my $class_bits = $client->GetClassesBitmask();
    my %available_classes;

    # Determine which classes the player does NOT have based on class bits
    foreach my $class_id (keys %class_map) {
        unless ($class_bits & (1 << ($class_id - 1))) {
            $available_classes{$class_id} = $class_map{$class_id};
        }
    }

    return %available_classes;
}

sub GetClassesSelectionString {
    my $client = shift || plugin::val('$client');
    my %available_classes = GetExtraClassesList($client);
    my @selection_strings;

    foreach my $class_id (sort { $a <=> $b } keys %available_classes) {
        my $class_name = $available_classes{$class_id};
        my $signal_string = "select_class_" . $class_id; # Unique signal string based on class ID
        push @selection_strings, "[".quest::saylink($signal_string, 1, $class_name)."]";
    }

    my $selection_string = join(", ", @selection_strings[0 .. $#selection_strings-1]);
    $selection_string .= ", or " . $selection_strings[-1] if @selection_strings > 1;

    return $selection_string;
}

sub IsValidToAddClass {
    my $class_id_to_add = shift;
    my $client = plugin::val('$client'); # Assuming $client is accessible in this context

    # Retrieve the client's current class bits
    my $class_bits = $client->GetClassesBitmask();

    # Count the number of classes the client already has
    my $classes_count = 0;
    for (my $i = 1; $i <= 16; $i++) {
        $classes_count += ($class_bits & (1 << ($i - 1))) ? 1 : 0;
    }

    # Check if the client already has this class
    my $has_class_already = ($class_bits & (1 << ($class_id_to_add - 1))) ? 1 : 0;

    # Determine if eligible to add: less than 3 classes and doesn't already have this class
    return ($classes_count < 3 && !$has_class_already);
}

sub GrantGeneralAA {
    my $client = shift || plugin::val('$client');

    my @general_aa = (
        1000,  # Bazaar Gate
        12636, # Eyes Wide Open 1
        12637, # Eyes Wide Open 2
        8445,  # Eyes Wide Open 3
        8446,  # Eyes Wide Open 4
        8447,  # Eyes Wide Open 5
        16419, # Eyes Wide Open 6
        16420, # Eyes Wide Open 7
        16421, # Eyes Wide Open 8
        1021,  # Mystical Attuning 1
        1022,  # Mystical Attuning 2
        1023,  # Mystical Attuning 3
        1024,  # Mystical Attuning 4
        1025   # Mystical Attuning 5
    );
    
    # Iterate over the AA IDs and increment each one for the client
    foreach my $aa_id (@general_aa) {
        $client->IncrementAA($aa_id);
    }
}

sub GrantClassAA {
    my ($client, $PCClass) = @_;

    # Define a hash where each class ID maps to an array of its AAs
    my %class_aa = (
        1 => [6283, 6607, 4739, 1597], # Warrior
        2 => [12652, 507, 746], # Cleric
        3 => [188, 6395], # Paladin
        4 => [205, 1196, 645, 1345], # Ranger
        5 => [5085, 13165], # Shadow Knight
        6 => [548, 14264, 767, 6375], # Druid
        7 => [1352, 611], # Monk
        8 => [630, 556, 557, 558, 559, 560, 1110, 225], # Bard
        9 => [287, 605, 4739], # Rogue
        10 => [10957, 1327, 8227, 288], # Shaman
        11 => [767, 6375, 734, 12770, 8227, 288, 1129, 1130], # Necromancer
        12 => [155, 516, 5295], # Wizard
        13 => [8201, 734, 8342, 8227, 288, 1129, 1130], # Mage
        14 => [158, 643, 10551, 580, 581, 582, 734, 8227, 288, 1129, 1130], # Enchanter
        15 => [6984, 734, 8227, 724, 288], # Beastlord
        16 => [4739, 258, 6607], # Berserker 
    );    

    foreach my $aa_id (@{$class_aa{$PCClass}}) {
        if (!$client->GetAA($aa_id)) {
            $client->IncrementAA($aa_id);
        } else {
            my $name = $client->GetCleanName();
            quest::debug("$name already has aa_id $aa_id");
        }
    }
    
}

sub GrantClassesAA {
    my $client = shift || plugin::val('$client');
    my $class_bitmask = $client->GetClassesBitmask();

    GrantGeneralAA(); # Grant the general here too

    # Iterate through each class ID (bit position)
    for (my $i = 0; $i < 16; $i++) { 
        if ($class_bitmask & (1 << $i)) {
            # Call GrantClassAA for each class found in the bitmask
            GrantClassAA($client, $i + 1);
        }
    }
}
