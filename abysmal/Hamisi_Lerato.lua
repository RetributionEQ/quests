-- Breakdown In Communication #2 Barindu

function event_say(e)
	local data_bucket = ("BIC-"..e.other:CharacterID());
	if(e.message:findi("Hail")) then
		e.other:Message(MT.NPCQuestSay, "Hamisi Lerato looks despondent. 'I recently managed to escape from the city with my mother, but my sister is still stuck in there. She was too frightened to escape with us and now I fear she may be dead.'");	
	end

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

		-- Field #4 - Barindu Status (INT)
		---- SubField - 1 = Started Baruindu with Taminoa
		---- SubField - 2 = Turned Journal pages into Opury Foop
		---- SubField - 3 = Spoke with Proteri (Need Warmly Faction w/ Nihil)
		---- SubField - 4 = Gave Stone Band to Kunimi Falade
		---- SubField - 5 = gave 4 items to Kunimi and returns Poisoned fruit [Can be skipped for a harder raid]
		---- SubField - 6 = Gave Poisoned Fruit to Proteri and gives back (Different ID'd fruit) [Can be skipped for a harder raid]
		---- SubField - 7 = Gave Poisoned Fruit to Abena and gives back (Same ID'd fruit) [Can be skipped for a harder raid]
		---- SubField - 8 = Gave Poisoned Fruit to Chiaka and gives back (Different ID'd fruit) [Can be skipped for a harder raid]
		---- SubField - 9 = Followed Dialog for Hamisi in Abysmal [Can be skipped for a harder raid]
		---- SubField - 10 = Gave Tattered Shawl to Chiaka and gives serving tray [Can be skipped for a harder raid]
		---- SubField - 11 = Gave Tray and 3rd Fruit to Abena Taifa and gives back Abena's Collar of Liberation [Can be skipped for a harder raid]
		---- SubField - 12 = Deliver Talwin's Final Report to Taminoa
		---- SubField - 13 = Combined Shiny Gem Shard (Completed and Cannot Reset)
		if barindu_progress == 8 then
			if(e.message:findi("Chiaka")) then
				e.other:Message(MT.NPCQuestSay, "A look of astonishment flashes across Hamisi's face. 'You've seen my sister? Is she ok? Where is she? Wait, there will be time to talk later. For now, you must return to her immediately. Our mother has been worrying herself to death and has grown very sick. I fear she won't last much longer. Please, take this shawl to my sister. It's our mother's. My sister will recognize it and know what it means. May the ocean speed your journey!'");	
				e.other:SummonItem(64008); -- Item: Tattered Shawl
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,9,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	eq.Emote("looks indecisive for a moment, then says, 'I'll try the malt beer, thanks.'");
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
