--[[ Discord Skin Samples: https://everquest.allakhazam.com/db/quest.html?quest=2839

  Items will set a databucket using lua bit in the same order listed here - Max 2047
  +---------------------------------+-------+
  | Name                            | id    |
  +---------------------------------+-------+
  | Kyv Sample                      | 67596 | = 1
  | Mastruq Sample                  | 67599 | = 2
  | Noc Sample                      | 67601 | = 4
  | Ra'Tuk Sample                   | 67605 | = 8
  | Aneuk Sample                    | 67600 | = 16
  | Ikaav Sample                    | 67598 | = 32
  | Ixt Sample                      | 67602 | = 64
  | Ukun Sample                     | 67597 | = 128
  | Completed first 8               | NAN   | = 256
  | Zun'muram Sample                | 67604 | = 512
  | Tunat'Muram Sample              | 67603 | = 1024
  +---------------------------------+-------+
  | Other Items                     | id    |
  +---------------------------------+-------+
  | Vaifan's Pocket Sampling Device | 67954 |
  | Distilled Salts                 | 67595 |
  | Alexsa's Research Notes         | 67624 |
  | Assistant Researcher's Symbol   | 67625 |
  +---------------------------------+-------+
--]] 


function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, traveler. My name is Alexsa and I'm currently looking into collecting samples from the strange beings that make up the Legion of Mata Muram ranks. Our initial encounters with them revealed that each one is innately resistant to certain weapon types and weak against others. So, by order of Morden, we must gather skin samples from each race and analyze them. Thanks to our tinkering sister, Vaifan, I now have a device which can readily examine samples.  However, with news of our scouts missing and our resources being spread so thin, retrieving these samples is impossible for us. Since you've taken the time to listen, I'm wondering if you would be [" .. eq.say_link("willing to help") .. "] or [" .. eq.say_link("not") .. "]?");
	elseif(e.message:findi("willing to help")) then
		e.self:Say("Oh wonderful! You don't know how helpful this will be. Take this device.  It is what we use to examine samples. When you defeat a Muramite, remove his tongue, place it inside of here, and combine it with some distilling salts. Distilling salts can be found along the shores of Natimbi. Once you have combined the ingredients, it will give you a final sample which I will need you to return to me when you get the chance. Each time you hand me a sample, I will be able to reveal to you the innate strengths and weaknesses for that race. If you are successful in recovering a sample from every different race that has come through the portal, then I will talk to Morden about giving you a reward.");
		e.other:SummonItem(67594); -- Vaifan's Pocket Sampling Device
	elseif(e.message:findi("not")) then
		e.self:Say("How unfortunate. No matter. I will find some way to get this information, with or without your help.");
	end
end

function event_trade(e)
	local item_lib = require("items")

	-- Set Locals
	local skinsamples_progress_bucket = ("skinsamples_progress-"..e.other:CharacterID());
	local skinsamples_progress = 0;

	-- Get Bucket Data
	if eq.get_data(skinsamples_progress_bucket) ~= "" then
		skinsamples_progress = tonumber(eq.get_data(skinsamples_progress_bucket))
	end

	if (bit.band(skinsamples_progress, 1) == 0 and item_lib.check_turn_in(e.trade, {item1 = 67596})) then		-- Kyv Sample 
		e.self:Say("Ah yes, the kyv. These stealthy beings are quite elusive. The fact that you were able to recover a sample from one of them is quite an accomplishment. Now, let's see... it appears that the kyv have no noticeable weapon weaknesses or resistances, but we do know they have the ability to deflect incoming arrows and thrown objects. It would seem that they are also resistant to poison based incantations, and quite weak to magic based spells.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 1)));
	elseif (bit.band(skinsamples_progress, 2) == 0 and item_lib.check_turn_in(e.trade, {item1 = 67599})) then	-- Mastruq Sample
		e.self:Say("Great sample! It looks like this was taken from a being with a thickened hide. This particular being is called a mastruq and seems to be quite resistant to blunt objects, but an arrow or slashing weapon would get through that hide quite easily. Because of their thick hides cold based elemental magic would be quite ineffective while the opposite would hold true for fire magic.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 2)));
	elseif (bit.band(skinsamples_progress, 4) == 0 and item_lib.check_turn_in(e.trade, {item1 = 67601})) then	-- Noc Sample
		e.self:Say("Looks like this came from the body of the race of beings called the noc. While their bony frames make them quite weak against crushing damage, their plated chests protect any major organs, reducing the effectiveness of arrows or slashing weapons. It would appear that their flesh is diseased which makes them resistant to disease based spells but their thin skin means that cold might be quite affective against them.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 4)));
	elseif (bit.band(skinsamples_progress, 8) == 0 and item_lib.check_turn_in(e.trade, {item1 = 67605})) then	-- Ra'Tuk Sample
		e.self:Say("This looks like a sample from the brutish ra'tuk. These large beasts wield their axes adeptly and seem to have no major weaknesses save magical based spells. Because of their strange body makeup magic tends to affect them more then other spell types.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 8)));
	elseif (bit.band(skinsamples_progress, 16) == 0 and item_lib.check_turn_in(e.trade, {item1 = 67600})) then	-- Aneuk Sample
		e.self:Say("These odd-looking floating beings interest me the most. They seem to be quite adept with magic making them strong against magical incantations.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 16)));
	elseif (bit.band(skinsamples_progress, 32) == 0 and item_lib.check_turn_in(e.trade, {item1 = 67598})) then	-- Ikaav Sample
		e.self:Say("These snakelike beings are very deadly. The scales on their lower body are all but impervious to slashing weapons, but a well-placed arrow could do some serious damage. They are masters of magical energy making their defenses against such spells very good. However they do seem to be weak against elemental magic like cold.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 32)));
	elseif (bit.band(skinsamples_progress, 64) == 0 and item_lib.check_turn_in(e.trade, {item1 = 67602})) then	-- Ixt Sample
		e.self:Say("These centaur-like beings are quite bloodthirsty. They appear to be bred for fighting. Their fur covered lower half makes them very resistant to the element of cold but while that fur can protect them from one element it also makes them very vulnerable to fire.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 64)));
	elseif (bit.band(skinsamples_progress, 128) == 0 and item_lib.check_turn_in(e.trade, {item1 = 67597})) then	-- Ukun Sample
		e.self:Say("An excellent find here! It appears that this was retrieved from one of the beings called an ukun. They have frail bodies but their blood is a deadly poison. This would imply that they are probably very resistant to poison.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 128)));
	elseif (skinsamples_progress == 511 and item_lib.check_turn_in(e.trade, {item1 = 67604})) then	-- Zun'muram Sample
		e.self:Say("A two-headed beast built for destruction. This creature is quite powerful, as I am sure you found out when you met it. While it does not appear to have any resistances or weaknesses, this sample should reveal some more information about its particular race.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 512)));
	elseif (skinsamples_progress == 1023 and item_lib.check_turn_in(e.trade, {item1 = 67603})) then	-- Tunat'Muram Sample
		e.self:Say("This is unbelievable, you retrieved a sample from the army's leader and you still live? You are truly a great adventurer. I must get this sample to our mages quickly. We must do some extended testing as we have not had any information on him till now.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 1024)));
	end

	-- Recapture current bucket value
	if eq.get_data(skinsamples_progress_bucket) ~= "" then
		skinsamples_progress = tonumber(eq.get_data(skinsamples_progress_bucket))
	end

	if(skinsamples_progress == 255) then -- First 8 Completed
		e.self:Say("Now that I have all of the basic samples I can add all of my research into this tome and give it to you.")
		e.self:Say("While we still need samples from both the force commander and his lieutenant, what you have given me so far warrants a reward of some kind. When you have recovered samples from both of the additional races I mentioned I will be able to reward you with something much better.")
		eq.set_data(skinsamples_progress_bucket, tostring(bit.bor(skinsamples_progress, 256)));
		e.other:SummonItem(67624); -- Alexsa's Research Notes
	elseif(skinsamples_progress == 2047) then -- All completed
		e.self:Say("You have collected all the samples we need and I thank you for the assistance. I am indebted to you and with approval given by Morden himself I want you to take this, hopefully it will help you in your future adventures. Good day and good luck.");
		e.other:SummonItem(67625); -- Assistant Researcher's Symbol
		if eq.get_data("symbol_complete") == "" then
			eq.world_emote(15,"Congratulations to ".. e.other:GetName() .." for gaining the first Assistant Researcher's Symbol.");
			eq.set_data("symbol_complete", "1");
		end
	else
		e.self:Say("You're doing great, but there are more samples left to be found. Please get them to me as soon as you can.");
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
