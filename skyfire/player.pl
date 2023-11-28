
sub EVENT_CLICKDOOR {
  if($doorid == 135) {
    if (plugin::is_stage_complete($client, 'PoP')) {
      quest::movepc(108,1682,41,25.9); # Zone: veeshan
    } else {
      $client->Message(4, "You are not yet ready to experience this memory.");
    }
  }
}
