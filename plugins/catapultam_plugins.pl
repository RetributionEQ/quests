use JSON;

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

# Usage: WorldAnnounceItem($message, $item_id)
# Sends a world announcement and a Discord message for a given item.
# 
# Parameters:
#   $message  - The text that will be included in the announcement.
#               It can contain a placeholder "{item}" that will be replaced
#               with an in-game link in the world announcement, and with
#               a Discord link in the Discord announcement.
#   $item_id  - The ID of the item.
#
# The function constructs in-game and Discord links using quest::varlink and quest::getitemname.
# It then sends the world announcement using quest::we, and the Discord announcement using quest::discordsend.
#
# Example:
#   WorldAnnounceItem("{item} has been claimed!", 12345);
#   # World announcement: "[ItemLink] has been claimed!"
#   # Discord announcement: "[[ItemName](https://www.pyrelight.net/allaclone/?a=item&id=12345)] has been claimed!"
sub WorldAnnounceItem {
    my ($message, $item_id) = @_;
    my $itemname = quest::getitemname($item_id);

    my $eqgitem_link = quest::varlink($item_id);
    my $discord_link = "[[$itemname](https://www.pyrelight.net/allaclone/?a=item&id=$item_id)]";

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

sub SerializeHashComplex {
    my $hash_ref = shift;
    return encode_json($hash_ref);
}

sub DeserializeHashComplex {
    my $string = shift;

    # Check for an empty string and return an empty hash
    return {} if $string eq '';

    return decode_json($string);
}

sub GetRoman {
    my ($level) = @_;

    my %level_to_roman = (
        0  => " I",
        10 => " II",
        20 => " III",
        30 => " IV",
        40 => " V",
        50 => " VI",
        60 => " VII",
        70 => " VIII",
        80 => " IX",
        90 => " X",
    );

    my ($roman) = map { $level_to_roman{$_} } reverse sort grep { $level >= $_ } keys %level_to_roman;
    return $roman;
}