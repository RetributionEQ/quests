
sub EVENT_SAY {

$key = $client->AccountID() . "-kunark-flag";
$expansion = quest::get_data($key);

$nagkey = $client->AccountID() . "nag";
$voxkey = $client->AccountID() . "vox";

  if ($text=~/hail/i){

    if($expansion < 2){
    quest::say("Ah... I see you have yet to unlock Kunark! You have two options. One is the route of the [hero]. The other, is the route of the [collector].");
    }
    if ($expansion >= 2)
  {
    quest::say("You have already unlocked the Ruins of Kunark!");
  }
  }

   if (($text =~/hero/i) && ($expansion <2)){
    quest::say("You enjoy spilling blood, don't you? Fair enough! Find the Lost Iksars of Fire and Ice.");
  }
  if (($text =~/collector/i) && ($expansion <2)){
    quest::say("You are one of patience, I see. All you need to do is bring me an Apocryphal Elemental Binder, an Apocryphal Djarn's Amethyst Ring, an Apocryphal Crown of the Froglok Kings, and an Apocryphal Scalp of the Ghoul Lord");
  }
  
    }

    sub EVENT_ITEM {
$key = $client->AccountID() . "-kunark-flag";
$expansion = quest::get_data($key);

$nagkey = $client->AccountID() . "nag";
$voxkey = $client->AccountID() . "vox";

      if ($expansion < 2){
    if (plugin::takeItems(828043 => 1, 810366 => 1, 810142 => 1, 826997 =>1)) {
		quest::say("Here are three tokens. Hand them back to me for your flag!");
		quest::ding();
		quest::exp(100000);
    quest::summonfixeditem(99100);
    quest::summonfixeditem(99100);
    quest::summonfixeditem(99100);
    }
    if (plugin::takeItems(99100 => 1)) {
		quest::say("Beware of the evils that lurk Kunark $name!");
    quest::ding();
    quest::set_data($key, 2);
    quest::set_data($nagkey, 1);
    quest::set_data($voxkey, 1);
	}
  }
  	#:: Return unused items
	      plugin::returnUnusedItems();
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
s




sub EVENT_TIMER {
  quest::depop();
}