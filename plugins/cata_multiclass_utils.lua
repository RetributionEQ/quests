function CommonCharacterUpdate(client)
    client = client or plugin.val('$client')
    GrantClassesAA(client)
    GrantGeneralAA(client) -- Grant the general here too

    plugin.CheckWorldWideBuffs(client)
    plugin.UpdateCharMaxLevel(client)
    plugin.ConvertFlags(client)

    plugin.set_default_attunement(client.AccountID(), client.GetRace())
end

function GetClassMap()
    return {
        [1] = "Warrior",
        [2] = "Cleric",
        [3] = "Paladin",
        [4] = "Ranger",
        [5] = "Shadow Knight",
        [6] = "Druid",
        [7] = "Monk",
        [8] = "Bard",
        [9] = "Rogue",
        [10] = "Shaman",
        [11] = "Necromancer",
        [12] = "Wizard",
        [13] = "Magician",
        [14] = "Enchanter",
        [15] = "Beastlord",
        [16] = "Berserker"
    }
end

function GetClassBitmask(class_id)
    if class_id < 1 or class_id > 16 then
        return -1
    end
    local bitmask = 1 << (class_id - 1)
    return bitmask
end

function IsMeleeClass(class_id)
    local melee_classes = {1, 3, 4, 5, 7, 8, 9, 15, 16}

    for _, melee_class in ipairs(melee_classes) do
        if melee_class == class_id then
            return true
        end
    end
    return false
end

function HasMeleeClass(client)
    client = client or plugin.val('$client')
    local class_bits = client.GetClassesBitmask()

    -- Iterate through each possible class ID
    for class_id = 1, 16 do
        -- Check if the class bit is set in the bitmask
        if class_bits & (1 << (class_id - 1)) ~= 0 then
            -- Check if the class is a melee class
            if IsMeleeClass(class_id) then
                return true
            end
        end
    end

    -- Return false if no melee class is found
    return false
end

function HasClass(class, client)
    client = client or plugin.val('$client')
    local class_map = GetClassMap()  -- Get the full class map
    local class_bits = client.GetClassesBitmask()

    -- Iterate through each possible class ID
    for class_id, class_name in pairs(class_map) do
        -- Check if the class bit is set in the bitmask and that the class matches the check we're checking
        if class_bits & (1 << (class_id - 1)) ~= 0 and class_map[class_id] == class then
            -- Check if the class matches the provided class
            return true
        end
    end

    -- Return false if the class isn't in there
    return false
end

function AddClass(class_id, client)
    client = client or plugin.val('$client')

    if class_id and class_id > 0 and class_id < 17 and GetClassesCount(client) < 3 then
        client.AddExtraClass(class_id)
        quest.ding()

        local name = client.GetCleanName()
        local class_name = quest.getclassname(class_id)
        local full_class_name = GetPrettyClassString(client)

        client.Message(15, "You have permanently gained access to the " .. class_name .. " class, and are now a " .. full_class_name .. ".")
        GrantClassesAA()

        if CheckUniqueClass(client.GetClassesBitmask()) then
            local class_bits = client.GetClassesBitmask()
            quest.set_data("class-" .. class_bits, class_bits)
            plugin.WorldAnnounce(name .. " has become the FIRST " .. full_class_name .. ".")
        else
            plugin.WorldAnnounce(name .. " has become a " .. full_class_name .. ".")
        end

        if class_id == 8 then
            quest.permaclass(8)
        elseif IsMeleeClass(class_id) and not IsMeleeClass(client.GetClass()) then
            quest.permaclass(class_id)
        end
    end
end

function CheckUniqueClass(client)
    local class_bits = client.GetClassesBitmask()
    local class_bit_bucket = quest.get_data("class-" .. class_bits)

    if class_bit_bucket then
        return false
    else
        return true
    end
end

function GetPrettyClassString(client)
    client = client or plugin.val('$client')  -- Ensure $client is available
    local class_map = GetClassMap()  -- Get the full class map
    local class_bits = client.GetClassesBitmask()  -- Retrieve the class bits for the client

    local client_classes = {}

    -- Iterate through class IDs to check which classes the client has
    for class_id = 1, 16 do
        if class_bits & (1 << (class_id - 1)) ~= 0 then
            table.insert(client_classes, class_map[class_id])  -- Add class name if the client has it
        end
    end

    -- Join the client's class names with slashes
    local pretty_class_string = table.concat(client_classes, '/')

    return pretty_class_string
end

function GetClassesCount(client)
    client = client or plugin.val('$client')

    if client then
        local class_bits = client.GetClassesBitmask()
        local count = 0

        while class_bits ~= 0 do
            count = count + (class_bits & 1)
            class_bits = class_bits >> 1
        end

        return count
    end

    -- Return 0 or an appropriate value if client is not provided or no classes bits are set
    return 0
end

function GetExtraClassesList(client)
    client = client or plugin.val('$client')
    local class_map = GetClassMap()
    local class_bits = client.GetClassesBitmask()
    local available_classes = {}

    -- Determine which classes the player does NOT have based on class bits
    for class_id, class_name in pairs(class_map) do
        if class_bits & (1 << (class_id - 1)) == 0 then
            available_classes[class_id] = class_name
        end
    end

    return available_classes
end

function GetClassesSelectionString(client)
    client = client or plugin.val('$client')
    local available_classes = GetExtraClassesList(client)
    local selection_strings = {}

    for class_id, class_name in pairs(available_classes) do
        local signal_string = "select_class_" .. class_id  -- Unique signal string based on class ID
        table.insert(selection_strings, "[" .. quest.saylink(signal_string, 1, class_name) .. "]")
    end

    local selection_string = table.concat(selection_strings, ", ", 1, #selection_strings - 1)
    selection_string = selection_string .. ", or " .. selection_strings[#selection_strings]  -- Append last selection string

    return selection_string
end

function IsValidToAddClass(class_id_to_add, client)
    client = client or plugin.val('$client')  -- Assuming $client is accessible in this context

    -- Retrieve the client's current class bits
    local class_bits = client.GetClassesBitmask()

    -- Count the number of classes the client already has
    local classes_count = 0
    for i = 1, 16 do
        classes_count = classes_count + ((class_bits & (1 << (i - 1))) ~= 0 and 1 or 0)
    end

    -- Check if the client already has this class
    local has_class_already = (class_bits & (1 << (class_id_to_add - 1))) ~= 0

    -- Determine if eligible to add: less than 3 classes and doesn't already have this class
    return classes_count < 3 and not has_class_already
end

function GrantGeneralAA(client)
    client = client or plugin.val('$client')

    local general_aa = {
        [1000] = 1,  -- Bazaar Gate
        [12636] = 8, -- Eyes Wide Open
        [1021] = 5   -- Mystical Attuning
    }

    for aa_id, rank_count in pairs(general_aa) do
        while client.GetAA(aa_id) < rank_count do
            client.IncrementAA(aa_id)
        end
    end
end

function GrantClassAA(client, PCClass)
    -- Define a table where each class ID maps to a table of its AAs and rank counts
    local class_aa = {
        [1] = { -- Warrior
            ['6283'] = 1, -- Infused by Rage
            ['6607'] = 1, -- Vehement Rage
            ['4739'] = 1, -- Killing Spree
            ['1597'] = 1  -- Call of Challenge
        },
        [2] = { -- Cleric
            ['12652'] = 1, -- Twincast
            ['507'] = 1,   -- Divine Arbitration
            ['746'] = 1    -- Divine Avatar
        },
        [3] = { -- Paladin
            ['188'] = 1,  -- Divine Stun
            ['6395'] = 1  -- Blessing of Life
        },
        [4] = { -- Ranger
            ['205'] = 1,  -- Endless Quiver
            ['1196'] = 1, -- Bow Mastery
            ['645'] = 1,  -- Entrap
            ['1345'] = 1  -- Auspice of the Hunter
        },
        [5] = { -- Shadow Knight
            ['5085'] = 1,  -- Mortal Coil
            ['13165'] = 1  -- Explosion of Spite
        },
        [6] = { -- Druid
            ['548'] = 1,   -- Spirit of the Wood
            ['14264'] = 1, -- Paralytic Spores
            ['767'] = 3,   -- Critical Affliction (assuming ranks based on script context)
            ['6375'] = 1   -- Destructive Cascade
        },
        [7] = { -- Monk
            ['810'] = 1,  -- Stonewall
            ['1352'] = 1  -- Crippling Strike
        },
        [8] = { -- Bard
            ['630'] = 1,  -- Fading Memories
            ['556'] = 5,  -- Harmonious Attack (all ranks)
            ['1110'] = 1, -- Dance of Blades
            ['225'] = 1   -- Jam Fest
        },
        [9] = { -- Rogue
            ['287'] = 1,  -- Chaotic Stab
            ['605'] = 1,  -- Shroud of Stealth
            ['4739'] = 1  -- Killing Spree
        },
        [10] = { -- Shaman
            ['10957'] = 1, -- Group Shrink
            ['1327'] = 1,  -- Ancestral Aid
            ['8227'] = 1   -- Summon Companion
        },
        [11] = { -- Necromancer
            ['767'] = 1,   -- Critical Affliction
            ['6375'] = 1,  -- Destructive Cascade
            ['734'] = 1,   -- Pet Affinity
            ['12770'] = 1, -- Pestilent Paralysis
            ['8227'] = 1   -- Summon Companion
        },
        [12] = { -- Wizard
            ['155'] = 1,  -- Improved Familiar
            ['516'] = 1,  -- Harvest of Druzzil
            ['5295'] = 1  -- Arcane Overkill
        },
        [13] = { -- Mage
            ['8201'] = 1, -- Companion's Fury
            ['734'] = 1,  -- Pet Affinity
            ['8342'] = 1, -- Host in the Shell
            ['8227'] = 1  -- Summon Companion
        },
        [14] = { -- Enchanter
            ['158'] = 1,  -- Permanent Illusion
            ['643'] = 1,  -- Project Illusion
            ['10551'] = 1,-- Phantasmic Reflex
            ['580'] = 3,  -- Animation Empathy (all ranks)
            ['734'] = 1,  -- Pet Affinity
            ['8227'] = 1  -- Summon Companion
        },
        [15] = { -- Beastlord
            ['11080'] = 1, -- Chameleon Strike
            ['6984'] = 1,  -- Bite of the Asp
            ['734'] = 1,   -- Pet Affinity
            ['8227'] = 1  -- Summon Companion
        },
        [16] = { -- Berserker
            ['4739'] = 1, -- Killing Spree
            ['258'] = 1   -- Rampage
        }
    }

    for aa_id, rank_count in pairs(class_aa[PCClass]) do
        if client.GetAA(aa_id) < rank_count then
            client.IncrementAA(aa_id)
        end
    end
end

function GrantClassesAA(client)
    client = client or plugin.val('$client')
    local class_bitmask = client.GetClassesBitmask()

    -- Iterate through each class ID (bit position)
    for i = 0, 15 do
        if class_bitmask & (1 << i) ~= 0 then
            -- Call GrantClassAA for each class found in the bitmask
            GrantClassAA(client, i + 1)
        end
    end
end


