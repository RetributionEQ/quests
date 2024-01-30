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

		if(e.message:findi("hail")) then -- 
			e.other:Message(MT.NPCQuestSay, "L`diava Rexxen says 'Yes, yes. What is it I can do for you? I am a very busy woman and do not have a moment to waste on just anyone. Are you one of the adventurers sent here by Fezbin?'");
		elseif(e.message:findi("yes")) then -- 
			e.other:Message(MT.NPCQuestSay, "L`diava Rexxen says 'Very good. You are just in time. I am in need of immediate assistance in the temple areas known as [Yxtta] and the [frightful temple], Kod'Taz. While our scouts have been missing for quite some time, I recently received some information that leads me to believe they may still be alive. Which one we help first is up to you. Which area do you wish to investigate?'");
		elseif(e.message:findi("Yxtta")) then -- 
			e.other:Message(MT.NPCQuestSay, "L`diava Rexxen says 'Yxtta is one of three smaller temple areas where a group of natives known as the trusik used to worship a god called Trushar. We do not know who this god is, but we believe he is a false god centered around a belief in natural destruction. Xounii Resnen was the scout assigned to this area. She was given this task because of her expertise in shapeshifting. I told her to take the shape of a trusik native and interact with them to find out more information. She managed to fit in quite well. Perhaps too well. Gradually, reports came less frequently until they eventually stopped. While everyone feared she had suffered the same fate as the other scouts, I think she started to believe she was really a trusik and has abandoned her assignment. What I need you to do is go there and find her. Now, be careful, the trusik are not a friendly race of beings and they are even more irritated by the invasion of the Muramite army. When you find Xounii I fear she may attack you. If this happens, I will not fault you for defending yourself, but if it comes to this I want some form of proof as to what happened.'");
			if yxtta_progress == 0 then
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,1,kodtaz_progress);
			end
		elseif(e.message:findi("frightful temple")) then -- 
			e.other:Message(MT.NPCQuestSay, "L`diava Rexxen says 'Kod'Taz is made up of multiple temples that were once used for worship by the trusik natives. Many of them have since been destroyed or made into strongholds for the Muramite army. Due to the sheer size of this area, we sent a scouting force there to investigate. All of them are still alive, save one, named Kitren Lanom. None of the scouts left in the area know what happened to her or her belongings. Last time they remember seeing her was when she entered the Temple of Tri-Fates in an attempt to pass the temple trial. Please go to Kod'Taz and speak to Kevren Nalavat. He should be able to help you access the three trials. You will have to enter each trial and bring me back anything you find of Kitren's from each temple. Even though the scouts there have searched many times for something, I think a fresh set of eyes may help some. Kevren is the only one who knows you are helping me. Please do not let the others know you were sent by me. I have not yet ruled out the possibility of foul play and if they are aware of your affiliation, it may place you in more danger.'");
			if kodtaz_progress == 0 then
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,1);
			end
		end
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

		--
		-- Yxtta Section
		--

		-- Field #10 - Yxtta Status (INT)
		---- SubField - 1 - Started Yxtta with L'diava
		---- SubField - 2 - Give Xounii's Journal Page 1 to L'diava
		---- SubField - 3 - Give 4 Journal Pieces to L'diava
		---- SubField - 4 - Combine Translucent Gem Shard (Completed and Cannot Reset)

		if(item_lib.check_turn_in( e.trade, {item1 = 67555}) and yxtta_progress == 1) then -- Item: Xounii's Journal Page 1
			e.other:Message(MT.NPCQuestSay, "L`diava Rexxen says 'Thank you for returning this to me. I wish the circumstances could have been different, but in honor of her memory, we will use this information to prevent the needless death of any other scouts. Now let me see what is written here. Hm. Seems she stumbled onto a secret ritual of some sort in an underground temple, called Uqua. Looks like the Muramites may be trying to reproduce another tear in space. This does not bode well for anyone. We must find out more about this. I must ask that you return to Yxtta and see if you can find any more of Xounii's entries. I cannot tell you where to start looking, but it seems that the best place to look would be in the caves where you found her. Xounii was very diligent about her reports so she would have written much about this. Try to find four more pieces of her journal entries and return them to me.'");
			e.other:QuestReward(e.self,0,0,0,0,0,eq.ExpHelper(60)); -- Exp
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,2,kodtaz_progress);
		elseif(item_lib.check_turn_in( e.trade, {item1 = 67556,item2 = 67557,item3 = 67558,item4 = 67703}) and yxtta_progress == 2) then -- Item: Xounii's Journal Page 2/3 Left/Right
			e.other:Message(MT.NPCQuestSay, "L`diava Rexxen tells you, 'You are truly a blessing from the gods. I thank you for risking your life to help the brotherhood and want to offer you this token of our appreciation. It is an item of dormant power locked within. The only way to unlock this power is to combine it with the stone Fezbin gave to you. Now that we have solved the mystery of Yxtta, I need assistance in Kod'Taz. If you are willing to help please ask me about this area.'");
			e.other:QuestReward(e.self,0,0,0,0,67570,eq.ExpHelper(65)); -- Item: Translucent Gem Shard
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,3,kodtaz_progress);

		--
		-- KodTaz Section
		--			

		-- Field #11 - Kod`Taz Status (INT)
		---- SubField - 1 - Started Kod'Taz with L'diava
		---- SubField - 2 - Give Kitren's Tattered Cloak to L'diava and gives you Sealed Note
		---- SubField - 3 - Give Note to Kevren
		---- SubField - 4 - Say "I have done all you asked" when at the appropriate progression level and gives you Sealed Confession
		---- SubField - 5 - Give Confession to L'diava
		---- SubField - 6 - Combine Smokey Gem Shard (Completed and Cannot Reset)

		elseif(item_lib.check_turn_in( e.trade, {item1 = 67561}) and kodtaz_progress == 1) then -- Item: Kitren's Tattered Cloak
			e.other:Message(MT.NPCQuestSay, "L`diava Rexxen says 'Oh, thank you brave adventurer. We are now one step closer to finding out what happened to Kitren. Now, give me one second to look through the cloak here and . . . here it is, Kitren's notebook. There must be some information here that can help us more. While I read through this, I need you to return to Kevren Nalavat. He believes he may have found more clues to Kitren's whereabouts and since you did such a good job with the trials he believes you may be able to help him. Even though you have proven yourself by defeating the trials, he will not give you what I need unless you help him. When you return to him, show him this letter and it will confirm my trust in you. Hurry now. There no time to waste!'");
			e.other:QuestReward(e.self,0,0,0,0,67702,eq.ExpHelper(60)); -- Item: Sealed Note
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,2);
		elseif(item_lib.check_turn_in( e.trade, {item1 = 67562}) and kodtaz_progress == 4) then -- Item: Kitren's Tattered Cloak
			e.other:Message(MT.NPCQuestSay, "L`diava Rexxen says 'Once again, a job well done. I hear you accomplished the tasks with flying colors. Now let's see what this says. Hm . . . this changes everything. I never suspected something like this, but now that I know, it all makes sense to me. Oh poor Kitren, why didn't you warn me first? Please leave me be. I must take sometime to think. Take this as proof of your accomplishments in Kod'Taz. It possesses a power that you can unlock when you combine it with the stone from Fezbin. Return to me later if you wish to investigate Yxtta.'");
			e.other:Message(MT.Yellow, "You have succeeded in retrieving all the information the Wayfarers Brotherhood was seeking. Return to Fezbin and tell him you have completed your task so that he can give you your final reward.");
			e.other:QuestReward(e.self,0,0,0,0,67569,eq.ExpHelper(60)); -- Item: Smoky Gem Shard
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,5);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
