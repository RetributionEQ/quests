function EVENT_SPELL_EFFECT_CLIENT(self)
    local client = plugin.val('$client')

    quest.debug("Cast Bazaar Portal")
	--If we're not in the Bazaar, store zone, instance, and coordinates
    if self.zoneid ~= 151 then
        quest.debug("Not in Bazaar")
        client:SetBucket("Return-X", client:GetX())
        client:SetBucket("Return-Y", client:GetY())
        client:SetBucket("Return-Z", client:GetZ())
        client:SetBucket("Return-H", client:GetHeading())
        client:SetBucket("Return-Zone", self.zoneid)
        client:SetBucket("Return-Instance", self.instanceid)
	--If we are in the Bazaar, use the stored zone, instance and coordinates to return to
    else
        quest.debug("We are in Bazaar")
        local ReturnX = client:GetBucket("Return-X")
        local ReturnY = client:GetBucket("Return-Y")
        local ReturnZ = client:GetBucket("Return-Z")
        local ReturnH = client:GetBucket("Return-H")
        local ReturnZone = client:GetBucket("Return-Zone")
        local ReturnInstance = client:GetBucket("Return-Instance")

        if ReturnX ~= nil and ReturnX ~= '' and
           ReturnY ~= nil and ReturnY ~= '' and
           ReturnZ ~= nil and ReturnZ ~= '' and
           ReturnH ~= nil and ReturnH ~= '' and
           ReturnZone ~= nil and ReturnZone ~= '' then
            quest.debug("Found a return location")

			--move the client back to the stored location
			client:MovePCInstance(ReturnZone, ReturnInstance, ReturnX, ReturnY, ReturnZ, ReturnH)
			
			--clear the stored location
            client:DeleteBucket("Return-X")
            client:DeleteBucket("Return-Y")
            client:DeleteBucket("Return-Z")
            client:DeleteBucket("Return-H")
            client:DeleteBucket("Return-Zone")
            client:DeleteBucket("Return-Instance")

        else
            quest.debug("Returning to default location")
            plugin.move_startzone()
            return -1
        end
    end
end

