function event_click_door(e)
	local door_id = e.door:GetDoorID()
	if door_id == 3 then -- Gate to Kyv Heartstriker area
		-- only someone with the Harshly Spiked Key in current inventory can open
		-- this gate, even if it's already been opened by someone else
		if e.self:GetInventory():HasItem(54083, 1, 2) ~= -1 then -- Harshly Spiked Key
			e.self:Message(MT.Red, "There is a grinding of stone as the way opens before you.")
		else
			e.self:Message(MT.Red, "Despite your efforts, the barricade is solid.")
		end
	elseif door_id == 4 then -- Riddler door
		if e.door:GetLockPick() == 0 then
			e.self:Message(MT.Red, "There is a grinding of stone as the way opens before you.")
		else
			e.self:Message(MT.Red, "Despite your efforts, the barricade is solid.")
		end
	elseif door_id == 5 then -- obelisk zone out behind Master Stonespiritist Okkanu
		-- if a player hasn't hailed Master Spiritist to get either temp or
		-- permanent Tipt flag then the port out stone doesn't work for them
		local qglobals = eq.get_qglobals(e.self) -- god_kodtaz_access currently represents permanent flag
		local has_perm_flag = (qglobals.god_kodtaz_access and qglobals.god_kodtaz_access == "1")
		local has_temp_flag = (eq.get_data(string.format("%s-god_tipt", e.self:CharacterID())) == "T")

		if not has_temp_flag and not has_perm_flag then
			e.self:Message(MT.Yellow, "Master Stonespiritist Okkanu glares at you as you touch the strangely runed obelisk.")
			return 1 -- prevent zone out
		end
	end
end

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
		
		if e.recipe_id == 10344 then -- Clockwork Scout Module
			e.self:Message(MT.DimGray, "With the final piece in place, the clockwork scout's eyes light up as it comes to life.");
			eq.spawn2(290059, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()) -- Clockwork Scout Model XIII
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,3,yxtta_progress,kodtaz_progress);
		end
	end
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.self:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
