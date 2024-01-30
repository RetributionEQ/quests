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
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'Well, hello traveler. You here to help with the scout problem we've been having?'");
		elseif(e.message:findi("yes")) then -- 
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'Good to hear. I have been going out of my skull trying to tinker another one to find the first. Now that you are here, I can stop that and focus on compiling the information I already have. Let me tell you, being in charge of something like this is very taxing on the nerves. I remember being a young gnome and whenever I tinkered something it worked the first time. Ah, how good it felt to put the Cogswin family emblem on my wonderful creations. Nowadays it seems like everything I make has some intermittent flaw or defect. I might have to accept that I am getting old and a little slow, but I still have the wits to invent. I should stop rambling and get to the point. I am in charge of scouting the mountain areas known as [Tipt], [Vxed], and the [sewers] under the city. Which would you like to know about?'");
		elseif(e.message:findi("sewers")) then -- 
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'According to my records here, the sewers are a pretty vile area. Filled with some strange creatures, I hear. So, being the genius that I am, I came up with a plan to use a prototype clockwork scout I built when we were having problems exploring the catacombs in Mistmoore. He appeared to be working fine. I received constant detailed reports on the sewers and mountain areas until one day it stopped. For some time I tried to make contact with the clockwork, but nothing. I started working on a second one to retrieve the first when Falcin stumbled onto the boat. In his struggle to get back to us he had to make his escape through the sewers. While going through there, he found this. This is the reporting module used by the clockwork scout. It does not look like much now, but you should have seen it when Falcin gave it to me. I have repaired most of the damage in an attempt to access the information stored within, but there are four vital components missing. I need you to go to the four sewer areas and find a timing gear, a rusty spring, an oiled cog, and a processing gizmo. When you have them all, place them inside the gearbox and combine them. Once this has been done, the gearbox should give you a report. Return the report to me.'");
			if sewers_progress == 0 then
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,1,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				e.other:SummonItem(67528); -- Item: Broken Clockwork Output Gearbox
			end
		elseif(e.message:findi("Vxed")) then -- 
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'We have discovered that this continent holds many dangerous creatures, including the strange beings of the invading army. Many of these beasts can be found in the mountain area called Vxed. After being severely damaged in Tipt, the clockwork scout made its way back to Vxed to perform self maintenance, but I believe this is where it met its final demise. While the chance is slim, I believe you may be able to salvage enough of the parts from the creatures within Vxed to reassemble the frame. What you will need to find is a flickering finkenheimer, a tarnished sprocket, some uncoiled springs, a greased bolt, and some connection rods. When you have them all place, the sprocket, springs, bolt, and rods in the finkenheimer and bring me the result. I must warn you to be careful though. If these things could stop my clockwork, they must be pretty powerful creatures.'");
			if vxed_progress == 0 then
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,1,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif(e.message:findi("Tipt")) then -- 
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'The mountainous areas of this continent hold many dangers within them. Tipt in particular is thick with members of the invading army, dangerous creatures, and the angry spirits of nihil refugees. Looking at the information I have, the clockwork scout tried to take a direct path to the other side of Tipt and had some serious problems. Apparently, it had a run in with some cragbeasts, a pack of ghosts, numerous Muramites, and a native riddlemaster. While he made it pretty far, he took significant damage each step of the way. My last report received for this area stated that it was returning to the Vxed area to recover, but had lost multiple power cells in the process. I need you to retrieve these power cells. They are vital to rebuilding the scout and getting that report. There are five different types of cells, each one is called Vaifan's Power Cell -- named after the most ingenious gnome there is, of course. The cells are named from A to E. When you have collected all of them, place them in this power pack, activate it, and return it to me.'");
			if tipt_progress == 0 then
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,1,yxtta_progress,kodtaz_progress);
				e.other:SummonItem(67547); -- Item: Depleted Clockwork Power Pack
			end
		end
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
		-- Sewers Section
		--

		-- Field #7 - Sewers Status (INT)
		---- SubField - 1 - Started Sewers with Vaifan Cogswin and gives you broken gearbox
		---- SubField - 2 - Give the report from the combines to Vaifan, gives you Muddy Gem Shard
		---- SubField - 3 - Combine Muddy Gem Shard (Completed and Cannot Reset)

		if(item_lib.check_turn_in( e.trade, {item1 = 67534}) and sewers_progress == 1) then -- Item: Mangled Report
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'Grrr, I was afraid of this. Seems without the extra modules working together this one won't function completely. Nonetheless at least it is fixed now and with your assistance we should be able to reassemble the scout and place this module back inside. Take this. I found it in the gearbox when I first received it. Seems like it may have some affinity with the stone Fezbin gave to you. Let me know when you are ready to help out some more.'");
			e.other:QuestReward(e.self,0,0,0,0,67535,eq.ExpHelper(65)); -- Item: Muddy Gem Shard
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,2,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);

		--
		-- Vxed Section
		--

		-- Field #8 - Vxed Status (INT)
		---- SubField - 1 - Started Vxed with Vaifan Cogswin
		---- SubField - 2 - Combined 4 drops while at this progression step
		---- SubField - 3 - Give Scout Frame to Vaifan
		---- SubField - 4 - Combine Dusty Gem Shard (Completed and Cannot Reset)
		
		elseif(item_lib.check_turn_in( e.trade, {item1 = 67554}) and vxed_progress == 2) then -- Item: Clockwork Scout Shell
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'I can't believe you did it. Not a bad job if I do say so myself. You may have a future in tinkering my young friend. Now, if you will give me one second to change a few things and rip this part out, adjust this here, add a couple of these, and there you go, a nice new clockwork frame. Now we just need to collect the rest of the pieces to rebuild him. Oh, and before I forget, here is a reward for helping me out. Let me know if you wish to explore any of the other areas by asking me about them.'");
			e.other:QuestReward(e.self,0,0,0,0,67568,eq.ExpHelper(65)); -- Item: Dusty Gem Shard
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,3,tipt_progress,yxtta_progress,kodtaz_progress);

			--
			-- Tipt Section
			--

			-- Field #9 - Tipt Status (INT)
			---- SubField - 1 - Started Tipt with Vaifan Cogswin and gives you Power Pack
			---- SubField - 2 - Give Full Power Pack to Vaifan and gives you 4 items
			---- SubField - 3 - Combined items at this step and spawned Scout Model XIII
			---- SubField - 4 - Spoke with Scout and gives you Scouting Report
			---- SubField - 5 - Give Report to Vaifan
			---- SubField - 6 - Combine Dirt Covered Gem Shard (Completed and Cannot Reset)

		elseif(item_lib.check_turn_in( e.trade, {item1 = 67537}) and tipt_progress == 1) then -- Item: Fully Charged Power Pack
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'Now that we have all the functioning pieces, we can reassemble the scout. Take these instructions and this power pack adapter and return to either mountain area to assemble the scout. I would have you do it here, but I fear he may be unstable and . . . well, let's just say I don't want to put the ship in danger. Please return to me with the report once you have it. I am going to prepare my final report so when you return I can take it straight to Fezbin. Good luck to you.'");
			e.other:SummonItem(67539); -- Item: Inactive Clockwork Scout Module
			e.other:SummonItem(67576); -- Item: Extended Life Power Pack
			e.other:SummonItem(67538); -- Item: Power Pack Adapter
			e.other:SummonItem(67577); -- Item: Clockwork Scout Assembly Instructions
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,2,yxtta_progress,kodtaz_progress);
		elseif(item_lib.check_turn_in( e.trade, {item1 = 67536}) and tipt_progress == 4) then -- Item: Outer Regions Scouting Report
			e.other:Message(MT.NPCQuestSay, "Vaifan Cogswin says 'Excellent. It is always wonderful when something you invent works out. This was all I needed to finish up my report to Fezbin. Thank you once again. You have been very helpful. Once again I must reward you with this. When you brought the clockwork frame to me this fell out of it. I think it will go with your stone quite well. Try combining the two together and see what happens. I must say goodbye now.'");
			e.other:Message(MT.Yellow, "Your assistance has helped Vaifan and Taminoa greatly, but L'diava is still in need of assistance.");
			e.other:QuestReward(e.self,0,0,0,0,67553,eq.ExpHelper(65)); -- Item: Dirt Covered Gem Shard
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,5,yxtta_progress,kodtaz_progress);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
