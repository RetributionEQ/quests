--Help Kayin Escape/  Breakdown in Communication #2: Barindu/  Help Vasha

function event_say(e)
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
			if(e.message:findi("hail")) then
				e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'My brother is an adventurer like you.  He left to explore the new continent a couple of days ago.  I hope he is okay.'");
			end

			if barindu_progress == 2 then
				if(e.message:findi("Talwin")) then
					e.other:Message(MT.Yellow, "'Yes ... Talwin. He and I were becoming fast friends until Ixvet took him. I am not sure what has happend to him, but if you would be [interested] in helping me I may be able to assist you in return.'");
				elseif(e.message:findi("interested")) then
					e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'Good, good. As you may have noticed, the majority of these creatures are brutish types best suited for destruction. They are kept under control solely by strong [leadership].'");
				elseif(e.message:findi("leadership")) then
					e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'The one who controls this area of the city goes by the name Ixvet Pox. She's as cruel as the rest, but considerably more intelligent which makes her even more dangerous. Fortunately, she's grown complacent and that gives us an [opportunity]. If we can destroy Ixvet, it will throw this area into chaos and we should be able to escape before order is restored.'");
				elseif(e.message:findi("opportunity")) then
					e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'I've managed to get someone loyal to our cause placed within Ixvet Pox's entourage of personal servants and a skilled herbalist tends to her favorite fruits in the gardens. We will use this connection to poison the tyrant. Go talk with Kunimi Falade. You can find her working on the Hanging Gardens. Give her this ring as proof that you are there with my blessing and she will tell you what she needs.'");
					e.other:QuestReward(e.self,0,0,0,0,64001,1); -- Item: Simple Stone Band
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,3,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			else
				e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'My brother is an adventurer like you.  He left to explore the new continent a couple of days ago.  I hope he is okay.'");
			end
		else
			e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'My brother is an adventurer like you.  He left to explore the new continent a couple of days ago.  I hope he is okay.'");
		end
	else
		e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'My brother is an adventurer like you.  He left to explore the new continent a couple of days ago.  I hope he is okay.'");
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

			if barindu_progress == 5 then
				if (item_lib.check_turn_in(e.trade, {item1 = 64006})) then -- Item: Poisoned Fruit (1st Version)
					e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'I knew Kunimi would come through! Our day of escape is almost here. Take this to Abena Taifa. She is the servant who brings Ixvet his meals and is loyal to our cause.'");
					e.other:QuestReward(e.self,0,0,0,0,64007,10000); -- Item: Poisoned Fruit (2nd Version)
					e.other:Faction(231,10); -- Nihil +10
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,6,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			end
		end
		if (item_lib.check_turn_in(e.trade, {item1 = 64012})) then -- Item: engraved stone bracelet
			e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'Vasha told me what you did for her and I extend you my thanks as well. The bracelet she gave you is special beyond its emotional value. I sensed some magic locked away within the stone ages ago.");
			e.other:Message(MT.NPCQuestSay, "Proteri Amari holds the bracelet between his hands and whispers to the stone. Glancing up, he says, 'It's all about knowing how to convince the stone that it wants to awaken.' When he opens his hands, the bracelet seems to glow from within.");
			e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'There you go. Again, thank you for your aid and take care with that bracelet. When the stone is freshly awakened, it tends to be a bit fragile.");
			e.other:QuestReward(e.self,0,0,0,0,64013,100000); --Item: Vasha's Bracelet of Mourning
			e.other:Faction(231,10); -- Nihil +10
		elseif (item_lib.check_turn_in(e.trade, {item1 = 64016})) then -- Item: crude stone ring
			e.other:Message(MT.NPCQuestSay, "Proteri Amari says 'I heard what you did for Kayin and Njanu. When you help my brothers and sisters, you help me as well. You have my thanks. Njanu was correct about this ring. It holds magic deep within the rock.' Proteri Amari holds the ring between his hands and whispers to the stone. Glancing up, he says, 'It's all about knowing how to convince the stone that it wants to awaken.' When he opens his hands, the ring seems to glow from within. Proteri Amari says 'There you go. Again, thank you for your aid and take care with that ring. When the stone is freshly awakened, it tends to be a bit fragile.");
			e.other:QuestReward(e.self,0,0,0,0,64017,200000); --Item: Njanu's Ring of Gratitude
			e.other:Faction(231,10); -- Nihil +10
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
