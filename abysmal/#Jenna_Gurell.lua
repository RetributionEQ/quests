-- The Fourteen Great Adventurers: http://everquest.allakhazam.com/db/quest.html?quest=2854
-- items: 67618

function event_say(e)
	-- Set Locals
	local greatadventures_dialog_bucket = ("greatadventures_dialog-"..e.other:CharacterID());
	local greatadventures_turnins_bucket = ("greatadventures_turnins-"..e.other:CharacterID());
	local greatadventures_dialog = 0;
	local greatadventures_turnins = 0;

	-- Get Bucket Data
	if eq.get_data(greatadventures_dialog_bucket) ~= "" then
		greatadventures_dialog = tonumber(eq.get_data(greatadventures_dialog_bucket))
	end

	if eq.get_data(greatadventures_turnins_bucket) ~= "" then
		greatadventures_turnins = tonumber(eq.get_data(greatadventures_turnins_bucket))
	end
	
	-- Hail Logic
	if (e.message:findi("hail")) then
		if (bit.band(greatadventures_turnins, 2048) ~= 0) then
			e.other:Message(MT.DarkGray, "Jenna Gurell stares past you as she replays a past memory in her mind. 'While I thank you for what you have done, the sight of you saddens me. Please leave me be there are others who could use your help.'")
		elseif (greatadventures_dialog > 0) then
			e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
			e.other:Message(MT.DarkGray, "Jenna Gurell says 'Please do not disturb me. I am mourning the loss of my dear Rashere. While I do not know if his fate has yet been sealed the empty feeling in my heart tells me so. If only I could see him once more, if only I could read his words again.'")
		end
	end
end

function event_trade(e)
	local item_lib = require("items")

	-- Set Locals
	local greatadventures_turnins_bucket = ("greatadventures_turnins-"..e.other:CharacterID());
	local greatadventures_turnins = 0;

	-- Get Bucket Data
	if eq.get_data(greatadventures_turnins_bucket) ~= "" then
		greatadventures_turnins = tonumber(eq.get_data(greatadventures_turnins_bucket))
	end

	-- Trade Logic
	if (item_lib.check_turn_in(e.trade, {item1 = 67618})) then -- Rashere's Writings
		e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
		e.self:Emote("opens the book and begins to read from the last page aloud. As she reaches the final sentence her voice begins to crack and tears stream down her face. Wiping the tears from her face Jenna looks up at you and says 'Thank you but I really must be going. If you have done this wonderful thing for the others who have been suffering with me then return to De`van and tell him your task is complete and he will reward you.' Unable to continue she turns away from you motioning for you to leave.")
		eq.set_data(greatadventures_turnins_bucket, tostring(bit.bor(greatadventures_turnins, 2048)));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
