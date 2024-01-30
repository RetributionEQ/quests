-- Ikkinz 1-3

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	local ikky_check = tonumber(qglobals.ikky);
	local ikky_flesh_check = tonumber(qglobals.ikky_flesh);
	local ikky_raid_check = tonumber(qglobals.ikkyraid);
	local ikky_alt_check = tonumber(qglobals.ikkyalt);
	local ikky_redo_check = tonumber(qglobals.ikkyredo);

	if(e.message:findi("Hail")) then
		if ikky_check ~= nil and ikky_check == 2 then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Welcome back, ".. e.other:GetName() .. ". Reports of your actions in the Temple of Singular Might suggest that you may be well on your way to becoming an outstanding addition to the coalition that investigates these temples. I continue standing my post and , boring as it is, it is of no interest to you I'm sure. If you want, we can talk [more] when we have some idel time. For now, if you're [ready to continue testing], we can proceed! What'll it be, ".. e.other:GetName() .. "?");
		elseif ikky_check ~= nil and ikky_check == 3 then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Welcome back, ".. e.other:GetName() .. ". Reports of your actions in the Temple of Twin Struggles suggest that you may be well on your way to becoming an outstanding addition to the coalition that investigates these temples. I continue standing my post and, boring as it is, it is of no interest to you I'm sure. If you want, we can talk [more] when we have some idle time. For now, if you're [ready to continue testing], we can proceed! What'll it be, ".. e.other:GetName() .. "?");
		elseif ikky_check ~= nil and ikky_check == 4 then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Welcome back, ".. e.other:GetName() .. ". I must congratulate you on your recent completion of all three trials. I must admit that I was unsure of your ability to do as well as you did. Now that you have finished, you have the choice of taking on some [other tasks]. If you'd like, we have a chance now to talk [more]. You're also more than welcome to attempt the trials again. If so, just let me know you're [ready to test] again and we'll proceed down that path. What'll it be, ".. e.other:GetName() .. "?");
		elseif ikky_check ~= nil and ikky_check == 5 then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Hmm, we are still missing some valuable information. I need you to retrieve the missing piece.");
		elseif ikky_check ~= nil and ikky_check == 7 then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Welcome back, ".. e.other:GetName() .. ". I've studied the glyph as much as I can for now. In addition to what we uncovered with the translated glyph, we've received word that the rumors of a dark summoning are indeed true. The truth of these rumors is no surprise to me at all with all that we've uncovered thus far. The Legion of Mata Muram is evil indeed. Are you here about those [rumors], or are you looking for some [other tasks]? I have a moment if you want to talk a bit [more] about me. You're also more than welcome to attempt the trials again. If so, just let me know you're [ready to test] again and we'll proceed down that path. What'll it be, ".. e.other:GetName() .. "?");
		end

		if ikky_flesh_check ~= nil and ikky_flesh_check == 2 then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'The problem is that this information reveals a most disturbing plot by the Muramites to summon a creature into this realm. They appear to be experts in teleportation. The parchment you returned to me described the use of Temple of the Damned to gather instruments of power that will allow the beast to coalesce in our world. It doesn't go into what those instruments are or when the summoning will take  place, so you must [discover their plans].");
			eq.delete_global("ikky_flesh");
			eq.set_global("ikky","5",5,"F");
		end

		if ikky_check ~= nil and ikky_check >= 2 then
			e.other:Message(MT.Yellow, "Kevren Nalavat says, 'If you want to see what you've completed at any time, just ask me for a [progress update]!'");
		else
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat looks relieved to see you.'Finally the Wayfarers Brotherhood has sent adventurers this far out. I was beginning to wonder what was happening. I'm Kevren Nalavat, one of the brotherhood's traveling scholars. We can talk [more] later. The important thing is that you're here and now that you are you'll need to prove that you're up to the challenges facing us on this rugged terrain. I've been all through this area and it's no place to be caught unaware! So what do you say? Are you [ready to be tested]?'");
		end
	elseif(e.message:findi("progress update") and ikky_check ~= nil) then
		progress_update(e);
	elseif(e.message:findi("more")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Well I haven't always been the bold adventurer you see before you. I know I may not look too daring, but that's because I'm trying to keep a low profile. Before I joined the Wayfarers Brotherhood I was a learned scholar and knowledge-seeker. I sought to uncover the mysteries of ancient ruins and civilizations lost long ago. I was so focused on my studies that most of my colleagues thought I bordered on [crazy].");
	elseif(e.message:findi("crazy")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Yes, crazy. I didn't mind though. I knew most of them would never uncover a full understanding of the past like I was. I continued my studies until I was approached by Morden Rasp -- I'm sure you've heard of him. He contacted me and said he was going to begin gathering artifacts from civilizations lost to the ages and that my skills were going to be needed in the times to come. I couldn't help but [join him].");
	elseif(e.message:findi("join him")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'His offer was irresistible! Since I joined the brotherhood I have provided my continuing expertise about lost civilizations. Of course, Morden told me that just being a scholar wasn't going to be enough. He said I had to learn some other skill to stay with the brotherhood as an explorer. I had already learned so much so quickly and didn't dare leave with all the new and exciting items we were getting from adventurers, so I decided to learn how to become a rogue so I could [sneak around] to collect what I needed.");
	elseif(e.message:findi("sneak around")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat looks toward the ground shamefully.");
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'It wasn't the most glamorous thing to do, I know. But you have to understand that I have never been the adventurous type! I certainly didn't want glamour of any kind. I figured sneaking around to gather [what was needed] would be easier than trying to fight my way through. Plus, sneaking around allowed me to go alone into ruins so I didn't need to rely on anyone.");
	elseif(e.message:findi("what was needed")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat suddenly looks up at you with renewed earnest. 'Oh you wouldn't believe the things I've already found out about the people who built the temples around here! Well firstly, it's been a bit more difficult than usual to find anything out about them because they have no written history -- they tell stories complemented with glyphs to recount their history. I've learned how to interpret most of the glyphs I've encountered so far and believe me when I say that it's been some of the most interesting work I've done thus far. That reminds me, do you want to hear some more about the [background information] of this area or are you ready to learn about the [trials]?'");
	elseif(e.message:findi("test")) then
		if ikky_redo_check == nil and ikky_check ~= nil and ikky_check >= 2 then
			eq.set_global("ikkyredo","1",5,"F");
			e.other:Message(MT.LightBlue, "Finished! - You can now retry any of the trials at any time!");
		else
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Good to hear! If you're interested I can give you a little [background information] about the mountaintop here before we get started, otherwise I'll explain the [trials] to you.");
		end
	elseif(e.message:findi("background information")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Good. There's no use going into an area without knowing the lay of the land. The first thing you should know is that you're walking into a huge expanse at the top of the mountain. It must have taken several years to dig out all the rock from the mountain. With the space they dug out they were able to build grand temples into the side of the mountain. Until you've seen them for yourself you can't imagine their [grandeur].");
	elseif(e.message:findi("grandeur")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Oh indeed! The trusik -- that's what they call themselves -- had powerful geomancers that must have expended huge amounts of energy to shape and mold the mountain. They used mighty golems to clear away the rubble so they could continue their work. The temples they built are all in recognition to [some being] they worshipped long ago and some of them seem to reach the sky!");
	elseif(e.message:findi("some being")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'From what I've been able to gather these people prayed to a god they call Trushar. They believed Trushar was the one who controlled the seas. It was to this deity that they [prayed for the destruction] of all non-believers and those who exiled them. I tend to wonder if they [prayed for the destruction] of non-believers or the nihil in the city.");
	elseif(e.message:findi("prayed for the destruction")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat scrunches his brow thoughtfully. 'From the information I've sorted through so far, the nihil in the city kicked the trusik out because they were tired of the fanatic belief in their beloved sea god. I even think that's where the name trusik comes from, a title for exiled believers of a non-existent being. I'm hoping that we can uncover some more of those [mysteries] in the temples beyond.'");
	elseif(e.message:findi("mysteries")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'There are still some things that are left unexplained. Most importantly is the fact that we don't know how deep the invader presence goes. We need to discover some of the reasons for the temples, what purpose they serve now, and what the invaders have to do with them. We need to investigate the temples and the remains further for this information. That's where you [come in].");
	elseif(e.message:findi("come in")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'I haven't had a lot of time to look around the temples, because I was commissioned to scout ahead and remain here for the adventuring parties that would be sent shortly after. Now that those parties are being sent, I have to maintain my post and make sure that those we're sending in to look for the information for us are up to the task. That's the very reason we have designed the [trials].");
	elseif(e.message:findi("trials")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat look turns serious. 'There are any number of new threats with these invaders and we're unsure just how powerful or how many of them there are. We need to make sure that those of you being sent up here to find that information out for us won't be scared off by the destructive force these invaders bring along with them. The trials must be done in a [specific order] and must all be completed before we can allow you to attempt any further work for the brotherhood.'");
	elseif(e.message:findi("specific order")) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'There exist three temples nearby that you must enter. I have defined these three as the Temple of [Singular Might], Temple of [Twin Struggles], and Temple of the [Tri-Fates]. In each lay the forces of the Legion of Mata Muram who must be destroyed. You must not be fooled, we do not control these temples. The areas are controlled by the Muramites, but we believe that these places hold the most predictable of the invaders and can be used easily as our testing grounds.");
	elseif(e.message:findi("singular might")) then
		if ikky_check == nil then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Beyond the dark fog to the south lies the Temple of Singular Might. You can find it between the two other temples. In front of the temple you will find a single, smaller temple where another of the brotherhood is waiting for you. Seek out Gazak Klelkek and speak to him about the troubles within the temple.");
			eq.set_global("ikky","1",5,"F");
		else
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Beyond the dark fog to the south lies the Temple of Singular Might. You can find it between the two other temples. In front of the temple you will find a single, smaller temple where another of the brotherhood is waiting for you. Seek out Gazak Klelkek and speak to him about the troubles within the temple.");
		end
	elseif(e.message:findi("twin struggles")) then
		if ikky_check ~= nil and ikky_check == 2 then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Beyond the dark fog to the south lies the Temple of Twin Struggles. It is past the first two temples. Seek out Maroley Nazuey and speak to her about the troubles within the temple.");  -- TODO: need live text
		else
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'I'm sorry ".. e.other:GetName() .. ", but you're not ready to face the second trial. You must first find Gazak Klelkek near the Temple of [Singular Might] and finish the first trial before you may proceed. Return to me when you have accomplished that feat.");
		end
	elseif(e.message:findi("fates")) then
		if ikky_check ~= nil and ikky_check == 3 then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Beyond the dark fog to the south lies the Temple of Tri-Fates. It is the first temple you will come to. Seek out Kenra Kalekkio and speak to her about the troubles within the temple");  -- TODO: need live text
		else
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'I'm sorry ".. e.other:GetName() .. ", but you're not ready to face the second trial. You must first find Gazak Klelkek near the Temple of [Singular Might] and finish the first trial before you may proceed. Return to me when you have accomplished that feat.");
		end
	elseif(e.message:findi("other tasks") and ikky_check ~= nil and ikky_check >= 4) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'As I suspected, you're ready for some challenging work! I must warn though, what lies ahead is not for the faint of heart. The other tasks that are available deal with three other areas. Those areas are the [Martyrs Passage], the [Pit of the Lost], and the [Crumbled Sanctuary] of the Divine. Choose the one you wish to attempt and we can continue.");
	elseif(e.message:findi("martyrs passage") and ikky_check ~= nil and ikky_check == 4) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Good, we're in need of a sturdy adventurer to help us with a dire situation along with the Martyrs Passage. First, this area was named so because it houses the spirits of martyred heroes lost long ago. The trusik lined the passageway with [ancient relics] to sooth the spirits while in the afterlife. Unfortunately, the Muramites are disturbing the remains and are looking to collect the spiritual remnants for some sinister use.");
		e.other:Message(MT.LightBlue, "Congratulations!- You've been commissioned to investigate Martyrs Passage.");
	elseif(e.message:findi("ancient relics") and ikky_check ~= nil and ikky_check >= 4) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'We're unsure what the invaders are gathering these particular relics for. From what I can surmise, none of them have any kind of magical properties. In any case, it's up to you and a group of adventurers to venture to the Martyrs Passage and [investigate] the situation. I've heard reports of ghosts in that area, so the invaders may have stirred up something unexpected.");
	elseif(e.message:findi("investigate") and ikky_check ~= nil and ikky_check >= 4) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'You'll need to head to the Martyrs Passage and recover four different relics. I advise taking a sturdy group with you because there may be invaders there in the process of burgling the passage. If you uncover any information on what the Mata Muram are planning to use these relics for, return that to me as well, Do you [understand] your objective?");
	elseif(e.message:findi("understand") and ikky_check ~= nil and ikky_check >= 4) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Good, be on your way then. Return to me when you have completed your objective. I wish you luck and await your return.");
	elseif(e.message:findi("pit of the lost") and ikky_check ~= nil and ikky_check >= 4) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'I'm glad you've decided to continue helping the brotherhood. We can always use adventurers like you. There have been some mysterious happenings coming from the Pit of the Lost. I don't have the information on what's going on, but another of the brotherhood nearby does. You must venture south of the Martyrs Passage and speak with Tublik Narwether. He will know what's going on.");
	elseif(e.message:findi("crumbled sanctuary") and ikky_check ~= nil and ikky_check >= 4) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'I'm glad you're sticking around to help out with some additional tasks. We can certainly use the help. On the east side of the largest temple to the west, there exists a crumbled temple. As of yet, we're unsure what the cause or reason of the destruction was. I don't have all the information, but Tublik Narwether does. Seek him out to the south of the Martyrs Passage and find out what you can from him.");
	elseif((e.message:findi("temple of the damned") or e.message:findi("discover their plan")) and ikky_check ~= nil and ikky_check == 5) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'You must go into the Temple of the Damned. It is the temple directly behind me with the fog looming around it. Explore the temple and search for the instruments of power that the Legion of Mata Muram priests are collecting. Once you have the relics in hand, return them to me so I can study them further. Good luck to you, ".. e.other:GetName() .. ".");
		e.other:Message(MT.LightBlue, "Finished! - You've been commissioned to investigate the Temple of the Damned!");
	elseif(e.message:findi("rumors") and ikky_check ~= nil and ikky_check == 7) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'It looks as though the invaders are planning on bringing beasts into this world by means of a collective summoning. We're unsure if they're even able to do this, but we do know that they cannot be allowed the chance to succeed. You are charged with finding the Muramites attempting this summoning and putting a stop to them at once! Is this something you [think you can do]?'");
	elseif(e.message:findi("think you can do") and ikky_check ~= nil and ikky_check == 7) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'I hoped as much. What I ask of you now won't be easy. You must gather a raiding force several times the size of your normal party. We fear that only sufficient force will be enough to stop this threat. Once you have your party in tow, make your way to the summoning circle, and vanquish the threat of the evil legion priests before they bring their minions into this realm. I have one [final warning] for you before you go.'");
	elseif(e.message:findi("final warning") and ikky_check ~= nil and ikky_check == 7) then
		e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'I am unsure of the Muramites' timing. It is possible that I have heard incorrectly and that the summoning force may not be there at this time. Do not take this to mean that I was wrong! The force will be there, but it may take them a few more hours to assemble. Be patient. They will arrive. Lastly, the rumors have stated that these legion priests will be using some special artifacts they have collected. We do not know what these artifacts are, but you must return one of these artifacts to me when you have finished so that we can examine it. Good luck, ".. e.other:GetName() .. ", I fear you may need it.'");
		e.other:Message(MT.LightBlue, "Finished! - You've been charged with stopping the ceremony at the Summoning Circle!");
	end

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

		if(e.message:findi("have done all you asked") and ikky_alt_check ~= nil and ikky_alt_check == 8 and kodtaz_progress == 3) then
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Indeed you have and your help is greatly appreciated. Take this back to L`diava I believe it has the answers she seeks.");
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,4);
			e.other:SummonItem(67562); -- Item: Sealed Confession
		end
	end
end

function progress_update(e)
	local qglobals = eq.get_qglobals(e.other);
	local ikky_check = tonumber(qglobals.ikky);
	local ikky_flesh_check = tonumber(qglobals.ikky_flesh);
	local ikky_raid_check = tonumber(qglobals.ikkyraid);
	local ikky_alt_check = tonumber(qglobals.ikkyalt);
	local ikky_redo_check = tonumber(qglobals.ikkyredo);
	local kodtaz_complete = tonumber(qglobals.god_kodtaz_complete);

	if ikky_redo_check ~= nil and ikky_redo_check == 1 then
		e.other:Message(MT.Lime, "Finished! - You can now retry any of the trials at any time!");
	end

	if ikky_check ~= nil and ikky_check >= 2 then
		e.other:Message(MT.Lime, "Finished! - You have completed the trial at the Temple of Singular Might!");
	end
	if ikky_check ~= nil and ikky_check >= 3 then
		e.other:Message(MT.Lime, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
	end
	if ikky_check ~= nil and ikky_check >= 4 then
		e.other:Message(MT.Lime, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
		if ikky_flesh_check ~= nil then
			e.other:Message(MT.Lime, "Finished! - You've been comminssioned to investigate the Martyrs Passage!"); 
			e.other:Message(MT.Lime, "Finished! - You've returned four relics from the Martyrs Passage!");
		end
	end
	if ikky_check ~= nil and ikky_check >= 5 then
		e.other:Message(MT.Lime, "Finished! - You've been comminssioned to investigate the Martyrs Passage!"); 
		e.other:Message(MT.Lime, "Finished! - You've returned four relics from the Martyrs Passage!");
		e.other:Message(MT.Lime, "Finished! - You've returned valuable information as to why the Muramites are in the Martyrs Passage!");
	end
	if ikky_check ~= nil and ikky_check >= 6 then
		e.other:Message(MT.Lime, "Finished! - You've been comminssioned to investigate the Temple of the Damned!"); 
		e.other:Message(MT.Lime, "Finished! - You've recovered important glyphs from the Temple of the Damned!");     
	end
	if ikky_check ~= nil and ikky_check >= 7 then
		e.other:Message(MT.Lime, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
	end
	if ikky_alt_check ~= nil and ikky_alt_check >= 8 then
		e.other:Message(MT.Lime, "Finished! - You've been charged with stopping the ceremony at the Summoning Circle!");
		e.other:Message(MT.Lime, "Finished! - You have collected the four Frayed Flesh Scraps from the Crumbled Sanctuary of Divine Destruction!");
	end
	if ikky_check ~= nil and ikky_check >= 8 then
		e.other:Message(MT.Lime, "Finished! - You were able to recover a rare artifact from the Grand Summoner's goons in the Summoning Circle!");
	end
	if ikky_check ~= nil and ikky_check >= 9 then
		e.other:Message(MT.Lime, "Finished! - You've sewn the flesh scraps together to make the Sewn Flesh Parchment!");
	end
	if ikky_check ~= nil and ikky_check >= 10 then
		e.other:Message(MT.Lime, "Finished! - You've found the three clues from the three trial temples!");
		if ikky_raid_check ~= nil and ikky_raid_check >= 1 then
			e.other:Message(MT.Lime, "Finished! - You've recovered the Artifact of Righteousness!");
		end
		if ikky_raid_check ~= nil and ikky_raid_check >= 2 then
			e.other:Message(MT.Lime, "Finished! - You've recovered the Artifact of Glorification!");
		end
		if ikky_raid_check ~= nil and ikky_raid_check >= 3 then
			e.other:Message(MT.Lime, "Finished! - You've recovered the Artifact of Transcendence!");
		end
	end
	if ikky_check ~= nil and ikky_check >= 13 then
		e.other:Message(MT.Lime, "Finished! - You've been instructed what needs to be done to make Icon of the Altar");
	end
	if ikky_check ~= nil and ikky_check >= 14 then
		e.other:Message(MT.Lime, "Finished! - You've constructed your Icon of the Altar!");
	end
	if kodtaz_complete == nil then
		e.other:Message(MT.Lime, "Kod'Taz still has secrets left to uncover...");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	local ikky_check = tonumber(qglobals.ikky);
	local ikky_flesh_check = tonumber(qglobals.ikky_flesh);
	local ikky_raid_check = tonumber(qglobals.ikkyraid);
	local ikky_alt_check = tonumber(qglobals.ikkyalt);
	local ikky_redo_check = tonumber(qglobals.ikkyredo);

	if ikky_check ~= nil and ikky_check == 4 then
		if(item_lib.check_turn_in( e.trade, {item1 = 60141,item2 = 60142,item3 = 60143,item4 = 60144})) then -- Items: Relic of the Martyr x4
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat examines the relics for a moment. 'The only thing I can find on these relics are glyphs. They're very old and hard to make out, but it appears that they depict four powers. I would say they refer to the temples around the Altar of Destruction, but I can't be sure. It will take some time to go over these some more. In the meantime, do you have anything else for me that might explain the Muramites' interest in the passage? If not, please do go look again. I'm sure there will be something there we can use!");
			e.other:Message(MT.LightBlue, "Finished! - You've returned four relics from the Martyrs Passage!");
			eq.set_global("ikky_flesh","1",5,"F");
		elseif((ikky_flesh_check ~= nil and ikky_flesh_check == 1) and item_lib.check_turn_in( e.trade, {item1 = 60145}))  then -- Item: Inscribed Flesh Dispatch
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Aha! I suspected there would be some kind of indication of what they were doing in that passage. I applaud your efforts. I only briefly skimmed the information and from what I can gather, it appears that there are nefarious deeds afoot. I'll need more time to examine this, but I should know what it says in a few moments. Well done, once again, ".. e.other:GetName() .. "!"); 
			e.other:Message(MT.LightBlue, "Finished! - You've returned valuable information as to why the Muramites are in the Martyrs Passage!");
			eq.set_global("ikky_flesh","2",5,"F");
		end
	elseif ikky_check ~= nil and ikky_check == 5 then
		if(item_lib.check_turn_in( e.trade, {item1 = 60146,item2 = 60147,item3 = 60148,item4 = 60149})) then -- Items: Glyph of the Damned x4
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat examines the strange glyphs. 'These glyphs are faded. I won't be able to decipher them until they've been cleaned up. You'll need to go back to the Martyrs Passage and recover some dust from the grounds nearby. Once you've gotten a pile of dust, you'll need to speak with Tublik Narwethar who is south of the Martyrs Passage. He has a stone tablet that can add some clarity to the glyphs with the help of that dust. Hurry along, ".. e.other:GetName() .. ", this information is important!'");
			e.other:Message(MT.LightBlue, "Finished! - You've recovered important glyphs from the Temple of the Damned!");
			e.other:SummonItem(60146); -- Item: Glyph of the Damned
			e.other:SummonItem(60147); -- Item: Glyph of the Damned
			e.other:SummonItem(60148); -- Item: Glyph of the Damned
			e.other:SummonItem(60149); -- Item: Glyph of the Damned
			eq.set_global("ikky","6",5,"F");
		end
	elseif ikky_check ~= nil and ikky_check == 6 then
		if(item_lib.check_turn_in( e.trade, {item1 = 60150})) then -- Items: Translated Glyph of the Damned
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat copies down the intricate patterns from the glyph. 'Very interesting, but very dangerous. I've gone over the glyphs and they suggest there is great danger in the summoning of some kind of ferocious beast. I need to study the markings further, but since I've transcribed them already, you can keep the glyph for your own use. Nicely done, ".. e.other:GetName() .. ".'");
			e.other:SummonItem(60150); -- Item: Translated Glyph of the Damned
			eq.set_global("ikky","7",5,"F");
			e.other:Message(MT.LightBlue, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
		end
	elseif ikky_check ~= nil and ikky_check >= 7 and ikky_alt_check == nil then
		if(item_lib.check_turn_in( e.trade, {item1 = 60151})) then -- Items: Grand Summoner's Glyph
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'You've done well to stop the summoning, ".. e.other:GetName() .. ". I know it wasn't easy, but you are quickly becoming known as someone who can do what needs to get done. I fear I have run out of things for you to do for now, so you must find Tublik Narwethar and speak with him for further tasks to complete. You can find him to the south of the Martyrs Passage. If I recall, he's been having some troubles with something in the [Pit of the Lost] as well as something to do with the [Crumbled Sanctuary] of the Divine. You may want to inquire to him about either one of those. Farewell for now, ".. e.other:GetName() .. ".'");
			eq.set_global("ikkyalt","8",5,"F");
			e.other:Message(MT.LightBlue, "Finished! - You were able to recover a rare artifact from the Grand Summoner's goons in the Summoning Circle!");
		end
	end

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

		if(item_lib.check_turn_in( e.trade, {item1 = 67702})) then -- Items: Sealed Note
			e.other:Message(MT.NPCQuestSay, "Kevren Nalavat says, 'Seems you have made quite an impression if you are trusted by L`diava. But don't think that this means you do not have to gain my trust. While you survived the three trials I am still in need of assistance, I some [other tasks] completed, when you have finished them please return to me and tell me you have done all I asked and I will give you what you came here for. If you do not wish to start these tasks right now we do have some time to talk a little [more].");
			update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,riwwi_progress,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,3);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
