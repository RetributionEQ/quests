#!/usr/bin/perl

sub soulbinder_say {
	my $text = shift;
	my $client = plugin::val('$client');
	my $name = $client->GetName();
	my $color = 4; # Light Blue

	if ($text=~/hail/i) {
		quest::say("Greetings, ${name}. When a hero of our world is slain, their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity, it is my duty to [bind your soul] to this location if that is your wish. I can also return you to [your Bind Point] or [The Bazaar], should you so wish.");
	} elsif ($text=~/bind your soul/i || $text=~/bind my soul/i) {
		quest::doanim(42);
		quest::selfcast(2049);
		$client->Message($color, "You feel yourself bind to the area.");
	} elsif ($text=~/your Bind Point/i || $text=~/my Bind Point/i) {
		quest::say("Off you go!");
		quest::selfcast(36);
	} elsif ($text=~/the Bazaar/i) {
		quest::say("Off you go!");
		quest::selfcast(5824);
	}
}
