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

		if fezbin_progress >= 2 then
			if(e.message:findi("hail")) then -- 
				e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'Greetings. You must be one of the adventurers that Fezbin told me about. It is a pleasure to meet such a brave individual. Where are my manners? My name is Taminoa Bialu and I compile all the information from our scouts in the [city] area of Taelosia.");
			elseif(e.message:findi("city")) then -- 
				e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'Well, it appears the native inhabitants of Taelosia lived in a grand city once. This city is made up of four different areas named in their language. They are [Qinimi], [Riwwi], [Barindu], and [Ferubi]. Based off of early information, we believe each area had a specific purpose. I am still trying to decipher the native language to figure out what the names mean, but going off of visual information I can assume that Qinimi served as their court, Riwwi is where they held games, Barindu was a lush garden, and Ferubi was a central place of worship once. That is about the extent of my information as far as the intended purpose of each area. What they are now used for I can explain in further detail. Which area would you like to hear more about?");
			elseif(e.message:findi("Qinimi")) then -- 
				e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'It appears the Muramites have made this some sort of stronghold. Destroying many of the native symbols, the invaders have converted the building that once served as the court into fortified headquarters. It is here you will find a structure called the Chamber of Souls, various pens to hold ukun, and a moat of sickly black sludge. The structures that the nihil once called home are all but destroyed now. Very sad indeed. That's where the legion keeps the bulk of the [slaves]. I believe that the scout for this area was caught sneaking around the housing district, but I have no proof. If you were to search this area, maybe you would find some sort of sign or marker he may have left. That would be helpful.");
			elseif(e.message:findi("slaves")) then -- 
				e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'I see Fezbin saved some of the more dismal news for me. The legion has enslaved the natives of the continent. In the city area, these slaves are used mainly for menial tasks. Due to their fragile bodies, they cannot do any heavy lifting, but their knowledge of shaping stone makes them perfect for building new structures for the legion to use as well as altering current ones. They command the stone workers. I am not sure how the slaves are used in the temple areas. That information is held by L`diava.");
				if qinimi_progress == 0 then
					update_databucket(e,bic_status,fezbin_progress,1,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			elseif(e.message:findi("Barindu")) then -- 
				e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'This area holds the remains of what was once a place to build stone workers. We can only guess what purpose this part of the city served and all we know now is that it is home to some of the cruelest acts of violence against the nihil. I assigned this area to Talwin, a young wood elf new to the brotherhood. He was a proven scout eager to assist. Initially things were going well, but the information he was sending was not helping much. I think this worried him and resulted in him pushing his luck a little far. Ever since I told him his reports were lacking the vital evidence we needed I have not heard from him. Before Falcin passed on, I asked him if he had found anything out about Talwin and he shook his head. I know Talwin is still alive . . . he has to be . . . and I know that there must be some clues in the area of Barindu somewhere. He was diligent about recording what he found so I would assume that if he has been captured that his writings must be lying around the area somewhere. See if you can find two of his journal entries and bring them back to me. When you return please give what you find to my assistant Opury Foop. She is trying to help me organize my reports a little better.");
				if barindu_progress == 0 then
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,1,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			elseif(e.message:findi("Riwwi")) then -- 
				e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'Riwwi has to be the most interesting of all of the city areas. You see, this is where the coliseum is located. Now, we are not completely aware of how it was used before this invading army took up residence in the area, but now it is used for the merciless slaughter of the nihil. Early reports from our scout, Reyna, indicate that the slaves in the area would not interact with her until she proved herself. How she was able to do this I am not sure, but I would suggest trying to find something of Reyna's while I go over my Riwwi information. Come back to me when you find something.");
				if riwwi_progress == 0 then
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,1,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			elseif(e.message:findi("Ferubi")) then -- 
				e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'The area called Ferubi was once a Taelosian temple. Now it is a place that reeks of pain and suffering. The invading army has desecrated the temple and the slaves within endure unimaginable torture. Based on the information our scout Smith Rondo sent to me before his disappearance, the invaders use this area to craft weaponry and conduct strange experiments. Smith's ability to sneak in and out of places quickly made him the ideal choice for this job, but like most of our other scouts he eventually got caught trying to reveal a vital piece of information. We have confirmed that he is still alive and I need you to go find him and give him this. It is a special farstone attuned to his aura so only he can use it. Please make haste in your mission, but be careful. You are entering the lion's den and if you are caught, I cringe to think what will happen.");
				if ferubi_progress == 0 then
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,1,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
					e.other:SummonItem(67519); -- Item: Tuned Farstone
				end
			end
		end
	else
		e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'I don't mean to be rude, but I am really busy at the moment. Unless you have something important to tell me, I must ask that you leave me be.");
	end
end

function event_trade(e) -- TODO All Turnins
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
		-- Qinimi Section
		--

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

		if(item_lib.check_turn_in( e.trade, {item1 = 67397}) and qinimi_progress == 1) then -- Item: Kreshin's Journal Page
			e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'Yes. This is exactly what I needed. Excellent job. Okay, now give me one moment to decipher this . . . hm. It seems that just before he was captured he was trying to communicate with the slaves in the area. The text is very hard to make out, but it looks like he may have been trying to get into the main headquarters. He was interacting with a particular slave named Sislono Nislan. This slave promised him a way into the headquarters only if he promised to rid the area of a tyrant, named Tixxrt. The rest of the parchment is undecipherable. I would suggest finding this slave and showing him this to see if he knows what happened.");
			e.other:QuestReward(e.self,0,0,0,0,67700,eq.ExpHelper(52)); -- Item: Kreshin's Journal Page (New Version)
			update_databucket(e,bic_status,fezbin_progress,2,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
		elseif(item_lib.check_turn_in( e.trade, {item1 = 67401}) and qinimi_progress == 5) then -- Item: Writ of the Magi
			e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'Finally, you have returned and with some information I see. Kreshin contacted me in advance to let me know of your daring rescue. We are indebted to you. Now, back to business. While I cannot make out most of it, Kreshin has translated some of it and it appears to be a description of a ritual one of the head ikaav performs regularly. Apparently she has been trying to absorb the geomantic powers of the natives of Taelosia. The details are kind of sketchy as Kreshin was only able to translate so much, but some information is better than none, I always say. Anyway, it says here that the ritual is conducted in the Chamber of Souls. It used to be a large tower which the natives used to watch the shores. The tower was destroyed when the invaders took over the area and converted it to a ritual chamber. They used it in experiments centered on the extraction of magic. The head ikaav, known as Xictic, has been trying to use the powers of the native Taelosians to build an army of stone workers that he can directly control instead of relying on the ability of slaves. During the ritual, Xictic stands atop a platform which is suspended over a circle of platforms. The center platform holds an inanimate stone worker while eight ikaav stand on smaller platforms around the center. What happens next is not really known, but the end result is three lifeless slave corpses. According to this, she has not yet been successful, which I would say is good news. But if we do not stop her, she could easily reinforce the numbers with stone workers tainted by the touch of this legion. I know you have accomplished your goal, but I must ask that you find a way into this ritual and silence Xictic for good. Show this to Nislan. He should be able to decipher the images. I believe this is the key to getting into the ritual chamber. Now, hurry please and return to me with proof of Xictic's death so that I can make a final report on the Qinimi area to Fezbin.'");
			e.other:QuestReward(e.self,0,0,0,0,67403,eq.ExpHelper(52)); -- Item: Writ of the Magi (New Version)
			update_databucket(e,bic_status,fezbin_progress,6,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
		elseif(item_lib.check_turn_in( e.trade, {item1 = 67511}) and qinimi_progress == 7) then -- Item: Xictic's Bloody Robes
			e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says, 'You have returned bruised, but not broken I see. I am disappointed to hear that he got away, but you are not at fault. We could not foresee how crafty these beings would be. The information you have given us will be invaluable. Fezbin will be pleased. Kreshin told me to give this to you. He believes it may be one of the fragments that will fit into the stone Fezbin gave you. Who knows, if you help me find the rest of our scouts we may yet find more fragments.'");
			e.other:QuestReward(e.self,0,0,0,0,67513,eq.ExpHelper(65)); -- Item: Dull Gem Shard
			update_databucket(e,bic_status,fezbin_progress,8,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);

		--
		-- Barindu Section
		--

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

		elseif(item_lib.check_turn_in( e.trade, {item1 = 67516}) and barindu_progress >= 4) then -- Item: Talwin's Final Report
			e.other:Message(MT.NPCQuestSay, "Taminoa Bialu looks at the final report before bowing his head for a second. 'While I had accepted Talwin's passing as reality, I still hoped you would save him in time. Either way, I thank you for your effort and for delivering this vital piece of information contained in this report. Please take this. I found it wrapped up in the report. Talwin would have wanted you to have it as it appears to be a gem fragment that could fit into the stone Fezbin gave you. Now that you have finished all that was needed for Barindu, there is still more of the city left to explore and I won't be able to complete my report until it is done.'");
			e.other:QuestReward(e.self,0,0,0,0,67517,eq.ExpHelper(65)); -- Item: Shiny Gem Shard
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,12,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);

		--
		-- Riwwi Section
		--

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

		elseif(item_lib.check_turn_in( e.trade, {item1 = 67510}) and riwwi_progress == 1) then -- Item: Reyna's Bloody Earring
			e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'This does not bode well for Reyna's fate. If I had to guess, I would say they took her to the coliseum. Knowing what we know about these strange beings, they would have taken her to the coliseum just so they could entertain themselves by torturing her. You must find a way into the coliseum and save Reyna. I think your best plan of action would be to locate and speak to Turlini and Namosa. They are two slaves Reyna mentioned in her reports. They may not talk to you if you have not proven yourself, but once you do that they should be pretty helpful. They may even know an easy way into the coliseum. Find these two and ask them about Reyna. Return to me when you find out more information about her.'");
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,2,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
		elseif(item_lib.check_turn_in( e.trade, {item1 = 67417}) and riwwi_progress == 21) then -- Item: Reyna's Scout Report
			e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Reyna was a skilled scout who had spent many years honing her abilities. Learning that she died so horribly upsets the stomach, but she died trying to help others. Yes . . . that's what we should focus on. This report you have returned will be a great help to us and this reward should help you as well. It was wrapped in the report and appears to be a gem fragment that may fit into the stone Fezbin gave you. Now to the rest of the city. Hopefully we can prevent our other scouts from suffering the same fate as Reyna.'");
			e.other:QuestReward(e.self,0,0,0,0,67518,eq.ExpHelper(65)); -- Item: Glowing Gem Shard
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,22,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);

		--
		-- Ferubi Section
		--

		-- Field #6 - Ferubi Status (INT)
		---- SubField - 1 - Started Ferubi with Taminoa and Gives you Tuned Farstone
		---- SubField - 2 - Give Tuned Farstone to Rondo and gives you Sealed Report
		---- SubField - 3 - Give Report to Taminoa
		---- SubField - 4 - Complete Weapon Master Raid, Hail Smith's Spectral Memory and gives you Rondo's Report (Only person at this step can start raid)
		---- SubField - 5 - Deliver Report to Taminoa
		---- SubField - 6 - Combine Green Colored Gem Shard (Completed and Cannot Reset)

		elseif(item_lib.check_turn_in( e.trade, {item1 = 67520}) and ferubi_progress == 2) then -- Item: Sealed Report
			e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Ah. Glad to see you return and report that you found Smith. Let me see, what does it say here . . . oh my, I can't believe this. These beings are truly insane. This is a detailed account of the experiments the Muramites have been conducting on the natives and on Smith. If what is listed here is true, we must find out more about this. It says that this is one of two reports he wrote, so we must assume he still has the other one on him. It also says here that the weapon master has access to the mountain area that leads to a secret way into the temples where they conduct these experiments. Oh, poor Smith. As soon as he figured out what was going on he documented it, hoping that he could somehow get it back to us without them finding out. Hm . . . here at the bottom he gives details about the weapon master. Seems he only enters the Ferubi area to fix the weapons that his four elite guards use. Knowing this, I am sure we can trick him into appearing. You must return to Ferubi and find his elite guards and collect a different weapon from each of them, but remember the weapon has to be damaged. Sounds like this is pretty durable stuff they use, so it may take some time to accomplish this. Either way, once it is done I would suggest giving the pieces to Smith and asking him to help.'");
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,3,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
		elseif(item_lib.check_turn_in( e.trade, {item1 = 67526}) and ferubi_progress == 4) then -- Item: Rondo's Report
			e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'You have now finished the scouting of the city.  Take this as a reward.'");
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,5,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			e.other:QuestReward(e.self,0,0,0,0,67527,eq.ExpHelper(65)); -- Item: Green Colored Gem Shard
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
