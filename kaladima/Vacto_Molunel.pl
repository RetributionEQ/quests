sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Well met. $name!  I am Vacto Molunel.  If you are seeking to outfit yourself with the finest weapons in all of Kaladim, I am the one to see.  I also posses a [rare talent] you might find useful.");
	}
	elsif ($text=~/rare talent/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Piqued your interest. did I?  Well, you see, I am one of the few dwarves who possess the knowledge and talent to craft a unique type of armor entirely out of scarab carapaces.  While my specialty is making [scarab helms], I have also been convinced to make [scarab breastplates] and [scarab boots] from time to time.  All of the pieces I craft are to dwarven proportions, but I have had some gnomish and halfling customers as well.  They come from all over for my armor.");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
		}
		else {
			quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
		}
	}
	elsif ($text=~/scarab helms/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Interested in a scarab helm. are you?  Well, because my talent is so unique and my time is so valuable, I am afraid I could only make you a helm if you were to provide me with the two scarab carapaces necessary to accommodate a head such as yours.  I will also need a payment of 5 gold pieces.  The Butcherblocks are crawling with worker scarabs that have just the right size carapaces for our needs.");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
		}
		else {
			quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
		}
	}
	elsif ($text=~/scarab breastplates/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Ah..  A  scarab breastplate.. hmm.  Well, if you want to convince me to go though the trouble of crafting one of those, not only will you have to pay my fee of 23 gold pieces, you must provide me with a pristine giant scarab carapace.  I refuse to make a breastplate with cracked carapaces."); 
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
		}
		else {
			quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
		}
	}
	elsif ($text=~/scarab boots/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Ah..  Scarab Boots.. hmm.  Well, if you want to convince me to go though the trouble of crafting a pair of those, not only will you have to pay my fee of 17 gold pieces, you must provide me with a cracked giant scarab shell and 2 scarab legs."); 
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("Prove yourself to the Stormguard and then we shall talk. Perhaps you may assist Master Canloe and show your worth to us.");
		}
		else {
			quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
		}
	}
	elsif ($text=~/irontoe/i) {
		#:: Match if faction is Apprehensive or better
		if ($faction <= 6) {
			quest::say("The Irontoe Brigade was formed by Drumpy Irontoe. It was once the finest band of warriors in Kaladim. They were the elite branch of the Stormguard. King Kazon sent them on a mission to the lands of the Crushbone orcs. At the Battle of Busted Skull they met their fate.");
		}
		else {
			quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
		}
	}
	elsif ($text=~/battle of busted skull/i) {
		quest::say("The Battle of Busted Skull was fought in the land of the Crushbone orcs.  King Kazon sent the entire Irontoe Brigade to retrieve an ancient artifact from an old dwarven outpost.  The battle was fierce.  At its end, only a handful of Irontoes made it back.  After that, the Irontoe Brigade survivors left Kaladim for good.  All except Tumpy Irontoe.");
	}
	elsif ($text=~/tumpy/i) {
		quest::say("If you frequent the pubs, you just may run into Tumpy Irontoe.  He was once the brave leader of the Irontoe Brigade.  Whatever you do, do not mention to the Battle of Busted Skull.  I am sure that would bring back some bad memories for him.");
	}
	elsif ($text=~/crushbone orcs/i) {
		quest::say("The army of the Crushbone orcs is deadly indeed. They are great military strategists. It was a legion of them that brought down the great [Trondle Ogrebane]. Speak with Furtog Ogrebane about the Crushbones. He has need of warriors such as you.");
	}
	elsif ($text=~/trondle ogrebane/i) {
		quest::say("Trondle Ogrebane is the legendary dwarven warrior who single-handedly exterminated the ogre clan called the [Mudtoes]. He was recently killed in battle. It took an entire legion of Crushbone orcs to bring him down. Furtog is still fuming about that.");
	}
	elsif ($text=~/mudtoes/i) {
		quest::say("The Mudtoes were a small clan of ogres. They lived somewhere in the Butcherblock Mountains. They had an insatiable appetite for dwarves. They were finally destroyed by the hand of Trondle Ogrebane.");
	}
}

sub EVENT_ITEM {
	#:: Match two 13849 - Scarab Carapace and 5 gold
	if ($faction < 6 && plugin::takeItemsCoin(0,0,5,0, 13849 => 2)) {
		quest::say("Excellent. Here is your helm. Wear it with pride! And be sure to occasionally wipe out the insulating mucus that tends to build up on its underside. It will make your hair fall out. One more thing, would you be interested in [scarab boots] to match your helm?");
		#:: Give a 2175 - Small Scarab Helm
		quest::summonitem(12175); 
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(312, 2);			#:: + Storm Guard
		quest::faction(274, 1);			#:: + Kazon Stormhammer
		quest::faction(293, 1);			#:: + Miners Guild 249
		quest::faction(290, 1);			#:: + Merchants of Kaladim
		quest::faction(232, -1);		#:: - Craknek Warriors
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Match a 13132 - Cracked Giant Scarab Carapace, two 13848 - Scarab Legs, and 17 gold
	elsif ($faction < 6 && plugin::takeItemsCoin(0,0,17,0, 13132 => 1, 13848 => 2)) {
		quest::say("Very good! Let me see here. Thread the legs around like this and... There you go. Wear them with pride!");
		#:: Give a 2177 - Small Scarab Boots
		quest::summonitem(12177);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(312, 3);			#:: + Storm Guard
		quest::faction(274, 1);			#:: + Kazon Stormhammer
		quest::faction(293, 1);			#:: + Miners Guild 249
		quest::faction(290, 1);			#:: + Merchants of Kaladim
		quest::faction(232, -1);		#:: - Craknek Warriors
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Match a 13133 - Pristine Giant Scarab Carapace and 23 gold
	elsif ($faction < 5 && plugin::takeItemsCoin(0,0,23,0, 13133 => 1)) {
		quest::say("If I do say so myself, this is one of the finest breastplates in all of Norrath. I am truly a master at my craft. You might want to wipe out some of the excess scarab goo before wearing it, though.");
		#:: Give a 2176 - Small Scarab Breastplate
		quest::summonitem(12176); 
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(312, 5);			#:: + Storm Guard
		quest::faction(274, 1);			#:: + Kazon Stormhammer
		quest::faction(293, 1);			#:: + Miners Guild 249
		quest::faction(290, 1);			#:: + Merchants of Kaladim
		quest::faction(232, -1);		#:: - Craknek Warriors
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
