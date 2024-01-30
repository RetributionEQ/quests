-- BiC / Warrior Epic 1.5
function event_combine_success(e)
	local data_bucket = ("BIC-"..e.self:CharacterID());
	if eq.get_data(data_bucket) ~= "" then -- Has Started
		local temp = eq.get_data(data_bucket);
		s = eq.split(temp, ',');

		local bic_status 		= tonumber(s[1]); -- Current Overall Status
		local fezbin_progress 	= tonumber(s[2]); -- Progress Level for Fezbin			
		local qinimi_progress 	= tonumber(s[3]); -- Progress Level for Qinimi
		local barindu_progress	= tonumber(s[4]); -- Progress Level for Barindu
		local riwwi_progress	= tonumber(s[5]); -- Progress Level for Riwwi
		local ferubi_progress 	= tonumber(s[6]); -- Progress Level for Ferubi
		local sewers_progress 	= tonumber(s[7]); -- Progress Level for Sewers
		local vxed_progress 	= tonumber(s[8]); -- Progress Level for Vxed
		local tipt_progress		= tonumber(s[9]); -- Progress Level for Tipt
		local yxtta_progress 	= tonumber(s[10]); -- Progress Level for Yxtta
		local kodtaz_progress 	= tonumber(s[11]); -- Progress Level for Kod'Taz

		-- Field #9 - Tipt Status (INT)
		---- SubField - 1 - Started Tipt with Vaifan Cogswin and gives you Power Pack
		---- SubField - 2 - Give Full Power Pack to Vaifan and gives you 4 items
		---- SubField - 3 - Combined items at this step and spawned Scout Model XIII
		---- SubField - 4 - Spoke with Scout and gives you Scouting Report
		---- SubField - 5 - Give Report to Vaifan
		---- SubField - 6 - Combine Dirt Covered Gem Shard (Completed and Cannot Reset)
		
		if (e.recipe_id == 10344) then
			e.self:Message(MT.DimGray,"With the final piece in place, the clockwork scout's eyes light up as it comes to life.");
			eq.spawn2(290059,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Clockwork Scout Model XIII
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,3,yxtta_progress,kodtaz_progress);
		end
	end
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.self:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end

function event_enter_zone(e)
	if(e.self:GetClass() == Class.WARRIOR ) then
		local data_bucket = ("Epic-Warrior-"..e.self:CharacterID());

		if eq.get_data(data_bucket) ~= "" then -- Has Started
			local temp = eq.get_data(data_bucket);
			s = eq.split(temp, ',');
	
			local epic_pre_onefive	= tonumber(s[1]);
			local epic_onefive		= tonumber(s[2]);		
			local epic_two			= tonumber(s[3]);
			local epic_twofive		= tonumber(s[4]);

			if epic_onefive == 9 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(290070) then
				eq.spawn2(290070 ,0,0,-720,-3200,15.1,256);		-- NPC: Blackfall Boreling
				eq.spawn2(290070 ,0,0,272.5,-2099,237,114);		-- NPC: Blackfall_Borerling
				eq.spawn2(290070 ,0,0,-1600,-1700,326.1,304);	-- NPC: Blackfall_Borerling
				eq.zone_emote(MT.Yellow, "You notice a rumbling echo through the mountains. The Blackfall Borer is waiting for you...")
			end
		end
	end
end

function event_loot(e)
	if e.self:GetClass() == Class.PALADIN and e.item:GetID() == 69944 then -- Item: Soulstone Shard
		local data_bucket = ("Epic-Paladin-"..e.self:CharacterID());

		if eq.get_data(data_bucket) ~= "" then -- Has Started
			local temp = eq.get_data(data_bucket);
			s = eq.split(temp, ',');
	
			local epic_pre_onefive	= tonumber(s[1]);
			local epic_onefive		= tonumber(s[2]);		
			local epic_two			= tonumber(s[3]);
			local epic_twofive		= tonumber(s[4]);

			if epic_onefive == 20 then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				update_paladin_epic_databucket(e,epic_pre_onefive,21,epic_two,epic_twofive);
				return 0;
			else
				return 1;
			end
		end
	end
end

function update_paladin_epic_databucket(e,pre_one_five,one_five,two,two_five)
	eq.set_data("Epic-Paladin-"..e.self:CharacterID(), pre_one_five..","..one_five..","..two..","..two_five);
	e.self:Message(MT.Yellow, "Your quest has been advanced"); -- Made up to let people know the flags have been updated.
end

function event_click_door(e)
	if e.door:GetDoorID() == 7 then -- obelisk zone out behind Stonespiritist Ekikoa
		-- if player hasn't hailed Stonespiritist Ekikoa to get either temp or
		-- permanent Vxed flag then the port out stone doesn't work for them.
		-- Unknown what happens if at flagged cap (if live even has one anymore)
		local qglobals = eq.get_qglobals(e.self) -- god_kodtaz_access currently represents permanent flag
		local has_perm_flag = (qglobals.god_tipt_access and qglobals.god_tipt_access == "1")
		local has_temp_flag = (eq.get_data(string.format("%s-god_vxed", e.self:CharacterID())) == "T")

		if not has_temp_flag and not has_perm_flag then
			e.self:Message(MT.Yellow, "You become dizzy as you inspect the stone slab.")
			return 1 -- prevent zone out
		end
	end
end
