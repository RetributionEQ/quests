-- Breakdown In Communication #2 Barindu

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores your attempts to talk to her.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local has_faction = (e.other:GetFaction(e.self) < 3) -- Warmly +
	local data_bucket = ("BIC-"..e.other:CharacterID());

	if has_faction then
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
			if barindu_progress == 7 then
				if (item_lib.check_turn_in(e.trade, {item1 = 64007})) then -- Item: Poisoned Fruit (2nd Version)
					e.other:Message(MT.NPCQuestSay, "Chiaka Lerato says 'I know of your plot and I have no interest in being a part of it. It's too dangerous and more likely to get us all killed than set us free. I don't want anyone else getting hurt, so I won't tell the guards, but I will have no part in your plans.'");
					e.other:SummonItem(64010); -- Item: Poisoned Fruit (3rd Version)
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,8,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			elseif barindu_progress == 9 then
				if (item_lib.check_turn_in(e.trade, {item1 = 64008})) then -- Item: Tattered Shawl
					e.other:Message(MT.NPCQuestSay, "Chiaka Lerato says 'How did you. . . Never mind. I'd know this shawl anywhere and it can only mean one thing. Mother needs me. I haven't heard from my brother or mother since they escaped and I thought they might be dead. I should have left with them when I had the chance. Fortunately, Hamisi told me of his plans. I should be able to use the same route he did to escape. Here, take this. I won't need it any more.");
					e.other:QuestReward(e.self,0,0,0,0,64009,eq.ExpHelper(52)); -- Item: Serving Tray
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,10,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
					eq.start(56);
				end
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
