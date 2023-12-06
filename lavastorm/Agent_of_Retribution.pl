my $expedition_name = "Nagafen's Lair";
my $min_players     = 1;
my $max_players     = 72;
my $dz_zone         = "soldungb";
my $dz_version      = 0;
my $dz_duration     = 79200; # 22 hours


my $fabled_expedition_name = "Fabled Nagafen's Lair";
my $fabled_min_players     = 1;
my $fabled_max_players     = 18;
my $fabled_dz_zone         = "soldungb";
my $fabled_dz_version      = 1;
my $fabled_dz_duration     = 79200; # 22 hours

sub EVENT_SAY {
  $key = $client->AccountID() . "-kunark-flag";
  $expansion = quest::get_data($key);
  
  if ($text =~ /hail/i) {
    my $dz = $client->GetExpedition();
    if ($dz && $dz->GetName() eq $expedition_name) {
      quest::say("Tell me when you're [" . quest::saylink("ready") . "] to enter");
    }
    elsif ($dz && $dz->GetName() eq $fabled_expedition_name ) {
      quest::say("Tell me when you're [" . quest::saylink("ready to remember") . "], to enter");
    }
    else {
      quest::say("Would you like to [" . quest::saylink("request") . "] the expedition?");
	  if($expansion >=20) {
		quest::say("I also see you are prepared for something more. Would you like to [" . quest::saylink("fabled request") . "] the expedition?");
 	  }
    }
  }
  elsif ($text =~ /fabled request/i && $expansion >=20) {
    my $dz = $client->CreateExpedition($fabled_dz_zone, $fabled_dz_version, $fabled_dz_duration, $fabled_expedition_name, $fabled_min_players, $fabled_max_players);
    if ($dz) {
      $dz->SetCompass("lavastorm", 238.0, 987.0, -24.90); # pointing to guard pineshade
      $dz->SetSafeReturn("lavastorm",532, 964, 55.75, 484.0); # agent of ret
      $dz->SetZoneInLocation(-644.10,-1088.42, 26.75, 421.8); # bridge in crushbone
      $dz->AddReplayLockout(79200); # immediately add a 22 hour replay lockout on creation
      quest::say("Tell me when you're [" . quest::saylink("ready to remember") . "], to enter");
    }
  }
  elsif ($text =~ /request/i) {
    my $dz = $client->CreateExpedition($dz_zone, $dz_version, $dz_duration, $expedition_name, $min_players, $max_players);
    if ($dz) {
      $dz->SetCompass("lavastorm", 238.0, 987.0, -24.90); # pointing to guard pineshade
      $dz->SetSafeReturn("lavastorm",532, 964, 55.75, 484.0); # agent of ret
      $dz->SetZoneInLocation(-265, -413, -108.21, 260.8); # bridge in crushbone
      $dz->AddReplayLockout(79200); # immediately add a 22 hour replay lockout on creation
      quest::say("Tell me when you're [" . quest::saylink("ready") . "] to enter");
    }
  }
  
  elsif ($text =~ /ready/i) {
    $client->MovePCDynamicZone("soldungb");
  } 
  elsif ($text =~ /ready to remember/i) {
    $client->MovePCDynamicZone("soldungb",1);
  } 
}