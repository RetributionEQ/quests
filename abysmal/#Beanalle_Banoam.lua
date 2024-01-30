-- Breakdown In Communication
-- General Guide Overview: https://www.raspersrealm.com/Everquest/GoD/miscBiC.html

-- Global Name: BIC-CharacterID

-- Field #1 - Overall BIC Status (Bitmask)
---- SubField - 1 = Started BIC
---- SubField - 2 = Completed Qinimi
---- SubField - 4 = Completed Barindu
---- SubField - 8 = Completed Riwwi
---- SubField - 16 = Completed Ferubi
---- SubField - 32 = Completed Sewers
---- SubField - 64 = Completed Vxed
---- SubField - 128 = Completed Tipt
---- SubField - 256 = Completed Yxtta
---- SubField - 512 = Completed Kod'Taz
---- SubField - 1024 = Completed all Pre Qvic Combines
---- SubField - 2048 = Completed Qvic
---- SubField - 4096 = Completed Inktu'Ta
---- SubField - 8192 = Completed Txevu
---- SubField - 16384 = Completed Tacvi
---- SubField - 32768 = BIC Completed
-- Field #2 - Fezbin Status (INT)
---- SubField - 1 - Completed Initial Hail
---- SubField - 2 - Completed Initial Dialog
---- SubField - 3 - Completed Pre Qvic and hailed
---- SubField - 4 - Asked What Interesting Information
-- Field #3 - Qinimi Status (INT)
---- SubField - 1 = Started Qinimi with Taminoa
---- SubField - 2 = Return Kreshin's Journal to Taminoa
---- SubField - 3 = Gave Journal to Sislono Nislan
---- SubField - 4 = Turn in items for Stone of Entry
---- SubField - 5 = Completed Stop the Exectution and Turned in Stone of Entry
---- SubField - 6 = Gave Taminoa Writ of the Magi (Gives back a different ID'd Writ)
---- SubField - 7 = Gave Sislono the 2nd Writ
---- SubField - 8 = Turn in Xictic's Robes to Taminoa
---- Subfield - 9 = Combined the Dull Gem Shard (Completed and Cannot Reset)
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
-- Field #5 - Riwwi Status (INT)
---- SubField - 1 = Started Riwwi with Taminoa
---- SubField - 2 = Turned in Reyna's Earring to Taminoa
---- SubField - 3 = Speak with Namosa (Need Kindly with Yunjo Slave Resistance) and gives you Scuffed Signet Ring
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
-- Field #6 - Ferubi Status (INT)
---- SubField - 1 - Started Ferubi with Taminoa and Gives you Tuned Farstone
---- SubField - 2 - Give Tuned Farstone to Rondo and gives you Sealed Report
---- SubField - 3 - Give Report to Taminoa
---- SubField - 4 - Complete Weapon Master Raid, Hail Smith's Spectral Memory and gives you Rondo's Report
---- SubField - 5 - Deliver Report to Taminoa
---- SubField - 6 - Combine Green Colored Gem Shard (Completed and Cannot Reset)
-- Field #7 - Sewers Status (INT)
---- SubField - 1 - Started Sewers with Vaifan Cogswin and gives you broken gearbox
---- SubField - 2 - Give the report from the combines to Vaifan, gives you Muddy Gem Shard
---- SubField - 3 - Combine Muddy Gem Shard (Completed and Cannot Reset)
-- Field #8 - Vxed Status (INT)
---- SubField - 1 - Started Vxed with Vaifan Cogswin
---- SubField - 2 - Combined 4 drops while at this progression step
---- SubField - 3 - Give Scout Frame to Vaifan
---- SubField - 4 - Combine Dusty Gem Shard (Completed and Cannot Reset)
-- Field #9 - Tipt Status (INT)
---- SubField - 1 - Started Tipt with Vaifan Cogswin and gives you Power Pack
---- SubField - 2 - Give Full Power Pack to Vaifan and gives you 4 items
---- SubField - 3 - Combined items at this step and spawned Scout Model XIII
---- SubField - 4 - Spoke with Scout and gives you Scouting Report
---- SubField - 5 - Give Report to Vaifan
---- SubField - 6 - Combine Dirt Covered Gem Shard (Completed and Cannot Reset)
-- Field #10 - Yxtta Status (INT)
---- SubField - 1 - Started Yxtta with L'diava
---- SubField - 2 - Give Xounii's Journal Page 1 to L'diava
---- SubField - 3 - Give 4 Journal Pieces to L'diava
---- SubField - 4 - Combine Translucent Gem Shard (Completed and Cannot Reset)
-- Field #11 - Kod`Taz Status (INT)
---- SubField - 1 - Started Kod'Taz with L'diava
---- SubField - 2 - Give Kitren's Tattered Cloak to L'diava and gives you Sealed Note
---- SubField - 3 - Give Note to Kevren
---- SubField - 4 - Say "I have done all you asked" when at the appropriate progression level and gives you Sealed Confession
---- SubField - 5 - Give Confession to L'diava
---- SubField - 6 - Combine Smokey Gem Shard (Completed and Cannot Reset)
-- 
-- Qvic+ is just simple combines and the overall bic status will be updated as the combines require all previous steps to be completed.

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end

function event_say(e)
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

		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'Hello, ".. e.other:GetName() .. ". It is truly an honor to meet you. I have heard some great things about you and hope that what I have [discovered] will interest you.'");
		elseif e.message:findi("discovered") then
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'After going through some of the reports submitted by the scout leaders, I was able to figure something out about the temples that lie beyond Yxtta and Kod'Taz. Apparently, the temple called Qvic is where the Muramite army first broke through. The temple was ravaged by the force of the explosion when the portal to the Muramites' realm closed. Of course, as you know, they are not the only thing that came through the portal. The strange magic stones we discovered were also a result of that explosion and up until now we thought we had found the most powerful ones. After going through the reports, I found out that concentrated pieces of the magic-imbued [matter] lie in the Qvic temple area and beyond.'");
		elseif e.message:findi("matter") then
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'These pieces of matter possess vast power like none we have ever seen, but there is a drawback. You see these special augmentations? I have come to call them shards of power because of the odd shapes they take. They must have their power removed and condensed before they can be applied to an item. I have figured out a way to do this, but another [drawback] has prevented me from testing my theory further.'");
		elseif e.message:findi("drawback") then
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'Well, these special shards can only be combined with an item they are attuned to. In other words, the materials that make up an item determine if these shards are compatible with it. Now, I have found many formulas that will allow for a particular shard to merge with a particular item. Recently I discovered one [item] that was perfectly in tune with them all.'");
		elseif e.message:findi("item") then
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'Why, your stone of course. The different items you have added to it have altered its makeup so much that it is hardly what it was when you first received it. It is a powerful item that can be made even more powerful with my help and yours, but this will require the help of many and I am afraid we do not have the force to take on such a task. Do you think you would be willing to collect the four shards of power from the temples and bring them to me as you get them?'");
		elseif e.message:findi("Yes") then
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'Excellent! I knew Fezbin was right about you. Okay, here is what I can tell you. Qvic, Inktu'ta, Txevu, and Tacvi are the names of the temples beyond Yxtta and Kod'Taz. Within each of these you should find a shard of power. The hard part will be finding one as the Muramites are aware of the power within them and are hoarding every piece they find. If my theory is correct, you will have to combine the shards in a particular order before the stone will become attuned with another. You should retrieve the shards from the temples in the order I said before -- Qvic, Inktu'ta, Txevu, and Tacvi. Give each shard to me one at a time so that I can remove and condense the magic for you and then you can combine them in the special sealer. Now, hurry! I am worried that the leader of the Muramites may realize he needs to get rid of these shards, before we can get our hands on them.'");
		end
	else
		e.other:Message(MT.NPCQuestSay, "Beanalle Banoam continues to look at the horizon wrapped in his thoughts.  He disregards your presence.");
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

		if bic_status >= 2047 and item_lib.check_turn_in( e.trade, {item1 = 67564}) then -- Item: Shard of Dark Matter
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'Ah, perfect. I am glad you were successful in finding it. Now, if you will give me one second I will condense the shard into concentrated energy which you can add to your stone. There we are. Please take the time to attach this, but make sure you do it in the order I mentioned when we first spoke.'");
			e.other:QuestReward(e.self,0,0,0,0,67572,eq.ExpHelper(65)); -- Item: Condensed Matter Shard
		elseif bic_status >= 4095 and item_lib.check_turn_in( e.trade, {item1 = 67565}) then -- Item: Shard of Dark Matter
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'Ah, perfect. I am glad you were successful in finding it. Now, if you will give me one second I will condense the shard into concentrated energy which you can add to your stone. There we are. Please take the time to attach this, but make sure you do it in the order I mentioned when we first spoke.'");
			e.other:QuestReward(e.self,0,0,0,0,67573,eq.ExpHelper(65)); -- Item: Condensed Matter Shard
		elseif bic_status >= 8191 and item_lib.check_turn_in( e.trade, {item1 = 67566}) then -- Item: Shard of Dark Matter
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'Ah, perfect. I am glad you were successful in finding it. Now, if you will give me one second I will condense the shard into concentrated energy which you can add to your stone. There we are. Please take the time to attach this, but make sure you do it in the order I mentioned when we first spoke.'");
			e.other:QuestReward(e.self,0,0,0,0,67575,eq.ExpHelper(65)); -- Item: Condensed Matter Shard
		elseif bic_status >= 16383 and item_lib.check_turn_in( e.trade, {item1 = 67567}) then -- Item: Shard of Dark Matter
			e.other:Message(MT.NPCQuestSay, "Beanalle Banoam says 'Ah, perfect. I am glad you were successful in finding it. Now, if you will give me one second I will condense the shard into concentrated energy which you can add to your stone. There we are. Please take the time to attach this, but make sure you do it in the order I mentioned when we first spoke.'");
			e.other:QuestReward(e.self,0,0,0,0,67574,eq.ExpHelper(65)); -- Item:  Condensed Shard of Power
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
