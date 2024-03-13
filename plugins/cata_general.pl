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
    my $total_value = $initial_platinum * 1000 + $initial_gold * 100 + $initial_silver * 10 + $initial_copper;
    my $remaining_value = $total_value - $target_value;

    if ($remaining_value >= 0) {
        my ($return_platinum, $return_gold, $return_silver, $return_copper) = (
            int($remaining_value / 1000),
            int(($remaining_value % 1000) / 100),
            int(($remaining_value % 100) / 10),
            $remaining_value % 10
        );

        my %spent = (
            platinum => $initial_platinum   - $return_platinum,
            gold     => $initial_gold       - $return_gold,
            silver   => $initial_silver     - $return_silver,
            copper   => $initial_copper     - $return_copper,
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
        $client->Message(276, "You do not have enough money. Please try again.");
        return 0;
    }
}