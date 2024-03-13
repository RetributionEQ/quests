sub EVENT_SPAWN {
  quest::settimer("appearance", 1);
}

sub EVENT_TIMER {
  quest::stoptimer("appearance");
  $npc->SetAppearance(1);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name! I can disenchant a piece of Apocryphal or Rose Colored for you, returning it to it's original state. Alas, I cannot restore any items which I have disenchanted!");

  }  
}

sub EVENT_ITEM {
  use Scalar::Util qw(looks_like_number);
  my %new_itemcount;
  foreach my $item (keys %itemcount) {  
    if ($item ne 'copper' && $item ne 'silver' && $item ne 'gold' && $item ne 'platinum') {
      if (looks_like_number($item)) {
        my $new_key = $item % 1000000;
        quest::debug("$new_key");
        $new_itemcount{$new_key} += $itemcount{$item};
      } else {       
        $new_itemcount{$item} = $itemcount{$item};
      }
    } else {      
      $new_itemcount{$item} = $itemcount{$item};
    }
  }

  quest::say("I have disenchanted these items for you...");
  plugin::return_items(\%new_itemcount);
}
