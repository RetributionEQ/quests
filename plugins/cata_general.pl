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

    quest::debug("total_value: $total_value");

    if ($remaining_value >= 0 && $target_value > 0) {
        # Calculate the change to give back as well as the actual amounts spent        
        my $change_platinum = int($remaining_value / 1000);
        $remaining_value %= 1000;

        my $change_gold = int($remaining_value / 100);
        $remaining_value %= 100;

        my $change_silver = int($remaining_value / 10);
        my $change_copper = $remaining_value % 10;

        my %actual_spent = (
            platinum => $initial{platinum} - $change_platinum,
            gold     => $initial{gold} - $change_gold,
            silver   => $initial{silver} - $change_silver,
            copper   => $initial{copper} - $change_copper,
        );

        my $message = "You give ";
        my @messages;
        foreach my $currency (qw(platinum gold silver copper)) {
            push @messages, "$actual_spent{$currency} $currency" if $actual_spent{$currency} > 0;
        }
        $message .= join(' ', @messages) . " to " . $npc->GetCleanName() . ".";
        $client->Message(276, $message);

        # Inform the client of the change they receive, if any
        if ($change_platinum > 0 || $change_gold > 0 || $change_silver > 0 || $change_copper > 0) {
            my $change_message = "You receive ";
            my @change_parts;
            foreach my $currency (['platinum', $change_platinum], ['gold', $change_gold], ['silver', $change_silver], ['copper', $change_copper]) {
                push @change_parts, "$currency->[1] $currency->[0]" if ($currency->[1] > 0);
            }
            $change_message .= join(' ', @change_parts) . " in change from " . $npc->GetCleanName() . ".";
            $client->Message(276, $change_message);
        }

        # Provide the change back to the player's account
        $client->AddMoneyToPP($change_copper, $change_silver, $change_gold, $change_platinum, 1);
        
        my $change_value = $change_platinum * 1000 + $change_gold * 100 + $change_silver * 10 + $change_copper;
        quest::debug("change_value: $change_value");

        return 1;
    } elsif ($total_value > 0) {
        # Refund all the money since the target value was not met
        $client->AddMoneyToPP($initial{copper}, $initial{silver}, $initial{gold}, $initial{platinum}, 1);
        my $refund_message = "You have been refunded ";
        my @refund_parts;
        foreach my $currency (qw(platinum gold silver copper)) {
            push @refund_parts, "$initial{$currency} $currency" if ($initial{$currency} > 0);
        }
        $refund_message .= join(' ', @refund_parts) . ".";
        $client->Message(276, $refund_message);
        return 0;
    }
}

sub GetAccountKey
{
    my $client = shift || plugin::val('$client');

    if ($client) {
        return "account-" . $client->AccountID() . "-";
    }
}

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

sub NPCTell {	
	my $npc = plugin::val('npc');
    my $client = plugin::val('client');
	my $message = shift;

	my $NPCName = $npc->GetCleanName();
    my $tellColor = 257;
	
    $client->Message($tellColor, "$NPCName tells you, '" . $message . "'");
}

sub YellowText {
	my $message     = shift;
    my $client      = shift || plugin::val('client');
    my $tellColor   = 335;
	
    $client->Message($tellColor, $message);
}

sub BlueText {
	my $message     = shift;
    my $client      = shift || plugin::val('client');
    my $tellColor   = 263;
	
    $client->Message($tellColor, $message);
}

sub RedText {
	my $message     = shift;
    my $client      = shift || plugin::val('client');
    my $tellColor   = 287;
	
    $client->Message($tellColor, $message);
}

sub PurpleText {
	my $message     = shift;
    my $client      = shift || plugin::val('client');
    my $tellColor   = 257;
	
    $client->Message($tellColor, $message);
}

sub WorldAnnounce {
	my $message = shift;
	quest::discordsend("ooc", $message);
	quest::we(335, $message);
}

sub convert_seconds {
    my ($seconds) = @_;

    my $hours = int($seconds / 3600);
    $seconds %= 3600;
    my $minutes = int($seconds / 60);
    $seconds %= 60;

    return ($hours, $minutes, $seconds);
}

# TODO - UPDATE THIS URL WHEN OUR ALLACLONE IS UP
sub WorldAnnounceItem {
    my ($message, $item_id) = @_;
    my $itemname = quest::getitemname($item_id);

    my $eqgitem_link = quest::varlink($item_id);
    my $discord_link = "[[$itemname](https://retributioneq.com/allaclone/?a=item&id=$item_id)]";

    # Replace a placeholder in the message with the EQ game link
    $message =~ s/\{item\}/$eqgitem_link/g;

    # Send the message with the game link to the EQ world
    quest::we(335, $message);

    # Replace the game link with the Discord link
    $message =~ s/\Q$eqgitem_link\E/$discord_link/g;

    # Send the message with the Discord link to Discord
    quest::discordsend("ooc", $message);
}

# Serializer
sub SerializeList {
    my @list = @_;
    return join(',', @list);
}

# Deserializer
sub DeserializeList {
    my $string = shift;
    return split(',', $string);
}

# Serializer
sub SerializeHash {
    my %hash = @_;
    return join(';', map { "$_=$hash{$_}" } keys %hash);
}

# Deserializer
sub DeserializeHash {
    my $string = shift;
    my %hash = map { split('=', $_, 2) } split(';', $string);
    return %hash;
}

sub num2en {
    my $number = shift;

    return "zero" if $number == 0; # Handle 0 explicitly
    return "one thousand" if $number == 1000; # Special case for 1000

    my %map = (
        1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
        6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",
        11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
        15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen",
    );

    my %tens_map = (
        2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
        6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety",
    );

    my $word = '';

    if ($number >= 100) {
        my $hundreds = int($number / 100);
        $word .= $map{$hundreds} . " hundred";
        $number %= 100; # Reduce number to remainder for further processing
        $word .= " and " if $number > 0; # Add 'and' if there's more to come
    }

    if ($number >= 20) {
        my $tens = int($number / 10);
        $word .= $tens_map{$tens};
        $number %= 10; # Reduce number to remainder for ones place
        $word .= "-" if $number > 0; # Add hyphen for numbers like "twenty-one"
    }

    $word .= $map{$number} if $number > 0 && exists $map{$number};

    return $word;
}