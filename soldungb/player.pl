sub EVENT_TARGET_CHANGE {
	if ($ulevel > 80) {
		if ($status < 80) {
			if ($client->GetTarget()->GetCleanName() eq "Lord Nagafen") {
				quest::ze(0, "I will not fight you, but I will banish you!");
				#:: Move the client to Lavastorm at the specified coordinates
				$client->MovePC(27, 485, 911, 55, 106);
			}
		}
	}
}
sub EVENT_ENTERZONE {
	
	# this is to detect if you are in the fabled zone when you shouldn't be. 
	# we have to get the expedition version number if your on one
	# and the zone version number. If the instanceid = 0, we are in the base zone
	# if the exp version is >0, we are in the fabled instance instead of the base one. 
	
	my $expedition = $client->GetExpedition();
	my $expversion = $expedition->GetZoneVersion();
	my $instanceid = $client->GetInstanceID();
	
	#$client->Message(7, "Test! 1234 instanceid .. $instanceid");
	
	#our instance is the base version of the zone, we don't care.
	if($instanceid<1){
		#$client->Message(7, "Kicking out as instance is less than 1");
		return;
	}
	#our expidition is not version 1 (fabled) so we don't care. 
	if($expversion<1) {
		#$client->Message(7, "Kicking out as exp version is less than 1");
		return;
	}

	$bind = $client->GetBindZoneID;
	$bindh = $client->GetBindHeading;
	$bindx = $client->GetBindX;
	$bindy = $client->GetBindY;
	$bindz = $client->GetBindZ;

	
	if ($expansion <20){ #Kunark
		$client->Message(7, "You don't belong here!");
		$client->MovePC($bind, $bindx, $bindy, $bindz, $bindh);
	 }

}