-- Breakdown In Communication #2 Barindu

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

			if barindu_progress == 6 then
				if (item_lib.check_turn_in(e.trade, {item1 = 64007})) then -- Item: Poisoned Fruit (2nd Version)
					e.other:Message(MT.NPCQuestSay, "Abena Taifa says 'Proteri sent word that you would be coming. I have bad news. It seems Ixvet has gotten wind of a plot on his life and has grown paranoid. He has started changing his personal servants on a regular basis and I was replaced by Chiaka Lerato yesterday. I'm afraid that I'm not going to be able to help you anymore. Please, keep the fruit for now.");
					e.other:SummonItem(64007); -- Item: Poisoned Fruit (2nd Version)
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,7,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			elseif barindu_progress == 10 then
				if (item_lib.check_turn_in(e.trade, {item1 = 64009,item2 = 64010})) then -- Item: Serving Tray, Poisoned Fruit (3rd Version)
					e.other:Message(MT.NPCQuestSay, "Abena Taifa says 'Just in time! Ixvet is due for his next meal in a few minutes. With Chiaka out of the way, I'll be able to serve him. I hope this poison isn't noticeable. Here, I've managed to secret this away from the guards up until now and I hate to think about those beasts getting their hands on it. Please hold onto it for me. If this goes well, I won't need it anymore.");
					e.other:QuestReward(e.self,0,0,0,0,64018,50000); --Item: Abena's Collar of Liberation
					e.other:Faction(231,50); -- Nihil +50
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,11,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
					eq.start(57);
				end
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if (e.wp == 9) then
		e.self:Say("Ikaav Ixvet Pox, I humbly present you with your meal.");
		eq.signal(283050,1,6000); --signal iip
	end
end

function event_signal(e)
	if(e.signal == 1) then
	e.self:SetAppearance(3);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("pointedly ignores you and continues what she was doing.");
	end
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
