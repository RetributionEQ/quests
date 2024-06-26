# Necromancer Epic NPC -- Drendico_Metalbones

# items: 18086, 1278, 20656, 20655, 20653
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("The hills ears keep spinning the wonders of wells. Twisting twisting fly in water scar hot horses. Teach me! Bring floating water islands of doom!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20648 => 1)) {
    quest::emote("says, 'Seek, search, turn, twist! Kazen hopes to death master truly! Read out, read in between! Talk to the pretty clouds.' Drendico turns his back to you and throws a book over his shoulder. 'Bring back book! Bring back reagents three!!' He shouts as he mumbles some more gibberish.");
    quest::ding();
    quest::exp(1000);
    quest::summonitem(18086);
  }
  if(plugin::check_handin(\%itemcount, 1278 => 1, 20656 => 1, 20655 => 1, 18086 => 1)) {
    quest::emote("turns to you in amazement. 'You actually did it! These are the correct components! Kazen will be most pleased. I searched the planes for almost a year and could not find all the correct components.' Drendico fiddles with the components, puts them into a box and hands it to you. 'You must have access to an army, $name. Return the components to Kazen quickly!");
    quest::summonitem(20653);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE  Quest by: Solid11  Zone:timorous  ID:96034 -- Drendico_Metalbones