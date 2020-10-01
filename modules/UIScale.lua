local cvars = {
	enableFloatingCombatText = "0", --0 to only show default outgoing hits (no heals)
	floatingCombatTextCombatDamage = "1", --1 to only show default outgoing hits (no heals)
	clampTargetNameplateToScreen = "1",
	nameplateOtherTopInset = "0.08",
	nameplateLargeTopInset = "0.08",
	nameplateOtherBottomInset = "0.1",
}

local f = CreateFrame("Frame", nil, UIParent);
--f:RegisterAllEvents();
f:RegisterEvent("VARIABLES_LOADED");
f:RegisterEvent("ADDON_LOADED");
f:RegisterEvent("UI_SCALE_CHANGED");
f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:SetScript("OnEvent", function(self, event)
	--UIParent:SetScale(0.5625); -- change the size and reload your ui (/reloadui) or restart the game
	--UIParent:SetScale(0.533333333333333); -- change the size and reload your ui (/reloadui) or restart the game
	if 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)") < .64 then
		UIParent:SetScale(768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)"))
	end
	
	-- SetCVARs
	-- if event == "ADDON_LOADED" then -- some CVars dont work with only ADDON_LOADED
		for k, v in pairs(cvars) do
			SetCVar(k, v)
			-- print(event, k, v, GetCVar(k)) -- error checking
		end
	-- end
	--if event == "PLAYER_ENTERING_WORLD" then
	--	print("Custom CVars and UIScale loaded")
	--end
end)