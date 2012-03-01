local AST = CreateFrame("Frame")

local TrackingList = {
	[301] = {583, 1153, 157},
	[30] = {4017}
}

local function OnEvent(self, event, addon)
	if event == "ZONE_CHANGED_NEW_AREA" or event == "ZONE_CHANGED" or event == "ZONE_CHANGED_INDOORS" then
	local newzone = GetCurrentMapAreaID()

	for zone,achievement in ipairs(TrackingList[newzone]) do
	    print(achievement)
	    AddTrackedAchievement(achievement)
	end

	elseif event == "ADDON_LOADED" and addon == "AutoSwitchTracking" then
		AST:UnregisterEvent("ADDON_LOADED")
		AST:RegisterEvent("ZONE_CHANGED")
		AST:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		AST:RegisterEvent("ZONE_CHANGED_INDOORS")
	end
end

AST:SetScript("OnEvent", OnEvent)
AST:RegisterEvent("ADDON_LOADED")