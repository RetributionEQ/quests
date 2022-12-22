sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name! I can disenchant a piece of Apocryphal or Rose Colored for you, returning it to it's original state. Please, only hand one item in at a time! And no, I will not undo the magic once it is done!");
  }  
}

sub EVENT_ITEM {

$rcmath = $item1 - 70000;
$apocmath = $item1 - 80000;
$rcmath2 = $item1 - 700000;
$apocmath2 = $item1 - 800000;

	if($item1 > 71000 && $item1 < 81000 && plugin::takeItems($item1 => 1)) { #Rose Colored Range 1
		quest::summonfixeditem($rcmath);
		
		quest::say("Feh, that item wasn’t very good anyways!");
	}

	if($item1 > 81000 && $item1 < 91000 && plugin::takeItems($item1 => 1)) { #Apoc Range 1
		quest::summonfixeditem($apocmath);
		
		quest::say("Feh, that item wasn’t very good anyways!");
	}

	if($item1 > 710000 && $item1 < 769989 && plugin::takeItems($item1 => 1)) { #Rose Colored Range 2
		quest::summonfixeditem($rcmath2);
		
		quest::say("Feh, that item wasn’t very good anyways!");
	}

	if($item1 > 810000 && $item1 < 869989 && plugin::takeItems($item1 => 1)) { #Apoc Range 2
		quest::summonfixeditem($apocmath2);
		
		quest::say("Feh, that item wasn’t very good anyways!");
	}
plugin::return_items(\%itemcount);
}





