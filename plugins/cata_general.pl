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

sub CheckCashPayment {
    my $client = plugin::val('$client');
    my $npc    = plugin::val('$npc');
    my ($target_value, $initial_copper, $initial_silver, $initial_gold, $initial_platinum) = @_;

    # Use a hash to store initial currency amounts
    my %initial = (
        copper   => $initial_copper,
        silver   => $initial_silver,
        gold     => $initial_gold,
        platinum => $initial_platinum,
    );

    my $total_value = $initial{platinum} * 1000 + $initial{gold} * 100 + $initial{silver} * 10 + $initial{copper};
    my $remaining_value = $total_value - $target_value;

    if ($remaining_value >= 0) {
        my ($return_platinum, $return_gold, $return_silver, $return_copper) = (
            int($remaining_value / 1000),
            int(($remaining_value % 1000) / 100),
            int(($remaining_value % 100) / 10),
            $remaining_value % 10
        );

        my %spent = (
            platinum => $initial_platinum - $return_platinum,
            gold     => $initial_gold - $return_gold,
            silver   => $initial_silver - $return_silver,
            copper   => $initial_copper - $return_copper,
        );

        my $message = "You give ";
        my @messages;
        foreach my $currency (qw(platinum gold silver copper)) {
            push @messages, "$spent{$currency} $currency" if $spent{$currency} > 0;
        }

        $message .= join(' ', @messages) . " to " . $npc->GetCleanName() . ".";

        $client->AddMoneyToPP($return_copper, $return_silver, $return_gold, $return_platinum, 1);
        $client->Message(276, $message);
        return 1;
    } else {
        # Return all the money since the target value was not met
        $client->AddMoneyToPP($initial{copper}, $initial{silver}, $initial{gold}, $initial{platinum}, 1);
        my $message = "Transaction failed. You have been refunded ";
        my @refund_messages;
        foreach my $currency (qw(platinum gold silver copper)) {
            push @refund_messages, "$initial{$currency} $currency" if ($initial{$currency} > 0);
        }
        $message .= join(' ', @refund_messages) . ".";
        $client->Message(276, $message);
        return 0;
    }
}