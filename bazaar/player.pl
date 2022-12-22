sub EVENT_ENTERZONE {
  quest::settimer("ZoneIn", 3);
}

sub EVENT_TIMER {
  if ($timer eq "ZoneIn") {
    quest::stoptimer("ZoneIn");
    quest::signalwith(12000173,$charid); # NPC: Zeflmin_Werlikanin Portal Crystals
  }
}

sub EVENT_CLICKDOOR {
    if($doorid ==146)
    {
  if(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10092) { #hateplane
    quest::popup('Teleport', 'Teleport to The Plane of Hate?', 666, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10094) { #airplane
    quest::popup('Teleport', 'Teleport to The Plane of Sky?', 674, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 64191) { #dragonscale
    quest::popup('Teleport', 'Teleport to Dragonscale Hills?', 15891, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876000) { #karana
    quest::popup('Teleport', 'Teleport to The Northern Plains of Karana?', 2708, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876001) { #ecommons
    quest::popup('Teleport', 'Teleport to East Commonlands?', 4176, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876002) { #lavastorm
    quest::popup('Teleport', 'Teleport to The Lavastorm Mountains?', 534, 1, 0);
  } 
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876003) { #toxxulia
    quest::popup('Teleport', 'Teleport to Toxxulia Forest?', 2707, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876004) { #faydark
    quest::popup('Teleport', 'Teleport to The Greater Faydark?', 2706, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876005) { #dreadlands
    quest::popup('Teleport', 'Teleport to The Dreadlands?', 2709, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876006) { #iceclad
    quest::popup('Teleport', 'Teleport to The Iceclad Ocean?', 2284, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876007) { #cobaltscar
    quest::popup('Teleport', 'Teleport to Cobalt Scar?', 2031, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876009) { #twilight
    quest::popup('Teleport', 'Teleport to The Twilight Sea?', 3615, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876010) { #stonebrunt
    quest::popup('Teleport', 'Teleport to The Stonebrunt Mountains?', 3794, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876011) { #slaughter
    quest::popup('Teleport', 'Teleport to Wall of Slaughter?', 6180, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876012) { #barindu
    quest::popup('Teleport', 'Teleport to Barindu, Hanging Gardens?', 5733, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 876070) { #eastkorlach
    quest::popup('Teleport', 'Teleport to The Undershore?', 8237, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88735) { #arcstone
    quest::popup('Teleport', 'Teleport to Arcstone, Isle of Spirits?', 8967, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88736) { #goru
    quest::popup('Teleport', 'Teleport to Goru`kar Mesa?', 999, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88737) { #guild banner
    quest::popup('Teleport', 'Teleport to your guild banner?', 1000, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88738) { #kattacastrum
    quest::popup('Teleport', 'Teleport to Katta Castrum?', 416, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88739) { #potimea
    quest::popup('Teleport', 'Teleport to The Plane of Time?', 20543, 1, 0);
  }
  elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88740) { #brellsrest
    quest::popup('Teleport', 'Teleport to Brell\'s Rest?', 21986, 1, 0);
  }
}
}

#sub EVENT_ITEM {
 # plugin::return_items(\%itemcount);
#}

sub EVENT_POPUPRESPONSE {
  if ($popupid == 666) { #hateplaneb
    quest::movepc(186,-393,656,3); # Zone: hateplaneb
  }
  if ($popupid == 674) { #airplane
    quest::movepc(71,539,1384,-664); # Zone: airplane
  }
  if ($popupid == 15891) { #dragonscale
    #quest::movepc(442,-1954,3916,19);
  }
  if ($popupid == 2708) { #northkarana
    quest::movepc(13,1209,-3685,-5); # Zone: northkarana
  }
  if ($popupid == 4176) { #ecommons
    quest::movepc(22,-140,-1520,3); # Zone: ecommons
  }
  if ($popupid == 534) { #lavastorm
    quest::movepc(27,460,460,-86); # Zone: lavastorm
  }
  if ($popupid == 2707) { #tox
    quest::movepc(38,-916,-1510,-33); # Zone: tox
  }
  if ($popupid == 2706) { #gfaydark
    quest::movepc(54,-441,-2023,4); # Zone: gfaydark
  }
  if ($popupid == 2709) { #dreadlands
    quest::movepc(86,9658,3047,1052); # Zone: dreadlands
  }
  if ($popupid == 2284) { #iceclad
    quest::movepc(110,385,5321,-17); # Zone: iceclad
  }
  if ($popupid == 2031) { #coboltscar
    quest::movepc(117,-1634,-1065,299); # Zone: cobaltscar
  }
  if ($popupid == 3615) { #twilight
    quest::movepc(170,-1028,1338,39); # Zone: twilight
  }
  if ($popupid == 3794) { #stonebrunt
    quest::movepc(100,673,-4531,0); # Zone: stonebrunt
  }
  if ($popupid == 6180) { #wallofslaughter
    quest::movepc(300,-943,13,130); # Zone: wallofslaughter
  }
  if ($popupid == 5733) { #barindu
    quest::movepc(283,209,-515,-119); # Zone: barindu
  }
  if ($popupid == 8237) { #eastkorlach
    #quest::movepc(362,-750,-1002,48);
  }
  if ($popupid == 8967) { #arcstone
    #quest::movepc(369,1630,-279,5);
  }
  if ($popupid == 999) { #mesa
    #quest::movepc(397,-85,-2050,19);
  }
  if ($popupid == 1000) { #guild banner
    #not implemented yet
  }
  if ($popupid == 416) { #kattacastrum
    #quest::movepc(416,-2,-425,-19);
  }
  if ($popupid == 20543) { #potimea
    quest::movepc(219,0,110,8); # Zone: potimea
  }
  if ($popupid == 21986) { #brellsrest
    #quest::movepc(480,-23,-619,36);
  }
}