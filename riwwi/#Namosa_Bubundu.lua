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

			if riwwi_progress == 2 then
				if(e.message:findi("hail")) then
					e.other:Message(MT.NPCQuestSay, "Namosa Bubundu coughs pitifully and looks through you with weak eyes, 'This gazebo was once a place of contemplation, meditation, and reflection, but now it is a place of torture. These slavers shackle us here within feet of the pool of water and refuse us food or drink for days at a time, accompanied by horrible beatings. And now, I have had enough. I am through with this world and can only hope for peace in my passing. Before I pass on I wonder if you could do a [favor] for me?'");
				elseif(e.message:findi("favor")) then
					e.other:Message(MT.Yellow, "Namosa Bubundu slips you a scuffed signet ring, 'Yes, yes. Here is a family heirloom that I have been keeping secret from our captors. If you deliver this ring to my kin, I can die in peace knowing it never fell into their hands. There are rumors that some of my family members have escaped the clutches of these monsters and made their way into a city that floats on water. I hope you understand, friend. Go quickly.'");
					e.other:QuestReward(e.self,0,0,0,0,52179,1); -- Item: Scuffed Signet Ring
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,3,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
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

			if riwwi_progress == 4 then
				if (item_lib.check_turn_in(e.trade, {item1 = 52178})) then -- Item: Final Words
					e.other:Message(MT.NPCQuestSay, "Namosa Bubundu gasps, 'What?! Oh no, this isn't good at all. She isn't supposed to die. I am! Quick, go and see Councilman Tentric in Qinimi and let him know what's happening. He has always helped our family when we were in need. If you bring this token he will know I sent you!'");
					e.other:QuestReward(e.self,0,0,0,0,52176,eq.ExpHelper(60)); -- Item: Token of Understanding
					e.other:Faction(363,1); -- Yunjo Slave Resistance +1
					e.other:Faction(416,-1); -- Gladiators of Mata Muram -1
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,5,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			elseif riwwi_progress == 7 then
				if (item_lib.check_turn_in(e.trade, {item1 = 52175})) then -- Item: Drakelily
					e.other:Message(MT.NPCQuestSay, "Namosa Bubundu says 'A drakelily? My aunt grew these in her garden. In fact, I helped her plant some of them myself. She always told me they were a sign of hope. Thank you, ".. e.other:GetName() ..". I'll inform our people of your kindness.'");
					e.other:QuestReward(e.self,0,0,0,0,52174,eq.ExpHelper(55)); -- Item: Crescent Stone Amulet
					e.other:Faction(363,50); -- Yunjo Slave Resistance +50
					e.other:Faction(416,-25); -- Gladiators of Mata Muram -25
					e.other:Message(MT.NPCQuestSay, "Namosa touches your shoulder and gazes at you with pleading eyes. 'I hope this isn't presumptuous of me. You've already done so much. Before you go, I need to ask you for another favor. Turlini is under heavy guard in one of the nearby towers. The Muramites think he's up to something and I'm concerned they may torture or kill him. Please have a talk with Turlini when you can.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,8,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end

function event_signal(e)
	e.self:MoveTo(-599,-687,9,257,true);
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	eq.depop_with_timer();
end
