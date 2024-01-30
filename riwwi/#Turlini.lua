-- Breakdown in Communication #3: Riwwi

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

			if riwwi_progress == 8 then
				if(e.message:findi("hail")) then
					e.other:Message(MT.NPCQuestSay, "Turlini beams with excitement, 'I recognize you! One of the adventurers we've heard tales about! There are rumors of you destroying the Legion of Mata Muram. Have you come to set us [free]?'");
				elseif(e.message:findi("free")) then
					e.other:Message(MT.NPCQuestSay, "Turlini says 'Bless you, we're saved! Listen up, friend. I've already formulated a plan to stage a quick and decisive escape, but first we need to get our hands on a complete set of shackle keys. Just a few won't suffice; it must be entire set. If we were to rescue only some of my brethren, those that remain behind would be brutally tortured beyond imagination. Now, I've watched the guards carefully and counted the silvery keys they carry. There are ten in total. Combine the set in this sack and return it to me. I knew you would help!'");
					e.other:QuestReward(e.self,0,0,0,0,52150,1); -- Item: Turlini's Key Bag
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,9,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			end
		end
	else
		e.other:Message(MT.NPCQuestSay, "Namosa Bubundu pierces you with an untrusting glare.");
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

			if riwwi_progress == 9 then
				if (item_lib.check_turn_in(e.trade, {item1 = 52161})) then -- Item: Sack of Silvery Keys
					e.other:Message(MT.NPCQuestSay, "Turlini fishes a jagged key from the sack and tries it on his manacles. They unlock with a loud snap and slide off his wrists. His expression melts into simultaneous shock and elation. 'YES! We will be freed. Very soon now, these chains will bind my people no longer! And as for you, ".. e.other:GetName() .. ", you will become a legend among my people.'");
					e.other:Message(MT.NPCQuestSay, "Turlini can barely contain his excitement. 'This is wonderful news, friend. Freedom is within our grasp! The only problem remaining is the ever-present guards. They are always watching over us. We would need a monumental distraction to buy enough time for me to release everyone. Which is where you come in. One of your kind who goes by the name of Reyna has been taken to the arena and has been tortured daily in front of the Muramite masses. If you were to create enough of a ruckus in the arena trying to free her I think we could make our escape.'");
					e.other:QuestReward(e.self,0,0,0,0,0,eq.ExpHelper(60)); -- Exp
					e.other:Faction(363,50); -- Yunjo Slave Resistance +50
					e.other:Faction(416,-25); -- Gladiators of mata muram
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,10,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			
			---
			---- Event Trades
			---

			elseif riwwi_progress == 11 then										-- Event #1
				if (item_lib.check_turn_in(e.trade, {item1 = 52233})) then	-- Item: Blood-Soaked Satchel (1st Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52085,eq.ExpHelper(55));		-- Item: Yunjo's Braided Cord
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 12 then										-- Event #2
				if (item_lib.check_turn_in(e.trade, {item1 = 52234})) then	-- Item: Blood-Soaked Satchel (2nd Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52086,eq.ExpHelper(55));		-- Item: Yunjo's Sea Kelp Cord
					e.other:Message(MT.NPCQuestSay, "Turlini kicks the shackles from their legs. 'Quick, to the exits!'");
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 13 then										-- Event #3
				if (item_lib.check_turn_in(e.trade, {item1 = 52235})) then	-- Item: Blood-Soaked Satchel (3rd Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52087,eq.ExpHelper(55));		-- Item: Yunjo's Woven Twine Cord
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 14 then										-- Event #4
				if (item_lib.check_turn_in(e.trade, {item1 = 52236})) then	-- Item: Blood-Soaked Satchel (4th Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52088,eq.ExpHelper(55));		-- Item: Yunjo's Plaited Hynid-Fur Cord
					e.other:Message(MT.NPCQuestSay, "Turlini kicks the shackles from their legs. 'Quick, to the exits!'");
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 15 then										-- Event #5
				if (item_lib.check_turn_in(e.trade, {item1 = 52237})) then	-- Item: Heavy Satchel (5th Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52089,eq.ExpHelper(55));		-- Item: Yunjo's Hynid Fang Cord
					e.other:Message(MT.NPCQuestSay, "Turlini says 'Yes! We have been released! Head to the marshlands.'");
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 16 then										-- Event #6
				if (item_lib.check_turn_in(e.trade, {item1 = 52238})) then	-- Item: Heavy Satchel (6th Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52090,eq.ExpHelper(55));		-- Item: Pressed Leather Yunjo Sash
					e.other:Message(MT.NPCQuestSay, "Turlini says 'Yes! We have been released! Head to the marshlands.'");
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 17 then										-- Event #7
				if (item_lib.check_turn_in(e.trade, {item1 = 52239})) then	-- Item: Blood-Soaked Satchel (7th Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52091,eq.ExpHelper(55));		-- Item: Spiked Leather Yunjo Sash
					e.other:Message(MT.NPCQuestSay, "Turlini kicks the shackles from their legs. 'Quick, to the exits!'");
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 18 then										-- Event #8
				if (item_lib.check_turn_in(e.trade, {item1 = 52240})) then	-- Item: Blood-Soaked Satchel (8th Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52092,eq.ExpHelper(55));		-- Item: Woven Bone Yunjo Sash
					e.other:Message(MT.NPCQuestSay, "Turlini kicks the shackles from their legs. 'Quick, to the exits!'");
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 19 then										-- Event #9
				if (item_lib.check_turn_in(e.trade, {item1 = 52241})) then	-- Item: Blood-Soaked Satchel (9th Event)
					e.other:Message(MT.NPCQuestSay, "Turlini gives you an appraising nod, 'Your valiant demonstration in the arena has given us all hope that someone can stand against the Muramites. Please accept this trinket as a token of appreciation from our people.'");
					e.other:QuestReward(e.self,0,0,0,0,52093,eq.ExpHelper(60));		-- Item: Silvery Mesh Yunjo Sash
					e.other:Faction(363,10);										-- Yunjo Slave Resistance +10
				end

			elseif riwwi_progress == 20 then										-- Event #10
				if (item_lib.check_turn_in(e.trade, {item1 = 52242})) then	-- Item: Blood-Soaked Satchel (10th Event)
					e.self:Emote("shouts with joy. 'Aha, you've done it! Thanks to your distractions in the coliseum, the Muramite legion is engulfed in utter chaos. We will take this opportunity to escape. You have saved us all. Oh, I almost forgot! Before I go, take this as a final gift from the Yunjo. It holds much strength, just as you do. Unfortunately I have bad news. Something I could not tell you until now. Reyna passed on a few days ago. Her last request was that I give this to someone who had proven his or her worth. You have more than done that. I wish there were more I could do, but we are masters of shaping stone not life.'");
					e.other:QuestReward(e.self,0,0,0,0,52094,eq.ExpHelper(65));		-- Item: Sash of the Yunjo's Champion
					e.other:Message(MT.NPCQuestSay, "Turlini says 'I can't wait to be reunited with my family! Let's get out of this place.'");
					e.other:SummonItem(67417);-- Item: Reyna's Scout Report
					e.other:Faction(363,10);-- Yunjo Slave Resistance +10
					e.self:MoveTo(-599,-687,9,257,true);
					e.self:SetRunning(true);
					eq.signal(282049,1); -- #Namosa_Bubundu (282049)
					eq.signal(282056,1); -- #Narundel_Emuen (282056)
					eq.signal(282048,1); -- #Ranguali (282048)
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,21,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end

function event_waypoint_arrive(e)
	eq.depop_with_timer();
end
