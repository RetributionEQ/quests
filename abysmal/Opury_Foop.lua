function event_say(e)
	if(e.message:findi("Hail")) then
		e.other:Message(MT.NPCQuestSay, "Opury Foop says 'My brother is an adventurer like you.  He left to explore the new continent a couple of days ago.  I hope he is okay.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
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

		if barindu_progress == 1 then
			if(item_lib.check_turn_in( e.trade, {item1 = 67514,item2 = 67515})) then -- Item: Talwin's Journal Page 1, Talwin's Journal Page 2
				e.other:Message(MT.NPCQuestSay, "Opury Foop says 'What's this . . . Oh, you must be one of the adventurers helping us with our scout issue. Taminoa will be excited to see this. Talwin and Tam were really close before Talwin joined the brotherhood, but it is really not my place to give you any more details. I will leave that to him. Now, let me see. According to what Talwin has written here, the head slaver is a being known as Ixvet Pox who spends much of his time in the Stone Worker Yard. Apparently he forces the slaves to use their control over the stone workers to protect him. Sounds like that may be the best place to start looking for more Talwin clues. Wait a second. There are some more notes here on the second page. Seems Talwin was able to build a rapport with the head slave in the area. His name is Proterri and it says here that he was planning to poison the head slaver and try to start a slave revolt. While it seems you could easily go find the head slaver, I would suggest talking to Proterri first and asking him about Talwin. Either way, whatever information you find out regarding Talwin, please return it to Taminoa. I should have finished helping him get things in order by the time you return.'");
				e.other:QuestReward(e.self,0,0,0,0,0,eq.ExpHelper(52)); -- Exp
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,2,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
