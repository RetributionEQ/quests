-- The Fourteen Great Adventurers: http://everquest.allakhazam.com/db/quest.html?quest=2854
-- items: 67619

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
		if (bit.band(greatadventures_turnins, 4096) ~= 0) then
			e.other:Message(MT.DarkGray, "Gizzmu the Wise says 'Thank you for your kindness. With people like you around Norrath may yet make it through this.'")
		elseif (greatadventures_dialog > 0) then
			e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
			e.other:Message(MT.DarkGray, "Gizzmu the Wise says 'Forgive me but sometimes I get so distracted when I stare out at the water here. I hate this feeling of worry that has overcome me. Here I am waiting for my son's return and yet something keeps telling me my wait is for naught. He is not coming back that is all I can think, but something keeps me hoping. I am sure you have heard our story, there are several others on this ship who have been awaiting the return of the 14 adventurers who set out to stop the Force Commander, one of them was my son Maddoc. While I am close to giving up, I would at least like to have something of his to remember him by. Something I can keep with me so I know somehow he is still looking out for me.'")
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
	if (item_lib.check_turn_in(e.trade, {item1 = 67619})) then -- Maddoc's Writings
		e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
		e.self:Emote("takes the bound volume from your hands and weeps. As she flips from page to page the crying becomes more intense until finally she closes the book unable to continue. 'Something told me you would bring an end to my worry. While this is not the happy return I had wished for it will help me move on. May your adventures be plentiful and your spirit forever blessed.  If you have already helped everyone, please tell De'van that your task is complete and he will reward you.")
		eq.set_data(greatadventures_turnins_bucket, tostring(bit.bor(greatadventures_turnins, 4096)));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
