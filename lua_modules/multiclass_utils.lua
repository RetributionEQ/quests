function Client:ClassMap()
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
    };
end

function Client:HasClass(class)
    local class_bits = self:GetClassesBitmask();
    local class_map = self:ClassMap();

    for bit, class_name in pairs(class_map) do
        if bit.band(class_bits, 2^(bit-1)) ~= 0 and class == class_name then
            return 1;
        end
    end

    return 0;
end