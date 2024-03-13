sub get_base_id {
	my $item_id = shift;
	$item_id = $item_id % 1000000;
	return $item_id
}

# plugin::check_handin($item1 => #required_amount,...);
# autoreturns extra unused items on success
sub check_handin {
    use Scalar::Util qw(looks_like_number);
    my $client     = plugin::val('client');
    my $copper     = plugin::val('copper') // 0;
    my $silver     = plugin::val('silver') // 0;
    my $gold       = plugin::val('gold') // 0;
    my $platinum   = plugin::val('platinum') // 0;
    my $hashref    = shift;

    my $return_copper   = 0;
    my $return_silver   = 0;
    my $return_gold     = 0;
    my $return_platinum = 0;

    if ($copper > 0) {
        $hashref->{"copper"} = $copper;
    }
    if ($silver > 0) {
        $hashref->{"silver"} = $silver;
    }
    if ($gold > 0) {
        $hashref->{"gold"} = $gold;
    }
    if ($platinum > 0) {
        $hashref->{"platinum"} = $platinum;
    }

	$client->SetEntityVariable("HANDIN_MONEY", "$copper|$silver|$gold|$platinum");

	# set money zero values if they don't exist
	my @money = ("platinum", "gold", "silver", "copper");
	foreach my $m (@money) {
		if (!$hashref->{$m}) {
			$hashref->{$m} = 0;
		}
	}

	# for some reason the source is sending this, we'll clean it up
	if ($hashref->{0}) {
		delete $hashref->{0};
	}

	if (!$client->EntityVariableExists("HANDIN_ITEMS")) {
		$client->SetEntityVariable("HANDIN_ITEMS", plugin::GetHandinItemsSerialized("Handin", %$hashref));
	}

	# Make a copy of the original hashref
    my $original_hashref = { %$hashref };

	quest::debug("ch check 1");

    # Iterate over the hashref and replace each key with its get_base_id(key) version
    foreach my $item (keys %$hashref) {
        my $base_id = get_base_id($item);  # Assuming get_base_id() returns original id if base id does not exist
        if ($base_id && $base_id ne $item) {  # Check if base ID is different from original
            $hashref->{$base_id} += $hashref->{$item} if exists $hashref->{$base_id};  # Add to existing base ID count
            $hashref->{$base_id} = $hashref->{$item} unless exists $hashref->{$base_id};  # Or create a new entry
            delete $hashref->{$item};  # Remove the original entry
        }
    }

	quest::debug("ch check 2");

	# -----------------------------
	# handin formatting examples
	# -----------------------------
	# item_id    => required_count eg (1001 => 1)
	# "copper"   => copper_amount  eg ("copper" => 1234)
	# "silver"   => silver_amount
	# "gold"     => gold_amount
	# "platinum" => platinum_amount
	# -----------------------------
	my %required = @_;
	my $retval = 1;
	foreach my $req (keys %required) {
		if (!defined $hashref->{$req} || $hashref->{$req} != $required{$req}) {
			$retval = 0;
		}
	}

	foreach my $req (keys %required) {
		if ($required{$req} < $hashref->{$req}) {
			$hashref->{$req} -= $required{$req};
		} else {
			delete $hashref->{$req};
		}
	}
	    
    if (!$retval) {  # Replace conditions_not_met with your actual condition
        %$hashref = %$original_hashref;  # Restore original hashref
        return 0;  # Return 0 as required
    }

	return $retval;
}

# plugin::check_handin($item1 => #required_amount,...);
# autoreturns extra unused items on success
sub check_handin_fixed {
	use Scalar::Util qw(looks_like_number);
    my $client     = plugin::val('client');
    my $copper     = plugin::val('copper');
    my $silver     = plugin::val('silver');
    my $gold       = plugin::val('gold');
    my $platinum   = plugin::val('platinum');
	my $hashref = shift;

	my $return_copper   = 0;
	my $return_silver   = 0;
	my $return_gold     = 0;
	my $return_platinum = 0;

	if ($copper > 0) {
		$hashref->{"copper"} = $copper;
	}
	if ($silver > 0) {
		$hashref->{"silver"} = $silver;
	}
	if ($gold > 0) {
		$hashref->{"gold"} = $gold;
	}
	if ($platinum > 0) {
		$hashref->{"platinum"} = $platinum;
	}

	$client->SetEntityVariable("HANDIN_MONEY", "$copper|$silver|$gold|$platinum");

	# set money zero values if they don't exist
	my @money = ("platinum", "gold", "silver", "copper");
	foreach my $m (@money) {
		if (!$hashref->{$m}) {
			$hashref->{$m} = 0;
		}
	}

	# for some reason the source is sending this, we'll clean it up
	if ($hashref->{0}) {
		delete $hashref->{0};
	}

	if (!$retval) {
		return 0;
	}

	if (!$client->EntityVariableExists("HANDIN_ITEMS")) {
		$client->SetEntityVariable("HANDIN_ITEMS", plugin::GetHandinItemsSerialized("Handin", %$hashref));
	}

	# -----------------------------
	# handin formatting examples
	# -----------------------------
	# item_id    => required_count eg (1001 => 1)
	# "copper"   => copper_amount  eg ("copper" => 1234)
	# "silver"   => silver_amount
	# "gold"     => gold_amount
	# "platinum" => platinum_amount
	# -----------------------------
	my %required = @_;
	my $retval = 1;
	foreach my $req (keys %required) {
		quest::debug("Req: $req");
		if (!defined $hashref->{$req} || $hashref->{$req} != $required{$req}) {
			$retval = 0;
		}
	}

	foreach my $req (keys %required) {
		if ($required{$req} < $hashref->{$req}) {
			$hashref->{$req} -= $required{$req};
		} else {
			delete $hashref->{$req};
		}
	}

	return $retval;
}

sub return_items {
	my $hashref = shift || plugin::var('$itemcount');
	my $client = plugin::val('$client');
	my $name = plugin::val('$name');
	my $items_returned = 0;

	# Ugly hack to put money into hashref like this method is otherwise expecting
	$hashref->{'copper'}		= plugin::val('copper');
    $hashref->{'silver'}     = plugin::val('silver');
    $hashref->{'gold'}       = plugin::val('gold');
    $hashref->{'platinum'}	= plugin::val('platinum');

	my %item_data = (
		0 => [ plugin::val('$item1'), plugin::val('$item1_charges'), plugin::val('$item1_attuned'), plugin::val('$item1_inst') ],
		1 => [ plugin::val('$item2'), plugin::val('$item2_charges'), plugin::val('$item2_attuned'), plugin::val('$item2_inst') ],
		2 => [ plugin::val('$item3'), plugin::val('$item3_charges'), plugin::val('$item3_attuned'), plugin::val('$item3_inst') ],
		3 => [ plugin::val('$item4'), plugin::val('$item4_charges'), plugin::val('$item4_attuned'), plugin::val('$item4_inst') ],
	);

	my %return_data = ();	

	foreach my $k (keys(%{$hashref})) {
		next if ($k eq "copper" || $k eq "silver" || $k eq "gold" || $k eq "platinum" || $k == 0);
		my $rcount = $hashref->{$k};
		my $r;
		for ($r = 0; $r < 4; $r++) {
			if ($rcount > 0 && $item_data{$r}[0] && $item_data{$r}[0] == $k) {
				if ($client) {
					my $inst = $item_data{$r}[3];
					my $return_count = $inst->RemoveTaskDeliveredItems();
					if ($return_count > 0) {
						quest::debug("(1) Returning $k, " . $inst->GetCharges() . " : " . $item_data{$r}[2]);
						$client->SummonFixedItem($k, $inst->GetCharges(), $item_data{$r}[2]);
						$return_data{$r} = [$k, $item_data{$r}[1], $item_data{$r}[2]];
						$items_returned = 1;
						next;
					}
					$return_data{$r} = [$k, $item_data{$r}[1], $item_data{$r}[2]];
					quest::debug("(2) Returning $k");
					$client->SummonFixedItem($k, $item_data{$r}[1], $item_data{$r}[2]);
					$items_returned = 1;
				} else {
					$return_data{$r} = [$k, $item_data{$r}[1], $item_data{$r}[2]];
					quest::debug("(3) Returning $k");
					quest::summonfixeditem($k, 0);
					$items_returned = 1;
				}
				$rcount--;
			}
		}

		delete $hashref->{$k};
	}

	# check if we have any money to return
	my @money = ("platinum", "gold", "silver", "copper");
	my $returned_money = 0;
	foreach my $m (@money) {
		if ($hashref->{$m} && $hashref->{$m} > 0) {
			$returned_money = 1;
		}
	}

	if ($returned_money) {
		my ($cp, $sp, $gp, $pp) = ($hashref->{"copper"}, $hashref->{"silver"}, $hashref->{"gold"}, $hashref->{"platinum"});
		$client->AddMoneyToPP($cp, $sp, $gp, $pp, 1);
		$client->SetEntityVariable("RETURN_MONEY", "$cp|$sp|$gp|$pp");
	}

	$client->SetEntityVariable("RETURN_ITEMS", plugin::GetHandinItemsSerialized("Return", %return_data));

	if ($items_returned || $returned_money) {
		quest::say("I have no need for this $name, you can have it back.");
	}

	quest::send_player_handin_event();

	# Return true if items were returned
	return ($items_returned || $returned_money);
}

sub return_bot_items {
	my $bot = plugin::val('bot');
	if (!$bot->GetOwner() || !$bot->GetOwner()->IsClient()) {
		return;
	}

	my $client = $bot->GetOwner()->CastToClient();
	my $hashref = plugin::var('itemcount');
	my $name = plugin::val('name');
	my $items_returned = 0;

	my %item_data = (
		0 => [ plugin::val('item1'), plugin::val('item1_charges'), plugin::val('item1_attuned'), plugin::val('item1_inst') ],
		1 => [ plugin::val('item2'), plugin::val('item2_charges'), plugin::val('item2_attuned'), plugin::val('item2_inst') ],
		2 => [ plugin::val('item3'), plugin::val('item3_charges'), plugin::val('item3_attuned'), plugin::val('item3_inst') ],
		3 => [ plugin::val('item4'), plugin::val('item4_charges'), plugin::val('item4_attuned'), plugin::val('item4_inst') ],
		4 => [ plugin::val('item5'), plugin::val('item5_charges'), plugin::val('item5_attuned'), plugin::val('item5_inst') ],
		5 => [ plugin::val('item6'), plugin::val('item6_charges'), plugin::val('item6_attuned'), plugin::val('item6_inst') ],
		6 => [ plugin::val('item7'), plugin::val('item7_charges'), plugin::val('item7_attuned'), plugin::val('item7_inst') ],
		7 => [ plugin::val('item8'), plugin::val('item8_charges'), plugin::val('item8_attuned'), plugin::val('item8_inst') ],
	);

	foreach my $k (keys(%{$hashref})) {
		next if ($k == 0);
		my $rcount = $hashref->{$k};
		my $r;
		for ($r = 0; $r < 8; $r++) {
			if ($rcount > 0 && $item_data{$r}[0] && $item_data{$r}[0] == $k) {
				if ($client) {
					# remove delivered task items from return for this slot
					my $inst = $item_data{$r}[3];
					my $return_count = $inst->RemoveTaskDeliveredItems();

					if ($return_count > 0) {
						quest::summonfixeditem($k);
						$items_returned = 1;
					}
				} else {
					quest::summonfixeditem($k);
					$items_returned = 1;
				}
				$rcount--;
			}
		}

		delete $hashref->{$k};
	}

	if ($items_returned) {
		$bot->OwnerMessage("I have no need for this $name, you can have it back.");
	}

	return $items_returned;
}

sub GetHandinItemsSerialized {
	my $type = shift;
	my %hash = @_;
	my @variables = ();

	my %item_data = (
		0 => [ plugin::val('$item1'), plugin::val('$item1_charges'), plugin::val('$item1_attuned'), plugin::val('$item1_inst') ],
		1 => [ plugin::val('$item2'), plugin::val('$item2_charges'), plugin::val('$item2_attuned'), plugin::val('$item2_inst') ],
		2 => [ plugin::val('$item3'), plugin::val('$item3_charges'), plugin::val('$item3_attuned'), plugin::val('$item3_inst') ],
		3 => [ plugin::val('$item4'), plugin::val('$item4_charges'), plugin::val('$item4_attuned'), plugin::val('$item4_inst') ],
	);

	my $hashref = plugin::var('$itemcount'); 

	if ($type eq "Handin") {
		foreach my $k (keys(%{$hashref})) {
			next if ($k eq "copper" || $k eq "silver" || $k eq "gold" || $k eq "platinum" || $k == 0);
			my $rcount = $hashref->{$k};
			for (my $r = 0; $r < 4; $r++) {
				if ($rcount > 0 && $item_data{$r}[0] && $item_data{$r}[0] == $k) {
					my $item_id = $item_data{$r}[0];
					my $item_charges = $item_data{$r}[1];
					my $item_attuned = $item_data{$r}[2];
					push(@variables, $item_id . "|" . $item_charges . "|" . $item_attuned);
				}
			}
		}
	} else {
		foreach my $key (keys %hash) {
			push(@variables, $hash{$key}[0] . "|" . $hash{$key}[1] . "|" . $hash{$key}[2]);
		}
	}

	return join(",", @variables);
}

sub mq_process_items {
	my $hashref = shift;
	my $npc = plugin::val('$npc');
	my $trade = undef;
	
	if ($npc->EntityVariableExists("_mq_trade")) {
		$trade = decode_eqemu_item_hash($npc->GetEntityVariable("_mq_trade")); 
	} else {
		$trade = {};
	}
	
	foreach my $k (keys(%{$hashref})) {
		next if ($k == 0);
		
		if (defined $trade->{$k}) {
			$trade->{$k} = $trade->{$k} + $hashref->{$k};
		} else {
			$trade->{$k} = $hashref->{$k};
		}
	}
	
	my $str = encode_eqemu_item_hash($trade);
	$npc->SetEntityVariable("_mq_trade", $str);
}

sub check_mq_handin {
	my %required = @_;
	my $npc = plugin::val('$npc');
	my $trade = undef;
	
	if ($npc->EntityVariableExists("_mq_trade")) {
		$trade = decode_eqemu_item_hash($npc->GetEntityVariable("_mq_trade"));
	} else {
		return 0;
	}
	
	foreach my $req (keys %required) {
		if ((!defined $trade->{$req}) || ($trade->{$req} < $required{$req})) {
			return 0;
		}
	}
	
	foreach my $req (keys %required) {
		if ($required{$req} < $trade->{$req}) {
			$trade->{$req} -= $required{$req};
		} else {
			delete $trade->{$req};
		}
	}
	
	$npc->SetEntityVariable("_mq_trade", encode_eqemu_item_hash($trade));
	return 1;
}

sub clear_mq_handin {
	my $npc = plugin::val('$npc');
	$npc->SetEntityVariable("_mq_trade", "");
}

sub encode_eqemu_item_hash {
	my $hashref = shift;
	my $str = "";
	my $i = 0;
	
	foreach my $k (keys(%{$hashref})) {
		if ($i != 0) {
			$str .= ",";
		} else {
			$i = 1;
		}
		
		$str .= $k;
		$str .= "=";
		$str .= $hashref->{$k};
	}
	
	return $str;
}

sub decode_eqemu_item_hash {
	my $str = shift;
	my $hashref = { };
	
	my @vals = split(/,/, $str);
	my $val_len = @vals;
	for(my $i = 0; $i < $val_len; $i++) {
		my @subval = split(/=/, $vals[$i]);
		my $subval_len = @subval;
		if ($subval_len == 2) {
			my $key = $subval[0];
			my $value = $subval[1];
			
			$hashref->{$key} = $value;
		}
	}
	
	return $hashref;
}