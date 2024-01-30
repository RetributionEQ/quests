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
---- SubField - 16384 = Completed Tacvi (BIC Completed)
-- Field #2 - Fezbin Status (INT)
---- SubField - 1 - Completed Initial Hail
---- SubField - 2 - Completed Initial Dialog
---- SubField - 3 - Completed Pre Qvic and hailed
---- SubField - 4 - Combined Adventure's Stone
---- SubField - 5 - Asked What Interesting Information
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
	if e.other:GetLevel() >= 65 then
		local data_bucket = ("BIC-"..e.other:CharacterID());
		if eq.get_data(data_bucket) ~= "" then -- Has Started
			local temp = eq.get_data(data_bucket);
			s = eq.split(temp, ',');

			local bic_status		= tonumber(s[1]); -- Current Overall Status
			local fezbin_progress	= tonumber(s[2]); -- Progress Level for Fezbin			
			local qinimi_progress	= tonumber(s[3]); -- Progress Level for Qinimi
			local barindu_progress	= tonumber(s[4]); -- Progress Level for Barindu
			local riwwi_progress	= tonumber(s[5]); -- Progress Level for Riwwi
			local ferubi_progress	= tonumber(s[6]); -- Progress Level for Ferubi
			local sewers_progress	= tonumber(s[7]); -- Progress Level for Sewers
			local vxed_progress		= tonumber(s[8]); -- Progress Level for Vxed
			local tipt_progress		= tonumber(s[9]); -- Progress Level for Tipt
			local yxtta_progress	= tonumber(s[10]); -- Progress Level for Yxtta
			local kodtaz_progress	= tonumber(s[11]); -- Progress Level for Kod'Taz

			-- Reset Logic - breaks when completed.
			if(e.message:findi("rescout")) then
				zone = e.message:match("rescout%s*(%a+)")
				-- e.other:Message(MT.Red,"DEBUG - rescout [".. zone .."]")
				if(zone == "qinimi" and qinimi_progress ~= 9) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to Taminoa.'");
					update_databucket(e,bic_status,fezbin_progress,0,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				elseif(zone == "barindu" and barindu_progress ~= 13) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to Taminoa.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,0,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				elseif(zone == "riwwi" and riwwi_progress ~= 23) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to Taminoa.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,0,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				elseif(zone == "ferubi" and ferubi_progress ~= 6) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to Taminoa.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,0,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				elseif(zone == "sewers" and sewers_progress ~= 3) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to Vaifan.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,0,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				elseif(zone == "vxed" and vxed_progress ~= 4) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to Vaifan.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,0,tipt_progress,yxtta_progress,kodtaz_progress);
				elseif(zone == "tipt" and tipt_progress ~= 6) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to Vaifan.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,0,yxtta_progress,kodtaz_progress);
				elseif(zone == "yxtta" and yxtta_progress ~= 4) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to L`diava.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,0,kodtaz_progress);
				elseif(zone == "kodtaz" and kodtaz_progress ~= 6) then
					e.other:Message(MT.Magenta, "Fezbin Fizzles says, 'I will take a look at the reports that have been filed and dispose of them properly please return to L`diava.'");
					update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,0);
				end
				return;
			end
				
			if(fezbin_progress == 1) then -- Starting First Dialog
				if(e.message:findi("hail")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Greetings adventurer, have you come to explore this new [continent] we recently discovered?");
				elseif(e.message:findi("continent")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles focuses his attention on ".. e.other:GetName() ..".");
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Due to some rather odd events with Calliav, we, the Wayfarers Brotherhood, were guided here to the continent we have come to call Taelosia. It is a continent which has suffered through a great magical explosion and now the native inhabitants are in dire straits. Our goal was to investigate this continent and find out more about the strange pieces of matter that we recently found in various places. All signs led us here and so we decided to build this magnificent floating city you are standing in. Unfortunately, we have found out some rather disturbing [news] recently that has all of us rather concerned.");
				elseif(e.message:findi("news")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Well, when we finished the city, we began to send out scouts to various locales all over the new continent. Right away information started to flow in. They gave us details on the layout of the land and its current inhabitants. We began to piece together this picture of the current state of things on land. Many of the reports gave details on various things like wildlife and climate as well as the local inhabitants and level of advancement. All of this seemed promising to us as we thought we might be able to talk to the natives and find out more about the strange matter that seemed to originate from this place, but then we begin to receive some very [upsetting reports].");
				elseif(e.message:findi("reports")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Apparently, the event that spread these strange pieces of matter all over Norrath brought with it a group of beings more horrifying than a shaved dwarf. These creatures seemed to be an organized army of some sort. They have apparently taken over the continent and enslaved the natives. Curious about this, we ordered our scouts to find out more about these beings. Specifically, if they could be reasoned with and if they knew anymore about the odd chunks of rock we found recently. Shortly after we made this demand, everything [stopped].");
				elseif(e.message:findi("Stopped")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'The scout reports stopped coming in. We figured that maybe they had just not found anything yet, but as time went by we began to worry. That's when Morden suggested that we send someone to find one of them and learn what was going on. Young Falcin did not know what he was getting into when he volunteered to check things out for us. Falcin left here under the light of a full moon and returned soon after barely able to breathe. He had been caught spying on the beings that currently control the continent. They had tortured him for hours trying to get information. Being the resourceful human he is, he managed to escape only to be mauled by what the natives call ukun, a humanoid creature that is twisted and lethal. Left for dead, Falcin dragged himself back to us and explained what he had [discovered] during his ordeal.");
				elseif(e.message:findi("discovered")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Falcin told us that all of the scouts had been captured and were either dead or were enduring extreme torture sessions. These invading beings are a vicious lot who show absolutely no mercy. Falcin's wounds were proof enough of that. Falcin explained that the scouts who were still alive are being held near where they had been discovered. Those who he could not find he assumed were dead but he still tried to get some proof before he wrote them off. Unfortunately Falcin would not live to see his desire through, he passed on shortly after revealing this information to us and now we are at a loss as to how we can help our scouts who are still living return to us and provide a proper burial for those who were lost. We cannot afford to send anyone else out there as it seems it will require a significant force in order to have any chance of accomplishing the [task] we need completed.");
				elseif(e.message:findi("task")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'With half of our numbers back home dealing with the investigation of the recently unearthed dungeons and the rest here on the ship handling what information we have and trying to decide the best plan of action, Morden figured it might be a good idea to ask some courageous individuals to assist us. Morden has authorized some form of valuable reward for those who can bring us any information regarding our missing scouts or the scouts themselves. Seeing as how you have been so interested in all I have said so far, do you think you would be interested in helping the Wayfarers Brotherhood?");
				elseif(e.message:findi("yes")) then
					e.other:Message(MT.Lime, "You have received the 'Breakdown in Communication' quest. Now you must find those mentioned by Fezbin and help them the best you can. If at any point you find you have made a mistake in your scouting, please return to Fezbin and say, 'rescout (zone name)' and he will reset your status in that zone. If you lose your reward at any point, return to Fezbin and hail him and he should give you the appropriate reward based on your level of progress.");
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Most excellent. Please take these as a token of our gratitude. It is not much to look at now, but by helping us you will find ways to make this stone more [powerful] when combining it with certain items in that sealer. Please take the time to find Taminoa Bialu, Vaifan Cogswin, and L`diava Rexxen. They are all located on this ship. Each of them is responsible for information from certain areas of the continent. Taminoa has all the information on the city area, Vaifan keeps the information on the mountain passes, and L`diava collects information on the temple areas. If you truly wish to help us, talk to some or all of them and they will help guide you to the right path. When you have finished helping them all, return to me and I shall give you the reward that has been approved by Morden.");
				elseif(e.message:findi("powerful")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'The stone I have given you is very special indeed. It is a rare stone with a power that has not yet been revealed. After studying it we have come to the conclusion that its power is based off of resonance. You will see that there are fourteen sockets in the stone. Each socket requires a gem fragment of a certain resonance. As the fragments are set in the stone it will gradually increase in power. These fragments must be placed in the stone in a certain order using a set of clockwork gemcutter's tools, the stone, and the correct shard in the device I handed to you along with the stone. As you help find our scouts, you may come across the gem fragments that will fit into the stone. If you do, please try combining them in the special sealer. If at any time you lose the sealer or misplace the stone return to me and I will what I can do about a replacement.");
					e.other:SummonItem(67659); -- Item: Vaifan's Experimental Sealer
					e.other:SummonItem(67512); -- Item: Socketed White Crystal
					update_databucket(e,bic_status,2,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				end
			elseif(fezbin_progress == 2) then -- Completed Initial Dialog
				if(e.message:findi("sealer")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Be careful with this one.");
					e.other:SummonItem(67659); -- Item: Vaifan's Experimental Sealer
				elseif(e.message:findi("stone")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Be careful with this one.");
					e.other:SummonItem(67512); -- Item: Socketed White Crystal
				elseif(e.message:findi("I have completed my task")) then -- Nice Try
					e.other:Message(MT.Red,"Your assistance is still needed elsewhere. Find Vaifan, L`diava, or Taminoa and see what you can do for them.");
				else
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'You have not finished helping the others. Please return to me when you have done so.");
				end
			elseif(fezbin_progress == 3) then -- Completed Pre Qvic tasks and combined Smokey Gem Shard into Smoke Green Gemstone
				if(e.message:findi("I have completed my task")) then -- Completed Pre Qvic
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'So I have been told, ".. e.other:GetName() ..". Your help will long be remembered by the brotherhood. Since you first came to me, the stone should have grown in power and now I will give you the item that will unlock the stone's full potential. Please combine this with your stone after you have combined all of the other items given to you by the lead scouts and you will possess an item of immense power and a symbol of your fighting spirit. Once again, the brotherhood thanks you. I must bid you good day as I recently received some [interesting information].");
					e.other:Message(MT.Lime, "Flag: You have done quite well and your exploits will forever be talked about by the members of the Wayfarers Brotherhood, but don't you dare relax as there's still many more adventures and hidden treasures out there waiting for a hero like you.");
					e.other:QuestReward(e.self,0,0,0,0,67571,0); -- Jagged Blood Shard
					update_databucket(e,bic_status,4,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				elseif(e.message:findi("sealer")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Be careful with this one.");
					e.other:SummonItem(67659); -- Item: Vaifan's Experimental Sealer
				elseif(e.message:findi("stone")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Be careful with this one.");
					e.other:SummonItem(67512); -- Item: Socketed White Crystal
				else
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'You have not finished helping the others. Please return to me when you have done so.");
				end
			elseif(fezbin_progress == 4) then -- Completed Basic Dialog with Fez
				if(e.message:findi("interesting information")) then -- 
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Where are my manners? I should have known someone as adventurous as you would be interested in this. One of our researching experts by the name of Beanalle has recently discovered some very intriguing information about the temples beyond Yxtta and Kod'Taz.");
					update_databucket(e,bic_status,5,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
				elseif(e.message:findi("sealer")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Be careful with this one.");
					e.other:SummonItem(67659); -- Item: Vaifan's Experimental Sealer
				elseif(e.message:findi("stone")) then
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Be careful with this one.");
					e.other:SummonItem(67512); -- Item: Socketed White Crystal
				else
					e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'You have not finished helping the others. Please return to me when you have done so.");
				end
			end
		else -- Has not started BIC
			e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Greetings adventurer, have you come to explore this new [continent] we recently discovered?");
			update_databucket(e,1,1,0,0,0,0,0,0,0,0,0); -- Not using a bitmask update on bic_status because this is initilization, no need to do the functions as this bucket does not exist.
		end
	else -- Not Level 65
		e.other:Message(MT.NPCQuestSay, "Fezbin Fizzles says, 'Well, hello traveler. Are you enjoying your stay on this wonderful ship? It is truly a wonder, isn't it? While I can see you are on the path to becoming a great adventurer, I sense that you are not yet powerful enough to help me with a task I need done. Return to me when you have experienced the world a little more.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
