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
    my ($target_value, $copper, $silver, $gold, $platinum) = @_;
    my $remaining_value = ($platinum * 1000) + ($gold * 100) + ($silver * 10) + $copper - $target_value;

    if ($remaining_value >= 0) {
        $client->TakeMoneyFromPP($target_value, 1);
    }
}