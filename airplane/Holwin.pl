sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Peace to you, $name.  I see that you have come far along the path of tranquility and enlightenment.  Do you wish to test yourself further, and perhaps complete the path you started on so long ago?");
	}
	if (plugin::HasClass("Monk")) {
		if ($text=~/tranquility and enlightenment/i) {
			quest::say("Choose you path. Wu or Ton Po");
		}
		elsif ($text=~/wu/i) {
			quest::say("I shall summon them for you");
			#:: Spawn The Plane of Sky >> Wu_the_Enlightened (71097), without grid or guild war, at the specified location
			quest::spawn2(71097, 0, 0, 660.0, 1332.3, -766.9, 189.9);
			#:: Depop with spawn timer active
			quest::depop_withtimer();
		}
		elsif ($text=~/ton po/i) {
			quest::say("I shall summon them for you");
			#:: Spawn The Plane of Sky >> Ton_Po (71096), without grid or guild war, at the specified location
			quest::spawn2(71096, 0, 0, 660.0, 1315.0, -766.9, 189.9);
			#:: Depop with spawn timer active
			quest::depop_withtimer();
		}
	}
}
