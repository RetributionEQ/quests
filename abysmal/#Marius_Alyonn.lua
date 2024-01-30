-- Gates of Discord: Helmet Eclipsing Liquidation Machine (H.E.L.M.)

function event_say(e)
	local armor_state = eq.get_data("QVIC_helm_change-"..e.other:CharacterID());

	if armor_state then
		if(e.message:findi("Hail")) then
			e.self:Emote("looks at ".. e.other:GetName() .. " and begins to speak.");
			e.self:Say("Ah, so I see you have returned. Do you wish to change your headgear back? Or are you here to alter another? Either way, I am going to have to charge you a small [" .. eq.say_link("fee") .. "] this time. I am planning to sell this invention in Norrath and beyond, but I need to save a little more money first.");
		elseif(e.message:findi("fee")) then
			e.self:Say("Hmm, let me see, the cost of materials, having to perform maintenance after the process is done, opening the item and closing it again, plus a small labor charge. I think a diamond sounds fair, what do you say [" .. eq.say_link("yes") .. "] or [" .. eq.say_link("no") .. "]");
		elseif(e.message:findi("yes")) then
			e.self:Say("Good, then please hand the gem and I will give you my latest version of the H.E.L.M. device that you can use at your leisure. But before you give me the diamond remember that this device is only compatible with the latest class quest helms.");
		elseif(e.message:findi("no")) then
			e.self:Say("Then please stop standing there looking at me like a peice of meat.");
		end
	else
		if(e.message:findi("Hail")) then
			e.self:Emote("looks at ".. e.other:GetName() .. " and begins to speak.");
			e.self:Say("Come to exchange your [" .. eq.say_link("helm") .. "] or you just like looking at gnomes?");
		elseif(e.message:findi("helm")) then
			e.self:Say("Yes that's what I said. I have been working with the dwarves to create a device that can alter the view of your headgear. This advanced gnomish technology, that's right gnomish technology, will remove the shroud that makes your helm invisible to the naked eye. It can also replace the shroud if you decide you don't like it being shown. Amazing isn't it? And it was all my design! The only drawback to this device, appropriately named the Helmet Eclipsing Liquidation Machine or H.E.L.M. for short, is that it is only compatible with certain [" .. eq.say_link("headgear") .. "].");
		elseif(e.message:findi("headgear")) then
			e.self:Say("Well, so far I have only been successful with the latest class quest helms but I am hoping to expand soon. For now though if you have any of these and wish to try my machine out, then hand it over and let the show begin.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local armor_state = eq.get_data("QVIC_helm_change-"..e.other:CharacterID());

	if(item_lib.check_turn_in( e.trade, {item1 = 10037})) then -- diamond
		e.self:Say("Here is the latest version of my H.E.L.M device."); 
		e.other:SummonItem(67735); -- Disposable H.E.L.M Device 
	elseif(item_lib.check_turn_in( e.trade, {item1 = 67720})) then -- Dakkamor's Helm of the Divine (clr)
		e.self:Emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
		e.self:Say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
		eq.set_data(armor_state, "true");
		e.other:SummonItem(68855); -- Dakkamor's Helm of the Divine
	elseif(item_lib.check_turn_in( e.trade, {item1 = 67729})) then -- Gaelin's Woodland Cap (dru)
		e.self:Emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
		e.self:Say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
		eq.set_data(armor_state, "true");
		e.other:SummonItem(68900); -- Gaelin's Woodland Cap
	elseif(item_lib.check_turn_in( e.trade, {item1 = 67732})) then -- Jennu's Circlet of Creation (mag)
		e.self:Emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
		e.self:Say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
		eq.set_data(armor_state, "true");
		e.other:SummonItem(68915); -- Jennu's Circlet of Creation
	elseif(item_lib.check_turn_in( e.trade, {item1 = 67726})) then -- Kanleku's Helm of Spirits (shm)
		e.self:Emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
		e.self:Say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
		eq.set_data(armor_state, "true");
		e.other:SummonItem(68885); -- Kanleku's Helm of Spirits
	elseif(item_lib.check_turn_in( e.trade, {item1 = 67733})) then -- Nolaen's Lifereaper Circlet (nec)
		e.self:Emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
		e.self:Say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
		eq.set_data(armor_state, "true");
		e.other:SummonItem(68920); -- Nolaen's Lifereaper Circlet 
	elseif(item_lib.check_turn_in( e.trade, {item1 = 67731})) then -- Nunkin's Circlet of Pure Elements (wiz)
		e.self:Emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
		e.self:Say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
		eq.set_data(armor_state, "true");
		e.other:SummonItem(68910); -- Nunkin's Circlet of Pure Elements 
	elseif(item_lib.check_turn_in( e.trade, {item1 = 67728})) then -- Pressl's Cap of Balance (mnk)
		e.self:Emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
		e.self:Say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
		eq.set_data(armor_state, "true");
		e.other:SummonItem(68895); -- Pressl's Cap of Balance 
	elseif(item_lib.check_turn_in( e.trade, {item1 = 67721})) then -- Trimdet's Helm of Chivalry (pal)
		e.self:Emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
		e.self:Say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
		eq.set_data(armor_state, "true");
		e.other:SummonItem(68860); -- Trimdet's Helm of Chivalry
	end
	item_lib.return_items(e.self, e.other, e.trade)
end