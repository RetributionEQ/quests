sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail. $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	}
	if ($text=~/mail/i) {
		quest::say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more central offices.  Are you [interested]?");
	}
	if ($text=~/interested/i) {
		quest::say("I have messages that need to go to - well, right now I have one that needs to go to Kelethin.  Will you [deliver to Kelethin]for me?");
	}
	if ($text=~/deliver to Kelethin/i) {
		quest::say("Take this letter to Jakum Webdancer in Kelethin.  You can find him at the bard guild hall.  I am sure he will compensate you for your troubles.");
		#:: Give a 18161 - A Bardic Letter (Kelethin)
		quest::summonitem(16390);
	}
}
