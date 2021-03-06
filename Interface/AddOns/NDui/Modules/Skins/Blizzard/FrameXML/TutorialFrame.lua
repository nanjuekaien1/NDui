local _, ns = ...
local B, C, L, DB = unpack(ns)

tinsert(C.defaultThemes, function()
	if not C.db["Skins"]["BlizzardSkins"] then return end

	B.SetBD(TutorialFrame)

	TutorialFrameBackground:Hide()
	TutorialFrameBackground.Show = B.Dummy
	TutorialFrame:DisableDrawLayer("BORDER")

	B.Reskin(TutorialFrameOkayButton, true)
	B.ReskinClose(TutorialFrameCloseButton)
	B.ReskinArrow(TutorialFramePrevButton, "left")
	B.ReskinArrow(TutorialFrameNextButton, "right")

	TutorialFrameOkayButton:ClearAllPoints()
	TutorialFrameOkayButton:SetPoint("BOTTOMLEFT", TutorialFrameNextButton, "BOTTOMRIGHT", 10, 0)

	-- because gradient alpha and OnUpdate doesn't work for some reason...

	if select(14, TutorialFrameOkayButton:GetRegions()) then
		select(14, TutorialFrameOkayButton:GetRegions()):Hide()
		select(15, TutorialFramePrevButton:GetRegions()):Hide()
		select(15, TutorialFrameNextButton:GetRegions()):Hide()
		select(14, TutorialFrameCloseButton:GetRegions()):Hide()
	end
	TutorialFramePrevButton:SetScript("OnEnter", nil)
	TutorialFrameNextButton:SetScript("OnEnter", nil)
	TutorialFrameOkayButton.__bg:SetBackdropColor(0, 0, 0, .25)
	TutorialFramePrevButton.__bg:SetBackdropColor(0, 0, 0, .25)
	TutorialFrameNextButton.__bg:SetBackdropColor(0, 0, 0, .25)
end)