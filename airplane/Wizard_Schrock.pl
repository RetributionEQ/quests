sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. Do you believe that you are a [great Wizard]?");
	}
	if ($text=~/great wizard/i) {
		quest::say("I will not take your word for it! You must prove your greatness to my apprentices. Do you wish to be tested by Neasin or by Abec?");
	}
	if (plugin::HasClass("Wizard")) {
		if ($text=~/neasin/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Neasin_Leornic (71092), without grid or guild war, at the specified location
			quest::spawn2(71092, 0, 0, 585, 1304.3, -766.9, 0.1);
			#:: Depop with spawn timer active
			quest::depop_withtimer();
		}
  		elsif ($text=~/abec/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Abec_Ianor (71079), without grid or guild war, at the specified location
			quest::spawn2(71079, 0, 0, 585, 1304.3, -766.9, 0.1);
			#:: Depop with spawn timer active
			quest::depop_withtimer();
		}
	}
}
