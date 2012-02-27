local AST = CreateFrame("Frame")

local function OnEvent(self, event, ...)
	if event == "ZONE_CHANGED_NEW_AREA" or event == "ZONE_CHANGED" or event == "ZONE_CHANGED_INDOORS" then

	elseif event == "ADDON_LOADED" and addon == "AutoSwitchTracking" then
		AST:UnregisterEvent("ADDON_LOADED")
		AST:RegisterEvent("ZONE_CHANGED")
		AST:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		AST:RegisterEvent("ZONE_CHANGED_INDOORS")
	end
end

AST:SetScript("OnEvent", OnEvent)
AST:RegisterEvent("ADDON_LOADED")