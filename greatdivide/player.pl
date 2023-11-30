sub EVENT_ENTERZONE {
$key = $client->AccountID() . "-kunark-flag";
$expansion = quest::get_data($key);

$bind = $client->GetBindZoneID;
$bindh = $client->GetBindHeading;
$bindx = $client->GetBindX;
$bindy = $client->GetBindY;
$bindz = $client->GetBindZ;

if ($expansion < 6){ #Velious
    $client->Message(7, "You don't belong here!");
    $client->MovePC($bind, $bindx, $bindy, $bindz, $bindh);
  }

}

