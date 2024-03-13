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

	my %item_data = (
		0 => [ plugin::val('$item1'), plugin::val('$item1_charges'), plugin::val('$item1_attuned'), plugin::val('$item1_inst') ],
		1 => [ plugin::val('$item2'), plugin::val('$item2_charges'), plugin::val('$item2_attuned'), plugin::val('$item2_inst') ],
		2 => [ plugin::val('$item3'), plugin::val('$item3_charges'), plugin::val('$item3_attuned'), plugin::val('$item3_inst') ],
		3 => [ plugin::val('$item4'), plugin::val('$item4_charges'), plugin::val('$item4_attuned'), plugin::val('$item4_inst') ],
	);

	foreach my $k (keys %itemcount) {
		next if ($k eq "copper" || $k eq "silver" || $k eq "gold" || $k eq "platinum" || $k == 0);
		my $rcount = $itemcount->{$k};
		my $r;
    quest::debug($k);
    $k = $k % 1000000;
    quest::debug($k);
		for ($r = 0; $r < 4; $r++) {
			if ($rcount > 0 && $item_data{$r}[0] && $item_data{$r}[0] == $k) {
				if ($client) {
					my $inst = $item_data{$r}[3];
					my $return_count = $inst->RemoveTaskDeliveredItems();
					if ($return_count > 0) {						
						$client->SummonFixedItem($k, $inst->GetCharges(), $item_data{$r}[2]);
						$return_data{$r} = [$k, $item_data{$r}[1], $item_data{$r}[2]];
						$items_returned = 1;
						next;
					}
					$return_data{$r} = [$k, $item_data{$r}[1], $item_data{$r}[2]];					
					$client->SummonFixedItem($k, $item_data{$r}[1], $item_data{$r}[2]);
					$items_returned = 1;
				} else {
					$return_data{$r} = [$k, $item_data{$r}[1], $item_data{$r}[2]];					
					quest::summonfixeditem($k, 0);
					$items_returned = 1;
				}
				$rcount--;
			}
		}

		delete $itemcount->{$k};
	}

  quest::say("I have disenchanted these items for you...");
}
