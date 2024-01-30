-- Breakdown in Communication #3: Riwwi

function event_say(e)
	if(e.message:findi("hail")) then
		e.other:Message(MT.NPCQuestSay, "Councilman Tentric says 'You haven't come to demand something of me, have you? I've been subjected to enough atrocities already. Please leave this old man in peace.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local has_faction = (e.other:GetFaction(e.self) < 3) -- Warmly +
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

		-- Field #5 - Riwwi Status (INT)
		---- SubField - 1 = Started Riwwi with Taminoa
		---- SubField - 2 = Turned in Reyna's Earring to Taminoa
		---- SubField - 3 = Speak with Namosa (Need Kindly with Yunjo Slave Resistance going forward) and gives you Scuffed Signet Ring
		---- SubField - 4 = Give Ring to Pandula and gives you Final Words
		---- SubField - 5 - Give Final Words to Namosa and gives you Token of Understanding
		---- SubField - 6 - Give him Token and gives you Symbol of Faith
		---- SubField - 7 - Give Symbol to Pandula and gives you Drakelily
		---- SubField - 8 - Give Drakelily to Namosa and gives you Crescent Stone Amulet (Has no use)
		---- SubField - 9 - Spoke to Turlini and Gives Turlini's Key Bag
		---- SubField - 10 - Give Turlini the Sack of Silvery Keys
		---- SubField - 11 - Started Arena Wave 1
		---- SubField - 12 - Started Arena Wave 2
		---- SubField - 13 - Started Arena Wave 3
		---- SubField - 14 - Started Arena Wave 4
		---- SubField - 15 - Started Arena Wave 5
		---- SubField - 16 - Started Arena Wave 6
		---- SubField - 17 - Started Arena Wave 7
		---- SubField - 18 - Started Arena Wave 8
		---- SubField - 19 - Started Arena Wave 9
		---- SubField - 20 - Started Arena Wave 10
		---- SubField - 21 - Completed Arena Waves and Turned in final Sack to Turlini - Gaves Sash of The Yunjo Champion and Reynas Scout Report
		---- SubField - 22 - Gave report to Taminoa
		---- SubField - 23 - Combined Glowing Gem Shard (Completed and Cannot Reset)

		if riwwi_progress == 5 then
			if (item_lib.check_turn_in(e.trade, {item1 = 52176})) then -- Item: Token of Understanding
				e.other:Message(MT.NPCQuestSay, "Councilman Tentric nods solemnly, 'Hmm . . . I see. So Pandula is contemplating leaving this world. There is no doubt that these are hard times. Our people are strong however, and nothing will truly break our spirit. Please let Pandula know that the gods have not forgotten us. Bring her this holy symbol.'");
				e.other:QuestReward(e.self,0,0,0,0,52177,eq.ExpHelper(55)); -- Item: Symbol of Faith
				e.other:Faction(363,10); -- Yunjo Slave Resistance +10
				e.other:Faction(416,-10); -- Gladiators of Mata Muram -10
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,6,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
