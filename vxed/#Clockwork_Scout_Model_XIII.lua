function event_say(e)
	local data_bucket = ("BIC-"..e.other:CharacterID());
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

		if tipt_progress == 3 then
			if(e.message:findi("Hail")) then
				e.self:Say("Access code?");
			elseif(e.message:findi("040703")) then
				e.self:Say("Identity verified as ".. e.other:GetName() .. ". Processing scout report. Please return report to Vaifan.");
				e.other:SummonItem(67536); -- Item: Outer Regions Scouting Report
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,4,yxtta_progress,kodtaz_progress);
				eq.set_timer("depop", 60 * 1000); -- 1 Minute
			end
		end
	else
		e.self:Emote("does not seem to respond to your command.");
	end
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end

function event_timer(e)
	if (e.timer == "depop") then
		e.self:Say("Power cells low. Shutting down to reserve power.");
		eq.depop();
	end
	eq.stop_timer(e.timer)
end

