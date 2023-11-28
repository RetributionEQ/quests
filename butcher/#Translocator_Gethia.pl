# Translocator_Gethia.pl
# Zone: butcher

sub EVENT_SAY { 
   if ($text =~ /Hail/i) {
      quest::say("Hello there, $name. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [" . quest::saylink("travel to the Timorous Deep") . "] in the meantime, I can transport you to my companion there.");
   }

   
   if ($text =~ /timorous deep/i) {
      if (plugin::is_stage_complete($client, 'RoK')) {
         quest::say("Off you go!");
         quest::movepc(96, -3260.10, -4544.56, 19.47); # Zone: timorous
      } else {
         quest::say("That's odd! The translocation magic won't take hold on you. I'll see if I can figure this out, try to come back later.");
         $client->Message(4, "You are not yet ready to experience this memory.");
      }
   }
}