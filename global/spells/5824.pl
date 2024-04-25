# Bazaar Portal
sub EVENT_SPELL_EFFECT_CLIENT {
    my $client = plugin::val('$client');

    quest::debug("Cast Bazaar Portal");

    if ($zoneid != 151) {
        quest::debug("Not in Bazaar");
        $client->SetBucket("Return-X", $client->GetX());
        $client->SetBucket("Return-Y", $client->GetY());
        $client->SetBucket("Return-Z", $client->GetZ());
        $client->SetBucket("Return-H", $client->GetHeading());
        $client->SetBucket("Return-Zone", $zoneid);
        $client->SetBucket("Return-Instance", $instanceid);

        $client->MovePCInstance(151, 0, 185, -834, 4, -125);
    } else {
        quest::debug("We are in Bazaar");
        my $ReturnX = $client->GetBucket("Return-X");
        my $ReturnY = $client->GetBucket("Return-Y");
        my $ReturnZ = $client->GetBucket("Return-Z");
        my $ReturnH = $client->GetBucket("Return-H");
        my $ReturnZone = $client->GetBucket("Return-Zone");
        my $ReturnInstance = $client->GetBucket("Return-Instance");

        if (defined($ReturnX) && $ReturnX ne '' && 
            defined($ReturnY) && $ReturnY ne '' && 
            defined($ReturnZ) && $ReturnZ ne '' && 
            defined($ReturnH) && $ReturnH ne '' && 
            defined($ReturnZone) && $ReturnZone ne '') {
            quest::debug("Found a return location");

            $client->DeleteBucket("Return-X");
            $client->DeleteBucket("Return-Y");
            $client->DeleteBucket("Return-Z");
            $client->DeleteBucket("Return-H");
            $client->DeleteBucket("Return-Zone");
            $client->DeleteBucket("Return-Instance");            
        } else {            
            quest::debug("Returning to default location");

            $ReturnX = $client->GetBindX();
            $ReturnY = $client->GetBindY();
            $ReturnZ = $client->GetBindZ();
            $ReturnH = $client->GetBindHeading();
            $ReturnZone = $client->GetBindZoneID();
            $ReturnInstance = 0;          
        }

        $client->MovePCInstance($ReturnZone, $ReturnInstance, $ReturnX, $ReturnY, $ReturnZ, $ReturnH);
    }
}

