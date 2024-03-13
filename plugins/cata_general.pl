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
        # Initially, consider all remaining value as potential change
        my $change_total = $remaining_value;

        # Break down the total change back into denominations, starting with the smallest
        my $change_copper = $change_total % 10;
        $change_total = int($change_total / 10);  # Remove the copper part from change total

        my $change_silver = $change_total % 10;
        $change_total = int($change_total / 10);  # Remove the silver part from change total

        my $change_gold = $change_total % 10;
        $change_platinum = int($change_total / 10);  # What's left is platinum

        # Now, calculate the actual spent amounts
        my %actual_spent = (
            copper   => $initial{copper} - ($initial{copper} >= $change_copper ? $change_copper : $initial{copper}),
            silver   => $initial{silver} - ($initial{silver} >= $change_silver ? $change_silver : $initial{silver}),
            gold     => $initial{gold} - ($initial{gold} >= $change_gold ? $change_gold : $initial{gold}),
            platinum => $initial{platinum} - ($initial{platinum} >= $change_platinum ? $change_platinum : $initial{platinum}),
        );

        # Construct and send the 'You give' message
        my $message = "You give ";
        my @messages;
        foreach my $currency (qw(platinum gold silver copper)) {
            push @messages, "$actual_spent{$currency} $currency" if $actual_spent{$currency} > 0;
        }
        $message .= join(' ', @messages) . " to " . $npc->GetCleanName() . ".";
        $client->Message(276, $message);

        # Inform the client of the change they receive, if any
        if ($change_copper > 0 || $change_silver > 0 || $change_gold > 0 || $change_platinum > 0) {
            my $change_message = "You receive ";
            my @change_parts;
            foreach my $currency (qw(copper silver gold platinum)) {
                my $change_amount = "change_$currency";
                push @change_parts, "$$change_amount $currency" if $$change_amount > 0;
            }
            $change_message .= join(' ', @change_parts) . " in change from " . $npc->GetCleanName() . ".";
            $client->Message(276, $change_message);
        }

        # Return the change back to the player's account if necessary
        $client->AddMoneyToPP($change_copper, $change_silver, $change_gold, $change_platinum, 1);
        
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