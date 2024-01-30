-- The Fourteen Great Adventurers: http://everquest.allakhazam.com/db/quest.html?quest=2854
-- items: 67620

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
		if (bit.band(greatadventures_turnins, 8192) ~= 0) then
			e.other:Message(MT.DarkGray, "Irena Pereira says 'From one warrior to another, thanks for what you did. Absor's memory will live on with me.'")
		elseif (greatadventures_dialog > 0) then
			e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
			e.other:Message(MT.DarkGray, "Irena Pereira says 'You must be the one De'van spoke to.  I'm not looking for any of your help. I know that the mighty Absor will return someday and until I am proven wrong I will continue to wait for him to arrive.'")
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
	if (item_lib.check_turn_in(e.trade, {item1 = 67620})) then -- Absor's Writings
		e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
		e.self:Emote("stops to look at the tome refusing to believe it is what it seems. As she leafs through each page she starts to get choked up. Slamming the book closed defying her want to shed tears she looks up at you and kneels. I thank thee mighty adventurer for helping place the spirit of Absor to rest.  If you have already helped everyone please tell De'van that your task is complete and he will reward you.")
		eq.set_data(greatadventures_turnins_bucket, tostring(bit.bor(greatadventures_turnins, 8192)));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
