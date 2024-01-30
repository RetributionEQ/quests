-- Smith Rondo Event
function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000); -- 10 Minutes (Not sure)
end

function event_say(e)
	local present_for_handin	= (eq.get_data("Gates-Rondo-"..e.other:CharacterID()) == "1");
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

		-- Field #6 - Ferubi Status (INT)
		---- SubField - 1 - Started Ferubi with Taminoa and Gives you Tuned Farstone
		---- SubField - 2 - Give Tuned Farstone to Rondo and gives you Sealed Report
		---- SubField - 3 - Give Report to Taminoa
		---- SubField - 4 - Complete Weapon Master Raid, Hail Smith's Spectral Memory and gives you Rondo's Report
		---- SubField - 5 - Deliver Report to Taminoa
		---- SubField - 6 - Combine Green Colored Gem Shard (Completed and Cannot Reset)

		if(e.message:findi("Hail")) then
			local qglobals = eq.get_qglobals(e.other);
			local char_id = e.other:CharacterID();

			if(present_for_handin) then
				if(ferubi_progress == 3 and not e.other:HasItem(67526)) then	-- BIC Progress Flag and not already has Item: Rondo's Report
					e.other:Message(MT.LightBlue, "You feel a chill surround your body as a voice enters your mind. 'Thank you for releasing me from an eternity of suffering. Now you must help the others on this continent whose fate I fear is much worse than mine. You must seek out Apprentice Udranda in Barindu. She can help you gain access to the temples beyond the mountain passes.'");
					e.other:SummonItem(67526); -- Item: Rondo's Report
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,4,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
				eq.set_global("god_vxed_access", "1", 5, "F");
				e.other:Message(MT.LightBlue, "You receive a character flag!");
			end
		end
	else
		local qglobals = eq.get_qglobals(e.other);
		local char_id = e.other:CharacterID();

		if(present_for_handin) then -- No BIC Progress / No Data Bucket
			eq.set_global("god_vxed_access", "1", 5, "F");
			e.other:Message(MT.LightBlue, "You receive a character flag!");
		end
	end
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.depop();
	end
	eq.stop_timer(e.timer)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
