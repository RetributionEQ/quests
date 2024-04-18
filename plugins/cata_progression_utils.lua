-- Breakpoints for original flagging system:
-- Kunark: 2
-- Velious: 3
-- Luclin: 14
-- Planes of Power: 19
-- 'Fabled Classic'/Quarm-Kill: 20

-- Some Constants
local BERSERKER = 16
local BEASTLORD = 15
local IKSAR     = 128
local VAH_SHIR  = 130
local DRAKKIN   = 522
local GUKTAN    = 330

local atlas = {
    ['cabeast']        = 'RoK',
    ['cabwest']        = 'RoK',
    ['burningwood']    = 'RoK',
    ['dreadlands']     = 'RoK',
    ['emeraldjungle']  = 'RoK',
    ['fieldofbone']    = 'RoK',
    ['firiona']        = 'RoK',
    ['lakeofillomen']  = 'RoK',
    ['swampofnohope']  = 'RoK',
    ['timorous']       = 'RoK',
    ['trakanon']       = 'RoK',
    ['warslikswood']   = 'RoK',
    ['chardok']        = 'RoK',
    ['citymist']       = 'RoK',
    ['dalnir']         = 'RoK',
    ['charasis']       = 'RoK',
    ['kaesora']        = 'RoK',
    ['kurn']           = 'RoK',
    ['nurga']          = 'RoK',
    ['droga']          = 'RoK',
    ['sebilis']        = 'RoK',

    ['cobaltscar']     = 'SoV',
    ['crystal']        = 'SoV',
    ['necropolis']     = 'SoV',
    ['eastwastes']     = 'SoV',
    ['greatdivide']    = 'SoV',
    ['iceclad']        = 'SoV',
    ['kael']           = 'SoV',
    ['sleeper']        = 'SoV',
    ['growthplane']    = 'SoV',
    ['mischiefplane']  = 'SoV',
    ['sirens']         = 'SoV',
    ['templeveeshan']  = 'SoV',
    ['thurgadina']     = 'SoV',
    ['thurgadinb']     = 'SoV',
    ['frozenshadow']   = 'SoV',
    ['wakening']       = 'SoV',
    ['westwastes']     = 'SoV',
    ['gunthak']        = 'SoV',
    ['nadox']          = 'SoV',
    ['dulak']          = 'SoV',
    ['hatesfury']      = 'SoV',
    ['torgiran']       = 'SoV',
    ['veksar']         = 'SoV', -- Out of Era

    ['acrylia']        = 'SoL',
    ['akheva']         = 'SoL',
    ['dawnshroud']     = 'SoL',
    ['echo']           = 'SoL',
    ['fungusgrove']    = 'SoL',
    ['griegsend']      = 'SoL',
    ['hollowshade']    = 'SoL',
    ['netherbian']     = 'SoL',
    ['paludal']        = 'SoL',
    ['sseru']          = 'SoL',
    ['scarlet']        = 'SoL',
    ['shadeweaver']    = 'SoL',
    ['shadowhaven']    = 'SoL',
    ['sharvahl']       = 'SoL',
    ['ssratemple']     = 'SoL',
    ['thedeep']        = 'SoL',
    ['thegrey']        = 'SoL',
    ['tenebrous']      = 'SoL',
    ['twilight']       = 'SoL',
    ['umbral']         = 'SoL',
    ['vexthal']        = 'SoL',
    ['nexus']          = 'SoL',
    ['veeshan']        = 'PoP', -- Out of Era

    ['poknowledge']    = 'PoP',
    ['potranquility']  = 'PoP',
    ['ponightmare']    = 'PoP',
    ['nightmareb']     = 'PoP',
    ['podisease']      = 'PoP',
    ['poinnovation']   = 'PoP',
    ['pojustice']      = 'PoP',
    ['postorms']       = 'PoP',
    ['povalor']        = 'PoP',
    ['potorment']      = 'PoP',
    ['codecay']        = 'PoP',
    ['hohonora']       = 'PoP',
    ['hohonorb']       = 'PoP',
    ['bothunder']      = 'PoP',
    ['potactics']      = 'PoP',
    ['solrotower']     = 'PoP',
    ['pofire']         = 'PoP',
    ['poair']          = 'PoP',
    ['powater']        = 'PoP',
    ['poeartha']       = 'PoP',
    ['poearthb']       = 'PoP',
    ['potimea']        = 'PoP',
    ['potimeb']        = 'PoP',    

    ['barindu']        = 'GoD',
    ['ferubi']         = 'GoD',
    ['ikkinz']         = 'GoD',
    ['kodtaz']         = 'GoD',
    ['natimbi']        = 'GoD',
    ['qinimi']         = 'GoD',
    ['qvic']           = 'GoD',
    ['riwwi']          = 'GoD',
    ['snlair']         = 'GoD',
    ['snpool']         = 'GoD',
    ['snplant']        = 'GoD',
    ['sncrematory']    = 'GoD',
    ['tacvi']          = 'GoD',
    ['tipt']           = 'GoD',
    ['txevu']          = 'GoD',
    ['uqua']           = 'GoD',
    ['vxed']           = 'GoD',
    ['yxtta']          = 'GoD',

    ['anguish']        = 'OoW',
    ['harbingers']     = 'OoW',
    ['provinggrounds'] = 'OoW',
    ['causeway']       = 'OoW',
    ['dranik']         = 'OoW',
    ['draniksscar']    = 'OoW',
    ['dranikcatacombsa'] = 'OoW',
    ['dranikcatacombsb'] = 'OoW',
    ['dranikcatacombsc'] = 'OoW',
    ['dranikhollowsa'] = 'OoW',
    ['dranikhollowsc'] = 'OoW',
    ['dranikhollowsd'] = 'OoW',
    ['draniksewersa']  = 'OoW',
    ['draniksewersc']  = 'OoW',
    ['draniksewersd']  = 'OoW',
    ['riftseekers']    = 'OoW',
    ['bloodfields']    = 'OoW',
    ['wallofslaughter']= 'OoW',

    ['thenest']        = 'DoN',
    ['delvea']         = 'DoN',
    ['stillmoona']     = 'DoN',
    ['stillmoonb']     = 'DoN',
    ['broodlands']     = 'DoN',
    ['thundercrest']   = 'DoN',
    ['delveb']         = 'DoN',
}

-- Global hash of valid stages
local STAGES = {'RoK', 'SoV', 'SoL', 'PoP', 'GoD', 'OoW', 'DoN', 'FNagafen'}
local VALID_STAGES = {}
for _, stage in ipairs(STAGES) do
    VALID_STAGES[stage] = true
end

-- Global hash of stage prerequisites
local STAGE_PREREQUISITES = {
    ['RoK'] = {'Lord Nagafen', 'Lady Vox'},
    ['SoV'] = {'Trakanon', 'Gorenaire', 'Severilous', 'Talendor'},
    ['SoL'] = {'Lord Yelinak', 'Tukaarak the Warder', 'Nanzata the Warder', 'Ventani the Warder', 'Hraashna the Warder', 'Wuoshi', 'Klandicar', 'Zlandicar'},
    ['PoP'] = {'Thought Horror Overfiend', 'The Insanity Crawler', 'Grieg Veneficus', 'Xerkizh the Creator', 'Emperor Ssraeshza'},
    ['GoD'] = {'Saryrn'},
    ['OoW'] = {'Disabled'},
    ['DoN'] = {'Disabled'},
    ['FNagafen'] = {'Quarm'},
}

for stage, prerequisites in pairs(STAGE_PREREQUISITES) do
    for i, objective in ipairs(prerequisites) do
        prerequisites[i] = string.lower(objective)
    end
end

-- Normalize the objectives to lowercase for case-insensitive handling
for stage, prerequisites in pairs(STAGE_PREREQUISITES) do
    if prerequisites[1] ~= 'Disabled' then
        for i, objective in ipairs(prerequisites) do
            prerequisites[i] = string.lower(objective)
        end
    end
end

local STAGE_DESCRIPTIONS = {
    ['RoK'] = "Ruins of Kunark",
    ['SoV'] = "Scars of Velious",
    ['SoL'] = "Shadows of Luclin",
    ['PoP'] = "Planes of Power",
    ['GoD'] = "Gates of Discord",
    ['OoW'] = "Omens of War",
    ['DoN'] = "Dragons of Norrath",
    ['FNagafen'] = "Fabled Nagafen's Lair",
}

-- Convert to a direct lookup hash
local DIRECT_LOOKUP = {}
for stage, prerequisites in pairs(STAGE_PREREQUISITES) do
    for _, objective in ipairs(prerequisites) do
        DIRECT_LOOKUP[objective] = true
    end
end

local function list_unlock_progress(client)
    for stage, description in pairs(STAGE_DESCRIPTIONS) do
        if is_stage_complete(client, description) then
            plugin.YellowText("You have unlocked access to " .. description .. ".")
        else
            plugin.YellowText("You have NOT unlocked access to " .. description .. ".")
        end
    end
end

local function list_stage_prereq(client, target_stage)
    local prereqs = STAGE_PREREQUISITES[target_stage]
    if prereqs and prereqs[1] ~= 'Disabled' then
        for _, objective in ipairs(prereqs) do
            local completed = get_subflag(client, target_stage, objective) and "completed" or "not completed"
            plugin.YellowText(objective .. ": " .. completed)
        end
    end
end

local function get_subflag_stage(subflag_name)
    subflag_name = string.lower(subflag_name) -- Normalize the subflag name
    for stage, prerequisites in pairs(STAGE_PREREQUISITES) do
        for _, objective in ipairs(prerequisites) do
            if string.lower(objective) == subflag_name then
                return stage -- Return the stage name if found
            end
        end
    end
    return nil -- Return nil if the subflag name is not found in any stage
end

local function subflag_exists(search_term)
    search_term = string.lower(search_term) -- Normalize the search term
    return DIRECT_LOOKUP[search_term] or false -- Returns true if present, false otherwise
end

local function get_subflag(client, stage, objective)
    objective = string.lower(objective) -- Normalize the objective to lowercase

    -- Deserialize the hash containing flags
    local original_flag = plugin.DeserializeHash(quest.get_data(client.AccountID() .. "-progress-flag-" .. stage))

    -- Create a new hash with all keys normalized to lowercase
    local normalized_flag = {}
    for key, value in pairs(original_flag) do
        normalized_flag[string.lower(key)] = value
    end

    -- Return the value using the normalized objective key
    return normalized_flag[objective]
end

local function set_subflag(client, stage, objective, value)
    value = value or 1 -- Default value is 1 if not otherwise defined
    objective = string.lower(objective) -- Normalize the objective

    -- Check if the stage is valid
    if not VALID_STAGES[stage] then
        return false
    end

    -- Deserialize the current account progress into a hash
    local account_progress = plugin.DeserializeHash(quest.get_data(client.AccountID() .. "-progress-flag-" .. stage))

    -- Check if the objective value has changed
    if not account_progress[objective] or account_progress[objective] ~= value then
        -- Update the flag since the value has changed
        account_progress[objective] = value

        -- Serialize and save the updated account progress
        quest.set_data(client.AccountID() .. "-progress-flag-" .. stage, plugin.SerializeHash(account_progress))

        -- Send messages only if there was a change
        plugin.YellowText("You have gained a progression flag!")
        plugin.BlueText("Your memories become more clear, you see the way forward drawing closer.")

        -- Check if the stage is now complete
        if is_stage_complete(client, stage) then
            plugin.YellowText("You have completed a progression stage!")
            plugin.BlueText("Your memories gain sudden, sharp focus. You see the path forward.")
            UpdateCharMaxLevel(client)
            UpdateRaceClassLocks(client)
        end
    end

    return true
end

local function is_stage_complete(client, stage, inform)
    inform = inform or false -- Set to false if not defined

    -- Return false if the stage is not valid
    if not VALID_STAGES[stage] then
        return false
    end

    -- Check prerequisites
    for _, prerequisite in ipairs(STAGE_PREREQUISITES[stage]) do
        -- Deserialize and then convert keys to lower-case
        local raw_objective_progress = plugin.DeserializeHash(quest.get_data(client.AccountID() .. "-progress-flag-" .. stage))
        local objective_progress = {}
        for key, value in pairs(raw_objective_progress) do
            objective_progress[string.lower(key)] = value
        end

        if not objective_progress[prerequisite] then
            if inform then
                client:Message(263, "You are not yet ready to experience that memory.")
            end
            return false
        end
    end

    -- If all prerequisites are met
    return true
end

local function delete_all_progress(client)
    -- Assuming you have a list of all valid stages stored in an array or directly in VALID_STAGES
    for stage in pairs(VALID_STAGES) do
        -- Construct the key for the data store
        local key = client.AccountID() .. "-progress-flag-" .. stage

        -- Delete the data associated with this key
        quest.delete_data(key)

        -- Optional: Log or inform the operation
        plugin.debug("Deleted progress flag data for stage: " .. stage)
    end

    delete_all_flags(client)

    -- Notify client if necessary
    client:Message(15, "All your progression flags have been reset.") -- Message 15 is typically a yellow text in EQ
end

local function is_eligible_for_race(client, race)
    race = race or client:GetRace()

    -- Iksar
    if race == IKSAR and not is_stage_complete(client, 'RoK') then
        return false
    end

    -- Vah Shir
    if race == VAH_SHIR and not is_stage_complete(client, 'SoL') then
        return false
    end

    -- Drakkin
    if race == DRAKKIN then
        return false
    end

    -- Guktan
    if race == GUKTAN then
        return false
    end

    return true
end

local function is_eligible_for_class(client, class)
    class = class or client:GetClass()

    if class == BEASTLORD and not is_stage_complete(client, 'PoP') then
        return false
    end

    -- Vah Shir
    if class == BERSERKER and not is_stage_complete(client, 'SoL') then
        return false
    end

    return true
end

local function is_eligible_for_zone(client, zone_name, inform)
    inform = inform or false -- Set to false if not defined

    if client:GetGM() then
        return true
    end

    -- Check if the zone exists in the atlas
    if atlas[zone_name] then
        -- Use is_stage_complete to check if the client has completed the required stage
        return is_stage_complete(client, atlas[zone_name], inform)
    else
        -- If the zone is not in the atlas, assume it's accessible or handle as needed
        return true
    end
end

local function is_valid_stage(stage_name)
    return VALID_STAGES[stage_name] or false
end

local function get_target_door_zone(zonesn, doorid, version)
    local return_value = ""

    local dbh = plugin.LoadMysql()
    local sth = dbh:prepare('SELECT * FROM doors WHERE zone = ? AND doorid = ? AND version = ?')

    sth:execute(zonesn, doorid, version)

    local row = sth:fetch(true)
    if row then
        return_value = row.dest_zone
    end

    sth:finish()
    dbh:disconnect()

    return return_value
end

local function UpdateCharMaxLevel(client)
    local update = 0
    local CharMaxLevel = client:GetBucket("CharMaxLevel")

    if not CharMaxLevel then
        CharMaxLevel = 51
        update = 1
    end

    if is_stage_complete(client, 'RoK') and CharMaxLevel < 60 then
        CharMaxLevel = 60
        update = 1
    end

    if is_stage_complete(client, 'PoP') and CharMaxLevel < 65 then
        CharMaxLevel = 65
        update = 1
    end

    if is_stage_complete(client, 'GoD') and CharMaxLevel < 70 then
        CharMaxLevel = 70
        update = 1
    end

    if client:GetBucket("CharMaxLevel") ~= CharMaxLevel then
        client:SetBucket("CharMaxlevel", CharMaxLevel)
        plugin.YellowText("Your Level Cap has been set to " .. CharMaxLevel .. ".")
    end
end


-- Import any needed libraries

function ConvertFlags(client)
    -- Old Flag Data
    expansion = quest.get_data(client:AccountID() .. "-kunark-flag") or 0

    if expansion > 0 then
        -- Kunark
        if not is_stage_complete(client, 'RoK') then
            if expansion > 2 or quest.get_data(client:AccountID() .. "nag") then
                set_subflag(client, 'RoK', 'Lord Nagafen', 1)
            end

            if expansion > 2 or quest.get_data(client:AccountID() .. "vox") then
                set_subflag(client, 'RoK', 'Lady Vox', 1)
            end
        end
        
        -- Velious
        if not is_stage_complete(client, 'SoV') then
            if expansion > 3 or quest.get_data(client:AccountID() .. "trak") then
                set_subflag(client, 'SoV', 'Trakanon', 1)
            end

            if expansion > 3 or quest.get_data(client:AccountID() .. "tal") then
                set_subflag(client, 'SoV', 'Talendor', 1)
            end

            if expansion > 3 or quest.get_data(client:AccountID() .. "goren") then
                set_subflag(client, 'SoV', 'Gorenaire', 1)
            end

            if expansion > 3 or quest.get_data(client:AccountID() .. "sev") then
                set_subflag(client, 'SoV', 'Severilous', 1)
            end
        end

        -- Luclin
        if not is_stage_complete(client, 'SoL') then
            if expansion > 14 or quest.get_data(client:AccountID() .. "sky") then
                set_subflag(client, 'SoL', 'Lord Yelinak', 1)
            end

            if expansion > 14 or quest.get_data(client:AccountID() .. "sleepers") then
                set_subflag(client, 'SoL', 'Tukaarak the Warder', 1)
            end

            if expansion > 14 or quest.get_data(client:AccountID() .. "sle") then
                set_subflag(client, 'SoL', 'Nanzata the Warder', 1)
            end

            if expansion > 14 or quest.get_data(client:AccountID() .. "slee") then
                set_subflag(client, 'SoL', 'Ventani the Warder', 1)
            end

            if expansion > 14 or quest.get_data(client:AccountID() .. "sleep") then
                set_subflag(client, 'SoL', 'Hraashna the Warder', 1)
            end

            if expansion > 14 or quest.get_data(client:AccountID() .. "wuo") then
                set_subflag(client, 'SoL', 'Wuoshi', 1)
            end

            if expansion > 14 or quest.get_data(client:AccountID() .. "kla") then
                set_subflag(client, 'SoL', 'Klandicar', 1)
            end

            if expansion > 14 or quest.get_data(client:AccountID() .. "zla") then
                set_subflag(client, 'SoL', 'Zlandicar', 1)
            end
        end

        -- Planes of Power
        if not is_stage_complete(client, 'PoP') then
            if expansion > 19 or quest.get_data(client:AccountID() .. "deep") then
                set_subflag(client, 'PoP', 'Thought Horror Overfiend', 1)
            end

            if expansion > 19 or quest.get_data(client:AccountID() .. "akh") then
                set_subflag(client, 'PoP', 'The Insanity Crawler', 1)
            end

            if expansion > 19 or quest.get_data(client:AccountID() .. "griegs") then
                set_subflag(client, 'PoP', 'Greig Veneficus', 1)
            end

            if expansion > 19 or quest.get_data(client:AccountID() .. "ssraone") then
                set_subflag(client, 'PoP', 'Xerkizh the Creator', 1)
            end

            if expansion > 19 or quest.get_data(client:AccountID() .. "ssratwo") then
                set_subflag(client, 'PoP', 'Emperor Ssraeshza', 1)
            end
        end

        -- Gates of Discord
        if not is_stage_complete(client, 'GoD') then
            if expansion >= 20 or quest.get_data(client:AccountID() .. "-saryrn-flag") or quest.get_data(client:AccountID() .. "-quarm-kill") then
                set_subflag(client, 'GoD', 'Saryrn', 1)
            end
        end

        -- Fabled Nagafen
        if not is_stage_complete(client, 'FNagafen') and expansion > 20 then
            set_subflag(client, 'FNagafen', 'Quarm', 1)
        end

        UpdateRaceClassLocks(client)
    end    
end

function delete_all_flags(client)
    -- List all stages and their specific subflags used in ConvertFlags
    local flags_to_delete = {
        ["kunark-flag"] = true,
        ["nag"] = true,
        ["vox"] = true,
        ["trak"] = true,
        ["tal"] = true,
        ["goren"] = true,
        ["sev"] = true,
        ["sky"] = true,
        ["sleepers"] = true,
        ["sle"] = true,
        ["slee"] = true,
        ["sleep"] = true,
        ["wuo"] = true,
        ["kla"] = true,
        ["zla"] = true,
        ["deep"] = true,
        ["akh"] = true,
        ["griegs"] = true,
        ["ssraone"] = true,
        ["ssratwo"] = true,
        ["saryrn-flag"] = true,
        ["quarm-kill"] = true
    }

    -- Go through each flag and delete it
    for flag_suffix, _ in pairs(flags_to_delete) do
        local key = client:AccountID() .. flag_suffix
        quest.delete_data(key)  -- Assuming quest.delete_data is the correct method to remove data
    end
end

function UpdateRaceClassLocks(client)
    local account_progression = quest.get_data(client:AccountID() .. "-account-progression") or 0

    if account_progression < 1 and is_stage_complete(client, 'RoK') then
        quest.set_data(client:AccountID() .. "-account-progression", 1)
    end

    if account_progression < 2 and is_stage_complete(client, 'SoV') then
        quest.set_data(client:AccountID() .. "-account-progression", 2)
    end

    if account_progression < 3 and is_stage_complete(client, 'SoL') then
        quest.set_data(client:AccountID() .. "-account-progression", 3)
    end

    if account_progression < 4 and is_stage_complete(client, 'PoP') then
        quest.set_data(client:AccountID() .. "-account-progression", 4)
    end

    if account_progression < 5 and is_stage_complete(client, 'GoD') then
        quest.set_data(client:AccountID() .. "-account-progression", 5)
    end

    if account_progression < 6 and is_stage_complete(client, 'OoW') then
        quest.set_data(client:AccountID() .. "-account-progression", 6)
    end

    if account_progression < 7 and is_stage_complete(client, 'DoN') then
        quest.set_data(client:AccountID() .. "-account-progression", 7)
    end
end

function handle_death(npc, x, y, z, entity_list)
    local npc_name = string.lower(npc:GetCleanName())
    npc_name = string.gsub(npc_name, "^[#%s]+|[#%s]+$", "")

    if plugin.subflag_exists(npc_name) then        
        local flag_mob = quest.spawn2(26000, 0, 0, x, y, z + 10, 0) -- Spawn a flag mob
        local new_npc = entity_list:GetNPCByID(flag_mob)       
        
        new_npc:SetEntityVariable("Flag-Name", npc_name)
        new_npc:SetEntityVariable("Stage-Name", plugin.get_subflag_stage(npc_name))
    end    
end

function handle_killed_merit(npc, client)
    local npc_name = string.lower(npc:GetCleanName())
    npc_name = string.gsub(npc_name, "^[#%s]+|[#%s]+$", "")

    if plugin.subflag_exists(npc_name) then
        plugin.set_subflag(client, plugin.get_subflag_stage(npc_name), npc_name)
    end
end

function move_startzone(client)
    local s_zone = client:GetStartZone()
    if s_zone == 9 then
        quest.movepc(9, -60.9, -61.5, -24.9) -- Zone: freportw
    elseif s_zone == 19 then
        quest.movepc(19, -98.4, 11.5, 3.1) -- Zone: rivervale
    elseif s_zone == 24 then
        quest.movepc(24, -309.8, 109.6, 23.1) -- Zone: erudnext
    elseif s_zone == 25 then
        quest.movepc(25, -965.3, 2434.5, 5.6) -- Zone: nektulos
    elseif s_zone == 29 then
        quest.movepc(29, 12.2, -32.9, 3.1) -- Zone: halas
    elseif s_zone == 40 then
        quest.movepc(40, 156.9, -2.9, 31.1) -- Zone: neriaka
    elseif s_zone == 41 then
        quest.movepc(41, -499, 2.9, -10.9) -- Zone: neriakb
    elseif s_zone == 42 then
        quest.movepc(42, -968.9, 891.9, -52.8) -- Zone: neriakc
    elseif s_zone == 45 then
        quest.movepc(45, -343, 189, -38.22) -- Zone: qcat
    elseif s_zone == 49 then
        quest.movepc(49, 520.1, 235.4, 59.1) -- Zone: oggok
    elseif s_zone == 50 then
        quest.movepc(50, 560, -2234, 3) -- Zone: rathemtn
    elseif s_zone == 52 then
        quest.movepc(52, 1.1, 14.5, 3.1) -- Zone: grobb
    elseif s_zone == 54 then
        quest.movepc(54, -197, 27, -0.7) -- Zone: gfaydark
    elseif s_zone == 55 then
        quest.movepc(55, 7.6, 489.0, -24.9) -- Zone: akanon
    elseif s_zone == 61 then
        quest.movepc(61, 26.3, 14.9, 3.1) -- Zone: felwithea
    elseif s_zone == 68 then
        quest.movepc(68, -214.5, 2940.1, 0.1) -- Zone: butcher
    elseif s_zone == 75 then
        quest.movepc(75, 200, 800, 3.39) -- Zone: paineel
    elseif s_zone == 106 then
        quest.movepc(106, -415.7, 1276.6, 3.1) -- Zone: cabeast
    elseif s_zone == 155 then
        quest.movepc(155, 105.6, -850.8, -190.4) -- Zone: sharvahl
    else
        quest.movepc(202, -55, 44, -158.81) -- Zone: poknowledge
    end  
end




