my $eom_id = 6;
my $eom_item_id = 46779;
my $eom_log = "total-eom-spend";

sub CheckWorldWideBuffs {
    my $client = plugin::val('$client');
    DoCheckWorldWideBuffs($client);

    if ($client->GetPet()) {
        DoCheckWorldWideBuffs($client->GetPet());
    }
}

sub DoCheckWorldWideBuffs {
    my $target = shift;
    if($target && $target->IsClient() || ($target->IsPet() && $target->HasOwner() && $target->GetOwner()->IsClient())) {
        for my $spell_id (43002..43008, 17779) {
            my $data = quest::get_data("eom_$spell_id");

            if ($data) {               
                $target->ApplySpellBuff($spell_id, quest::get_data_remaining("eom_$spell_id")/6);                
            } else {
                $target->BuffFadeBySpellID($spell_id);
            }
        }
    }
}

# Spend EOM. Returns true on success, false on failure
# usage: plugin::SpendEOM($client, $amount)
sub SpendEOM {
    my ($client, $amount) = @_;
    my $eom_available = $client->GetAlternateCurrencyValue($eom_id);

    if ($amount == 0) {
        return 1;
    }

    if ($eom_available >= $amount) {
        $client->SetAlternateCurrencyValue($eom_id, $eom_available - $amount);
        $client->Message(15, "You have spent $amount [".quest::varlink($eom_item_id)."].");
        if (!$client->GetGM()) {
            quest::set_data($eom_log, (quest::get_data($eom_log) || 0) + $amount);
        }
        return 1;
    }

    return 0;
}

sub RefundEOM {
    my ($client, $amount) = @_;
    my $eom_available = $client->GetAlternateCurrencyValue($eom_id);
    $client->SetAlternateCurrencyValue($eom_id, $eom_available + $amount);
    $client->Message(15, "You have gained $amount [".quest::varlink($eom_item_id)."].");
    if (!$client->GetGM()) {
        quest::set_data($eom_log, (quest::get_data($eom_log) || 0) - $amount);
    }
}

sub GetEOM {
    my ($client) = @_;

    return $client->GetAlternateCurrencyValue($eom_id);
}

sub EOMLink {
    return quest::varlink($eom_item_id);
}

sub ApplyWorldWideBuff {
    my $buff_id = shift;
    my $cost = shift || 0;

    my $client = plugin::val('$client');

    if (!defined($buff_id)) {
        quest::debug("ERROR: NO VALID BUFF ID IN ApplyWorldWideBuff")
    }

    if (plugin::SpendEOM($client, $cost)) {        
        my %buff_types = (
            43002 => "Experience Gain",
            43003 => "Hit Points and Armor Class",
            43004 => "Basic Statistics",
            43005 => "Movement Speed",
            43006 => "Mana Regeneration",
            43007 => "Attack Speed",
            43008 => "Health Regeneration",
            17779 => "Loot Upgrade Rate"
        );
        my $buff_type = $buff_types{$buff_id} // "Unknown Buff";  # Fallback for unknown buff IDs

        if ($cost == 0) { $cost = 1 };

        if (quest::get_data("eom_$buff_id")) {            
            quest::set_data("eom_$buff_id", $cost, quest::get_data_remaining("eom_$buff_id") + (4 * 60 * 60));
            my ($hours, $minutes, $seconds) = plugin::convert_seconds(quest::get_data_remaining("eom_$buff_id"));
            plugin::WorldAnnounce($client->GetCleanName() . " has used their Echo of Memory to extend your enhanced $buff_type. This buff will endure for $hours Hours and $minutes Minutes.");
        } else {
            quest::set_data("eom_$buff_id", $cost, H4);
            plugin::WorldAnnounce($client->GetCleanName() . " has used their Echo of Memory to enhance your $buff_type. This buff will endure for 4 Hours.");
        }
        
        if (!$skip_payment) { quest::worldwidesignalclient($buff_id); }
        return 1;
    } else {
        return 0;
    }
}