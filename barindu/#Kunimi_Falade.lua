-- Breakdown In Communication #2 Barindu

function event_say(e)
	local has_faction = (e.other:GetFaction(e.self) < 3) -- Warmly +
	local data_bucket = ("BIC-"..e.other:CharacterID());

	if(e.message:findi("Hail")) then
		e.other:Message(MT.NPCQuestSay, "Kunimi Falade glances around to make sure no one is within earshot then whispers, 'Who are you and what do you want?'");
	end

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

			if barindu_progress == 3 then
				if(e.message:findi("Proteri")) then
					e.other:Message(MT.NPCQuestSay, "Kunimi Falade looks nervous at the mention of that name and says, 'I'm sorry. I don't know anyone by that name.'");
				end
			elseif barindu_progress == 4 then
				if(e.message:findi("ingredients")) then
					e.other:Message(MT.Yellow, "'Kunimi Falade says 'Creating poisons is distasteful business and I'm afraid the items that go into it are just as distasteful. I need the black bile of a hynid and the yellow bile of a tide feaster from the shores of Natimbi and both a vial of corrosive slime and a mass of insect larva from the sewers beneath us. Once I have these items, I should be able to create an effective poison. Now, you should leave before we're seen.'");
				elseif(e.message:findi("Talwin")) then
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
				e.other:Message(MT.NPCQuestSay, "Kunimi Falade glances around to make sure no one is within earshot then whispers, 'Who are you and what do you want?'");
			end
		else
			e.other:Message(MT.NPCQuestSay, "Kunimi Falade glances around to make sure no one is within earshot then whispers, 'Who are you and what do you want?'");
		end
	else
		e.other:Message(MT.NPCQuestSay, "Kunimi Falade glances around to make sure no one is within earshot then whispers, 'Who are you and what do you want?'");
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

		if has_faction then
			if barindu_progress == 3 then
				if(item_lib.check_turn_in( e.trade, {item1 = 64001})) then -- Item: Simple Stone Band
					e.other:Message(MT.NPCQuestSay, "Kunimi Falade takes the ring and studies it for a moment. 'So the time has finally come. Unfortunately, I have had little success. Our traditional poisons have absolutely no effect on these invaders. They don't even seem to notice the poison. But, there is some hope. I believe I can distill a poison that will affect them if I had the right [ingredients].'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,4,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			elseif barindu_progress == 4 then
				if(item_lib.check_turn_in( e.trade, {item1 = 64002,item2 = 64003,item3 = 64004,item4 = 64005})) then -- Item: Black Hynid Bile, Yellow Tide Feaster Bile, Writhing Mass of Insect Larva, Vial of Corrosive Slime
					e.other:Message(MT.NPCQuestSay, "Kunimi Falade takes the ingredients and gets to work. Within a few minutes, she produces a viscous green liquid. Plucking a bunch of fruit from the nearby plant, she coats the fruit in the poison.");
					e.other:Message(MT.NPCQuestSay, "Kunimi Falade says 'That should do it. I can't be positive that this will do more than give Ixvet an upset stomach, but we can hope. Please take this to Proteri Amari.'");
					e.other:QuestReward(e.self,0,0,0,0,64006,1); -- Item: Poisoned Fruit
					e.other:Faction(231,10); -- Nihil +10
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,5,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
