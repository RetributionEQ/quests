sub EVENT_ENTERZONE {
	quest::debug("Just entered: $zonesn");
}

sub EVENT_ZONE {
	quest::debug("from_zone_id " . $from_zone_id);
	quest::debug("from_instance_id " . $from_instance_id);
	quest::debug("from_instance_version " . $from_instance_version);
	quest::debug("target_zone_id " . $target_zone_id);
	quest::debug("target_instance_id " . $target_instance_id);
	quest::debug("target_instance_version " . $target_instance_version);
}