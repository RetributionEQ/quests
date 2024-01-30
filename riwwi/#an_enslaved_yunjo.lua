-- Breakdown in Communication #3: Riwwi -- The Great Diversion: Freeing Reyna

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

		
		if riwwi_progress == 10 then
			if e.message:findi("hail") then
				e.other:Message(MT.NPCQuestSay, "an enslaved yunjo says 'It's you! The champion everyone has spoken of! Have you come to defy the [Muramites]?'");
			elseif e.message:findi("Muramites") then
				e.self:Shout(e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and will destroy your kind!");
				eq.depop(282098);
				eq.depop_with_timer(282096);
				eq.depop_with_timer(282026);
				eq.unique_spawn(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				e.other:QuestReward(e.self,0,0,0,0,52223,1);	-- Item: Satchel of the First Battle
				eq.signal(282098,11,5 * 1000);									-- #an_officiator
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,11,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 11 then
			if e.message:findi("hail") then
				e.other:Message(MT.NPCQuestSay, "an enslaved yunjo smiles, 'You are very strong. If you wish to challenge the Muramites, hand me the item Turlini gave you and I will gain their attention again.'");
			end
		else 
			e.other:Message(MT.NPCQuestSay, "An enslaved yunjo eyes you suspiciously");
		end

		if riwwi_progress >= 10 and riwwi_progress <= 20 then
			e.other:Message(MT.NPCQuestSay, "an enslaved yunjo says, 'If you do not have the item, or failed the diversion, we can [start over] if you wish.");
			if e.message:findi("start over") then
				eq.depop(282098);
				e.self:Shout(e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and will destroy your kind!");
				eq.depop_with_timer(282096);
				eq.depop_with_timer(282026);
				eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				e.other:QuestReward(e.self,0,0,0,0,52223,1);	-- Item: Satchel of the First Battle
				eq.signal(282098,11,5 * 1000);									-- #an_officiator
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,11,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		end
	else
		e.other:Message(MT.NPCQuestSay, "An enslaved yunjo eyes you suspiciously");
	end
end

function event_signal(e)
	if e.signal == 1 then
		e.self:Say("Stand fast and prepare for a fight! They're sending a bloodthirsty beast into the arena to kill you as we speak. If you defeat it, place the head in this sack as proof and return it to Turlini. He is the leader of the resistance and may be able to assist you for helping us.");
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
		local el = eq.get_entity_list();
		if riwwi_progress == 11 then											-- Event Start #2
			if item_lib.check_turn_in(e.trade, {item1 = 52085}) then	-- Item: Yunjo's Braided Cord
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,1,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52224,1);					-- Item: Satchel of the Second Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,12,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 12 then										-- Event Start #3
			if item_lib.check_turn_in(e.trade, {item1 = 52086}) then	-- Item: Yunjo's Sea Kelp Cord
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,2,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52225,1);					-- Item: Satchel of the Third Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,13,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 13 then										-- Event Start #4
			if item_lib.check_turn_in(e.trade, {item1 = 52087}) then	-- Item: Yunjo's Woven Twine Cord
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,3,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52226,1);					-- Item: Satchel of the Fourth Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,14,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 14 then										-- Event Start #5
			if item_lib.check_turn_in(e.trade, {item1 = 52088}) then	-- Item: Yunjo's Plaited Hynid-Fur Cord
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,4,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52227,1);					-- Item: Satchel of the Fifth Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,15,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 15 then										-- Event Start #6
			if item_lib.check_turn_in(e.trade, {item1 = 52089}) then	-- Item: Yunjo's Hynid Fang Cord
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,5,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52228,1);					-- Item: Satchel of the Sixth Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,16,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 16 then										-- Event Start #7
			if item_lib.check_turn_in(e.trade, {item1 = 52090}) then	-- Item: Pressed Leather Yunjo Sash
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,6,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52229,1);					-- Item: Satchel of the Seventh Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,17,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 17 then										-- Event Start #8
			if item_lib.check_turn_in(e.trade, {item1 = 52091}) then	-- Item: Spiked Leather Yunjo Sash
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,7,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52230,1);					-- Item: Satchel of the Eighth Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,18,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 18 then										-- Event Start #9
			if item_lib.check_turn_in(e.trade, {item1 = 52092}) then	-- Item: Woven Bone Yunjo Sash
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,8,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52231,1);					-- Item: Satchel of the Ninth Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,19,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		elseif riwwi_progress == 19 then										-- Event Start #10
			if item_lib.check_turn_in(e.trade, {item1 = 52093}) then	-- Item: Silvery Mesh Yunjo Sash
				if not el:IsMobSpawnedByNpcTypeID(282098) then -- NPC: #an_officiator 
					eq.depop_with_timer(282096);
					eq.depop_with_timer(282026);
					eq.spawn2(282098,0,0,-174,625,73,258);	-- NPC: #an_officiator 
				end
				eq.zone_emote(MT.Red, "an enslaved yunjo shouts '" .. e.other:GetName() .. " defies you! Do you hear me? " .. e.other:GetName() .. " defies you and they will destroy your kind!'");
				eq.signal(282098,9,5 * 1000);									-- #an_officiator
				e.other:QuestReward(e.self,0,0,0,0,52232,1);					-- Item: Satchel of the Tenth Battle
				update_databucket(e,bic_status,fezbin_progress,qinimi_progress,barindu_progress,20,ferubi_progress,sewers_progress,vxed_progress,tipt_progress,yxtta_progress,kodtaz_progress);
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function update_databucket(e,status,fezbin_step,qinimi_step,barindu_step,riwwi_step,ferubi_step,sewers_step,vxed_step,tipt_step,yxtta_step,kodtaz_step)
	eq.set_data("BIC-"..e.other:CharacterID(), status..","..fezbin_step..","..qinimi_step..","..barindu_step..","..riwwi_step..","..ferubi_step..","..sewers_step..","..vxed_step..","..tipt_step..","..yxtta_step..","..kodtaz_step);
end
