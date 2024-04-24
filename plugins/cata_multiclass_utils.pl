sub CommonCharacterUpdate {    
    my $client = shift || plugin::val('$client');
    GrantClassesAA($client);
    GrantGeneralAA($client); # Grant the general here too

    plugin::CheckWorldWideBuffs($client);
    plugin::UpdateCharMaxLevel($client);
	plugin::ConvertFlags($client);
    plugin::AddDefaultAttunement($client);
    plugin::AwardBonusUnlocks($client);
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

sub HasClass {
    my $classID = shift;
    my $client = shift || plugin::val('$client');
    my $class_bits = $client->GetClassesBitmask();

    # Check if the bit corresponding to the class ID is set in the bitmask
    # Shift 1 left by (classID - 1) positions to create the bitmask for the specific class
    if ($class_bits & (1 << ($classID - 1))) {
        return 1;  # True, class ID is present
    } else {
        return 0;  # False, class ID is not present
    }
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

    my %general_aa = (
        1000 => 1,  # Bazaar Gate
        12636 => 8, # Eyes Wide Open
        1021 => 5,  # Mystical Attuning 
    );
    
    foreach my $aa_id (keys %general_aa) {        
        while ($client->GetAA($aa_id) < $general_aa{$aa_id}) {
            $client->IncrementAA($aa_id);
        }
    } 
}

sub GrantClassAA {
    my ($client, $PCClass) = @_;

    # Define a hash where each class ID maps to a hash of its AAs and rank counts
    my %class_aa = (
        1 => { # Warrior
            '6283' => 1, # Infused by Rage
            '6607' => 1, # Vehement Rage
            '4739' => 1, # Killing Spree
            '1597' => 1, # Call of Challenge
        },
        2 => { # Cleric
            '12652' => 1, # Twincast
            '507' => 1,   # Divine Arbitration
            '746' => 1,   # Divine Avatar
        },
        3 => { # Paladin
            '188' => 1,  # Divine Stun
            '6395' => 1, # Blessing of Life
        },
        4 => { # Ranger
            '205' => 1,   # Endless Quiver
            '1196' => 1,  # Bow Mastery
            '645' => 1,   # Entrap
            '1345' => 1,  # Auspice of the Hunter
        },
        5 => { # Shadow Knight
            '5085' => 1,  # Mortal Coil
            '13165' => 1, # Explosion of Spite
        },
        6 => { # Druid
            '548' => 1,   # Spirit of the Wood
            '14264' => 1, # Paralytic Spores
            '767' => 3,   # Critical Affliction (assuming ranks based on script context)
            '6375' => 1,  # Destructive Cascade
        },
        7 => { # Monk
            '810' => 1,  # Stonewall
            '1352' => 1, # Crippling Strike
        },
        8 => { # Bard
            '630' => 1,  # Fading Memories
            '556' => 5,  # Harmonious Attack (all ranks)
            '1110' => 1, # Dance of Blades
            '225' => 1,  # Jam Fest
        },
        9 => { # Rogue
            '287' => 1,  # Chaotic Stab
            '605' => 1,  # Shroud of Stealth
            '4739' => 1, # Killing Spree
        },
        10 => { # Shaman
            '10957' => 1, # Group Shrink
            '1327' => 1,  # Ancestral Aid
            '8227' => 1,  # Summon Companion
        },
        11 => { # Necromancer
            '767' => 1,    # Critical Affliction
            '6375' => 1,   # Destructive Cascade
            '734' => 1,    # Pet Affinity
            '12770' => 1,  # Pestilent Paralysis
            '8227' => 1,   # Summon Companion
        },
        12 => { # Wizard
            '155' => 1,  # Improved Familiar
            '516' => 1,  # Harvest of Druzzil
            '5295' => 1, # Arcane Overkill
        },
        13 => { # Mage
            '8201' => 1, # Companion's Fury
            '734' => 1,  # Pet Affinity
            '8342' => 1, # Host in the Shell
            '8227' => 1, # Summon Companion
        },
        14 => { # Enchanter
            '158' => 1,  # Permanent Illusion
            '643' => 1,  # Project Illusion
            '10551' => 1,# Phantasmic Reflex
            '580' => 3,  # Animation Empathy (all ranks)
            '734' => 1,  # Pet Affinity
            '8227' => 1, # Summon Companion
        },
        15 => { # Beastlord
            '11080' => 1, # Chameleon Strike
            '6984' => 1,  # Bite of the Asp
            '734' => 1,   # Pet Affinity
            '8227' => 1,  # Summon Companion
        },
        16 => { # Berserker
            '4739' => 1, # Killing Spree
            '258' => 1,  # Rampage
        }
    );   

    foreach my $aa_id (keys %{$class_aa{$PCClass}}) {
        if ($client->GetAA($aa_id) < $class_aa{$PCClass}{$aa_id}) {
            $client->IncrementAA($aa_id);
        }
    }   
}

sub GrantClassesAA {
    my $client = shift || plugin::val('$client');
    my $class_bitmask = $client->GetClassesBitmask();    

    # Iterate through each class ID (bit position)
    for (my $i = 0; $i < 16; $i++) { 
        if ($class_bitmask & (1 << $i)) {
            # Call GrantClassAA for each class found in the bitmask
            GrantClassAA($client, $i + 1);
        }
    }
}