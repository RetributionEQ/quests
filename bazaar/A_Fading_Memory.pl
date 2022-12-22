sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("laughs");
    quest::say("Oh my, you really don’t remember me do you? I could never forget a comrade in arms! Hail $name! Let me see that faded writ and I’ll give you something to jog your memory");
  }
  if($text=~/denizens of this realm/i){
    quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
}


sub EVENT_ITEM {
my $PCRace = $client->GetRace();
my $PCClass = $client->GetClass();
  if(plugin::check_handin(\%itemcount, 18471 => 1)){
    if($PCClass == 1){ #War
    quest::summonfixeditem(89998); #Apocryphal Short Sword
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 2){ #Clr
    quest::summonfixeditem(89999); #Apocryphal Club
    quest::summonfixeditem(813542); #Apocryphal Faded Blue Robe
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 3){ #Pal
    quest::summonfixeditem(855623); #Apocryphal Dull Axe
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 4){ #Rng
    quest::summonfixeditem(89998); #Apocryphal Short Sword
    quest::summonfixeditem(88009); #Apocryphal Short Bow* 
    quest::summonfixeditem(88500); #Apocryphal Class 1 Wood Point Arrow
    quest::summonfixeditem(88500); #Apocryphal Class 1 Wood Point Arrow
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 5){ #Sk
    quest::summonfixeditem(855623); #Apocryphal Dull Axe
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 6){ #Dru
    quest::summonfixeditem(89999); #Apocryphal Club
    quest::summonfixeditem(813542); #Apocryphal Faded Blue Robe
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 7){ #Mnk
    quest::summonfixeditem(867133); #Apocryphal Iron Tekko*
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic*
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }
    
    if($PCClass == 8){ #Bard
    quest::summonfixeditem(89998); #Apocryphal Short Sword
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 9){ #Rogue
    quest::summonfixeditem(89997); #Apocryphal Dagger
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 10){ #Shm
    quest::summonfixeditem(89999); #Apocryphal Club
    quest::summonfixeditem(813542); #Apocryphal Faded Blue Robe
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 11){ #Nec
    quest::summonfixeditem(86012); #Apocryphal Worn Great Staff*
    quest::summonfixeditem(813566); #Apocryphal Blood Spotted Robe*
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 12){ #Wiz
    quest::summonfixeditem(86012); #Apocryphal Worn Great Staff*
    quest::summonfixeditem(813566); #Apocryphal Blood Spotted Robe*
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 13){ #Mag
    quest::summonfixeditem(86012); #Apocryphal Worn Great Staff*
    quest::summonfixeditem(813566); #Apocryphal Blood Spotted Robe*
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }
    
    if($PCClass == 14){ #Enc
    quest::summonfixeditem(86012); #Apocryphal Worn Great Staff*
    quest::summonfixeditem(813566); #Apocryphal Blood Spotted Robe*
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 15){ #Bl
    quest::summonfixeditem(867133); #Apocryphal Iron Tekko*
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic*
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }

    if($PCClass == 16){ #Zerker
    quest::summonfixeditem(855623); #Apocryphal Dull Axe
    quest::summonfixeditem(813514); #Apocryphal Dusty Tunic
    quest::say("Hmmm… Does this refresh your memory at all?. I think you’ll find that if you look around here long enough, things will seem more and more like you remember. You see, you may have forgotten how strong you are, but the [denizens of this realm] could never.");
    if($text=~/denizens of this realm/i){
    #quest::say("Hmmm I don’t want to risk sending you into shock or an existential crisis. Just do what feels natural and try to remember who needs your help and whose demise you must bring about. When you’ve regained your bearings, there are many important memories to be re-lived in the Temple of Sol Ro. Good luck $name.");
    }
    }
  plugin::returnUnusedItems();
  }
}