#Used for Bic
sub ClassType {
    my $client = plugin::val('$client');
    my $class  = $client->GetClass();

    my %melee_classes = map { $_ => 1 } (1, 7, 9, 16);
    my %caster_classes = map { $_ => 1 } (11, 12, 13, 14);
    my %priest_classes = map { $_ => 1 } (2, 6, 10);

    if (exists $melee_classes{$class}) {
        return "melee";
    }

    if (exists $caster_classes{$class}) {
        return "caster";
    }

    if (exists $priest_classes{$class}) {
        return "priest";
    }

    return "hybrid";
}

#Usage: plugin::CheckCashPayment(target_val_in_copper, $copper, $silver, $gold, $platinum)
# Returns false if insufficient payment
# Returns true if sufficient payment
# Handles change, refunds, etc.
sub CheckCashPayment {
    my $client = plugin::val('$client');
    my $npc    = plugin::val('$npc');
    my ($target_value, $initial_copper, $initial_silver, $initial_gold, $initial_platinum) = @_;

    # Use a hash to store initial currency amounts for easier handling
    my %initial = (
        copper   => $initial_copper,
        silver   => $initial_silver,
        gold     => $initial_gold,
        platinum => $initial_platinum,
    );

    my $total_value = $initial{platinum} * 1000 + $initial{gold} * 100 + $initial{silver} * 10 + $initial{copper};
    my $remaining_value = $total_value - $target_value;

    if ($remaining_value >= 0) {
        # Calculate how much of each currency is needed to meet the target value
        # Start by converting everything to copper for comparison
        my $total_copper = $initial{copper} + ($initial{silver} * 10) + ($initial{gold} * 100) + ($initial{platinum} * 1000);
        
        # Determine how much of each currency is spent to meet the target
        my $spent_copper = $target_value % 10;
        my $spent_silver = int(($target_value % 100) / 10);
        my $spent_gold = int(($target_value % 1000) / 100);
        my $spent_platinum = int($target_value / 1000);

        # Update the total target value to include full coins only
        my $adjusted_target = ($spent_platinum * 1000) + ($spent_gold * 100) + ($spent_silver * 10) + $spent_copper;

        # Calculate remaining values after spending towards the target
        my $remaining_copper_after_target = $total_copper - $adjusted_target;

        # Calculate actual remaining currency by converting remaining copper back to denominations
        my $actual_remaining_platinum = int($remaining_copper_after_target / 1000);
        $remaining_copper_after_target %= 1000;
        my $actual_remaining_gold = int($remaining_copper_after_target / 100);
        $remaining_copper_after_target %= 100;
        my $actual_remaining_silver = int($remaining_copper_after_target / 10);
        my $actual_remaining_copper = $remaining_copper_after_target % 10;

        # Determine actual spent amounts in each currency
        my %actual_spent = (
            platinum => $initial{platinum} - $actual_remaining_platinum,
            gold     => $initial{gold} - $actual_remaining_gold,
            silver   => $initial{silver} - $actual_remaining_silver,
            copper   => $initial{copper} - $actual_remaining_copper,
        );

        my $message = "You give ";
        my @messages;
        foreach my $currency (qw(platinum gold silver copper)) {
            push @messages, "$actual_spent{$currency} $currency" if $actual_spent{$currency} > 0;
        }
        $message .= join(' ', @messages) . " to " . $npc->GetCleanName() . ".";
        $client->Message(276, $message);

        # Construct and send the change message if there is remaining value
        if ($remaining_copper_after_target > 0) {
            my $change_message = "You receive ";
            my @change_parts;
            foreach my $currency (['platinum', $actual_remaining_platinum], ['gold', $actual_remaining_gold], ['silver', $actual_remaining_silver], ['copper', $actual_remaining_copper]) {
                push @change_parts, "$currency->[1] $currency->[0]" if ($currency->[1] > 0);
            }
            $change_message .= join(' ', @change_parts) . " in change from " . $npc->GetCleanName() . ".";
            $client->Message(276, $change_message);
        }

        # Provide the change back to the player's account
        $client->AddMoneyToPP($actual_remaining_copper, $actual_remaining_silver, $actual_remaining_gold, $actual_remaining_platinum, 1);

        return 1;
    } else {
        # Refund all the money since the target value was not met
        $client->AddMoneyToPP($initial{copper}, $initial{silver}, $initial{gold}, $initial{platinum}, 1);
        my $refund_message = "Transaction failed. You have been refunded ";
        my @refund_parts;
        foreach my $currency (qw(platinum gold silver copper)) {
            push @refund_parts, "$initial{$currency} $currency" if ($initial{$currency} > 0);
        }
        $refund_message .= join(' ', @refund_parts) . ".";
        $client->Message(276, $refund_message);
        return 0;
    }
}