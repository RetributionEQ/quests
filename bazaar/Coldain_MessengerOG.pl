
sub EVENT_SAY {

$key = $client->AccountID() . "-kunark-flag";
$expansion = quest::get_data($key);

$nagkey = $client->AccountID() . "nag";
$voxkey = $client->AccountID() . "vox";

  if ($text=~/hail/i){

    if($expansion < 6){
    quest::say("Ah... I see you have yet to unlock Velious! You have two options. One is the route of the [hero]. The other, is the route of the [collector].");
    }
    if ($expansion >= 6)
  {
    quest::say("You have already unlocked Velious!");
  }
  }

   if (($text =~/hero/i) && ($expansion <6)){
    quest::say("Find my missing brothers. The last I heard of them, they were studying the dragons of Kunark.");
  }
  if (($text =~/collector/i) && ($expansion <6)){
    quest::say("You are one of patience, I see. All you need to do is bring me an Apocryphal Mask of Secrets, an Apocryphal Sebilite Scale Mask, an Apocryphal Helot Skull Helm, and an Apocryphal Helm of the Rile");
  }
    }

    sub EVENT_ITEM {
$key = $client->AccountID() . "-kunark-flag";
$expansion = quest::get_data($key);

$nagkey = $client->AccountID() . "nag";
$voxkey = $client->AccountID() . "vox";

      if ($expansion < 6){
    if (plugin::takeItems(85772 => 1, 83201 => 1, 81414 => 1, 84578 =>1)) {
		quest::say("Here are three tokens. Hand them back to me for your flag!");
    quest::summonfixeditem(99101);
    quest::summonfixeditem(99101);
    quest::summonfixeditem(99101);

		quest::ding();
		quest::exp(1000000);
    }
    if (plugin::takeItems(99101 => 1)){
		quest::say("Beware of the evils that lurk Velious $name!");
    quest::ding();
    quest::set_data($key, 6);
    quest::set_data($gorenkey, 1);
    quest::set_data($sevkey, 1);
    quest::set_data($talkey, 1);
    }
	#:: Return unused items
	      plugin::returnUnusedItems();
       

}
    }
  
  
  #  quest::set_data($nagkey, 1);
  #quest::say("I am but one half. In death, I am warm. In death, she is cold. Oh how I miss spending evenings in Cabilis with you, my love.");
  #$client->Message(4, "You have gained an expansion flag!");
  #quest::set_data($key, quest::get_data($key) + 1);
  #}
#else
#{
 # quest::say("I have already given you my blessing! Would you like to check your [expansions] unlocked?");
#}

#}



 #if (($text =~ /Expansions/i) && ($expansion == 0)) {
  #quest::say("You don't have any expansions unlocked!");
 #}

# if (($text =~ /Expansions/i) && ($expansion == 1)) {
 # quest::say("You don't have any expansions unlocked!");
 #}

# if (($text =~ /Expansions/i) && ($expansion >= 2)) {
 # quest::say("Expansions Unlocked: Kunark");
 #}
  #if (($text =~ /Expansions/i) && ($expansion >= 6)) {
  #quest::say("Expansions Unlocked: Velious");
 #}
  #if (($text =~ /Expansions/i) && ($expansion >= 14)) {
  #quest::say("Expansions Unlocked: Luclin");
 #}
 # if (($text =~ /Expansions/i) && ($expansion >= 19 )) {
  #quest::say("Expansions Unlocked: Planes of Power/Legacy of Ykesha");
 #}


#}
