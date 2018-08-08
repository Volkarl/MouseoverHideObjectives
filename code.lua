-- This file is loaded from "MouseoverHideObjectives.toc"
-- Event list was copied from addon: DejaQuestFader

local fadeOutTimer
local secondsToFade = 4
local addonFrame = CreateFrame("Frame", "addonFrame", UIParent)

addonFrame:RegisterEvent("PLAYER_LOGIN") 
addonFrame:RegisterEvent("SUPER_TRACKED_QUEST_CHANGED")
addonFrame:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
addonFrame:RegisterEvent("QUEST_WATCH_UPDATE")
addonFrame:RegisterEvent("QUEST_WATCH_LIST_CHANGED") 
addonFrame:RegisterEvent("QUEST_ACCEPTED")
addonFrame:RegisterEvent("QUEST_FINISHED") 
addonFrame:RegisterEvent("QUEST_COMPLETE") 
addonFrame:RegisterEvent("QUEST_TURNED_IN") 
addonFrame:RegisterEvent("QUEST_REMOVED")
addonFrame:RegisterEvent("QUEST_DETAIL")
addonFrame:RegisterEvent("QUEST_POI_UPDATE")
addonFrame:RegisterEvent("QUESTLINE_UPDATE")
-- addonFrame:RegisterEvent("CRITERIA_UPDATE") -- Updates often for dialogue that doesn't actually change the quest log
-- addonFrame:RegisterEvent("QUEST_LOG_UPDATE") -- Updates too often, so the frame never fades

----------------------------------------------------------------------------------------------------

local function ShowObjectives()
	if fadeOutTimer then fadeOutTimer:Cancel() end
	UIFrameFadeIn(ObjectiveTrackerFrame, 0.00, 1.0, 1.0)
	-- No fading, it instantly shows the frame: the UIFrameFadeOut and UIFrameFadeIn functions do the same thing
end

local function FadeObjectives()
	UIFrameFadeOut(ObjectiveTrackerFrame, 0.50, 1.0, 0)
end

local function StartFadeTimer()
	fadeOutTimer = C_Timer.NewTimer(secondsToFade, FadeObjectives)
end

----------------------------------------------------------------------------------------------------

addonFrame:SetScript("OnEvent", function(self, event, arg1)
	ShowObjectives() 
	StartFadeTimer()
end)

Minimap:HookScript("OnEnter", ShowObjectives)
Minimap:HookScript("OnLeave", StartFadeTimer)
