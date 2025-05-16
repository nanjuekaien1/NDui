local _, ns = ...
local B, C, L, DB = unpack(ns)
local UF = B:GetModule("UnitFrames")

local wipe, gmatch, strmatch = table.wipe, string.gmatch, string.match
local GetSpecialization, GetSpecializationInfo = GetSpecialization, GetSpecializationInfo
local GetSpellTexture = C_Spell.GetSpellTexture
local EMPTY_TEXTURE = "Interface\\Icons\\INV_Misc_QuestionMark"
local myFullName = DB.MyFullName

UF.DefaultAvada = {
	[0] = "", -- None
	-- HUNTER
	[253] = "1ZplayerZcdZ34026N2ZplayerZcdZ217200N3ZpetZbuffZ272790N4ZplayerZbuffZ268877N5ZplayerZcdZ19574N6ZplayerZcdZ359844", -- Beast Mastery
	[254] = "1ZplayerZcdZ19434N2ZplayerZcdZ257044N3ZplayerZbuffZ257622N4ZplayerZbuffZ474293N5ZplayerZbuffZ389020N6ZplayerZcdZ288613", -- Marksmanship
	[255] = "1ZplayerZcdZ259489N2ZplayerZcdZ259495N3ZplayerZcdZ212431N4ZplayerZcdZ212436N5ZplayerZcdZ203415N6ZplayerZcdZ360952", -- Survival
	-- DK
	[250] = "1ZplayerZbuffZ195181N2ZplayerZbuffZ77535N3ZplayerZcdZ50842N4ZplayerZcdZ43265N5ZplayerZcdZ48707N6ZplayerZcdZ55233N7ZplayerZcdZ219809N8ZplayerZcdZ383269N", -- Blood
	[251] = "1ZplayerZbuffZ51124N2ZplayerZcdZ196770N3ZplayerZcdZ43265N4ZplayerZcdZ48707N5ZplayerZcdZ51271N6ZplayerZcdZ383269N7ZplayerZcdZ51052N8ZplayerZcdZ279302N", -- Frost
	[252] = "1ZplayerZcdZ85948N2ZplayerZcdZ43265N3ZplayerZcdZ63560N4ZplayerZcdZ207289N5ZplayerZcdZ48707N6ZplayerZcdZ51052N7ZplayerZcdZ212552N8ZplayerZcdZ383269N", -- Unholy
	-- MAGE
	[62] = "1ZplayerZbuffZ263725N2ZplayerZcdZ153626N3ZplayerZcdZ321507N4ZplayerZcdZ235450N5ZplayerZcdZ382440N6ZplayerZcdZ55342N7ZplayerZcdZ414660N8ZplayerZcdZ110959N", -- Arcane
	[63] = "1ZplayerZbuffZ48107N2ZplayerZcdZ108853N3ZplayerZcdZ257541N4ZplayerZcdZ235313N5ZplayerZcdZ414660N6ZplayerZcdZ382440N7ZplayerZcdZ110959N8ZplayerZcdZ190319N", -- Fire
	[64] = "1ZplayerZcdZ44614N2ZplayerZcdZ157997N3ZplayerZcdZ153595N4ZplayerZcdZ84714N5ZplayerZcdZ382440N6ZplayerZcdZ12472N7ZplayerZcdZ414660N8ZplayerZcdZ110959N", -- Frost
	-- PALADIN
	[65] = "1ZplayerZcdZ20473N2ZplayerZcdZ35395N3ZplayerZcdZ275773N4ZplayerZcdZ114165N5ZplayerZcdZ1044N6ZplayerZcdZ1022N7ZplayerZcdZ31821N8ZplayerZcdZ642N", -- Holy
	[66] = "1ZplayerZcdZ204019N2ZplayerZcdZ275779N3ZplayerZcdZ31935N4ZplayerZcdZ387174N5ZplayerZcdZ1044N6ZplayerZcdZ1022N7ZplayerZcdZ31850N8ZplayerZcdZ86659N", -- Protection
	[70] = "1ZplayerZcdZ20271N2ZplayerZcdZ184575N3ZplayerZcdZ255937N4ZplayerZcdZ343721N5ZplayerZcdZ375576N6ZplayerZcdZ642N7ZplayerZcdZ198034N8ZplayerZcdZ184662N", -- Retribution
	-- PRIEST
	[256] = "1ZplayerZcdZ47540N2ZplayerZcdZ8092N3ZplayerZcdZ17N4ZplayerZcdZ194509N5ZplayerZcdZ472433N6ZplayerZcdZ421453N7ZplayerZcdZ33206N8ZplayerZcdZ62618N", -- Discipline
	[257] = "1ZplayerZcdZ34861N2ZplayerZcdZ2050N3ZplayerZcdZ14914N4ZplayerZcdZ10060N5ZplayerZcdZ47788N6ZplayerZcdZ64843N7ZplayerZcdZ64901N8ZplayerZcdZ47788N", -- Holy
	[258] = "1ZtargetZdebuffZ589N2ZtargetZdebuffZ34914N3ZplayerZcdZ228260N4ZplayerZcdZ8092N5ZplayerZcdZ263165N6ZplayerZcdZ10060N7ZplayerZcdZ228260N8ZplayerZcdZ47585N", -- Shadow
	-- ROGUE
	[259] = "1ZplayerZcdZ5938N2ZplayerZcdZ703N3ZplayerZcdZ36554N4ZplayerZcdZ57934N5ZplayerZcdZ385627N6ZplayerZcdZ31224N7ZplayerZcdZ5277N8ZplayerZcdZ1856N", -- Assassination
	[260] = "1ZplayerZcdZ13877N2ZplayerZcdZ315508N3ZplayerZcdZ13750N4ZplayerZcdZ57934N5ZplayerZcdZ51690N6ZplayerZcdZ196937N7ZplayerZcdZ31224N8ZplayerZcdZ1856N", -- Outlaw
	[261] = "1ZplayerZcdZ212283N2ZplayerZcdZ280719N3ZplayerZcdZ57934N4ZplayerZcdZ121471N5ZplayerZcdZ384631N6ZplayerZcdZ185313N7ZplayerZcdZ31224N8ZplayerZcdZ1856N", -- Subtlety
	-- SHAMAN
	[262] = "1ZplayerZcdZ470411N2ZplayerZcdZ51505N3ZplayerZbuffZ191877N4ZplayerZcdZ51490N5ZplayerZcdZ191634N6ZplayerZcdZ108271N7ZplayerZcdZ192249N8ZplayerZcdZ114050N", -- Elemental
	[263] = "1ZplayerZcdZ17364N2ZplayerZcdZ60103N3ZplayerZcdZ470411N4ZplayerZcdZ187874N5ZplayerZcdZ51490N6ZplayerZcdZ384352N7ZplayerZcdZ192058N8ZplayerZcdZ114051N", -- Enhancement
	[264] = "1ZplayerZcdZ61295N2ZplayerZcdZ5394N3ZplayerZcdZ73920N4ZplayerZcdZ79206N5ZplayerZcdZ108280N6ZplayerZcdZ98008N7ZplayerZcdZ108280N8ZplayerZcdZ114052N", -- Restoration
	-- DH
	[577] = "1ZplayerZcdZ258920N2ZplayerZcdZ188499N3ZplayerZcdZ198013N4ZplayerZcdZ204596N5ZplayerZbuffZ162264N6ZplayerZcdZ370965N7ZplayerZcdZ198793N8ZplayerZcdZ179057N", -- Havoc
	[581] = "1ZplayerZcdZ263642N2ZplayerZcdZ212084N3ZplayerZcdZ203720N4ZplayerZcdZ204021N5ZplayerZcdZ204596N6ZplayerZcdZ202137N7ZplayerZcdZ202138N8ZplayerZcdZ187827N", -- Vengeance
	-- DRUID
	[102] = "1ZplayerZbuffZ394050N2ZplayerZcdZ22812N3ZplayerZcdZ78675N4ZplayerZcdZ194223N5ZplayerZcdZ124974N6ZplayerZcdZ391528N7ZplayerZcdZ29166N8ZplayerZcdZ22812N", -- Balance
	[103] = "1ZtargetZdebuffZ1079N2ZplayerZcdZ274837N3ZplayerZcdZ391888N4ZplayerZcdZ5217N5ZplayerZcdZ22812N6ZplayerZcdZ106951N7ZplayerZcdZ61336N8ZplayerZcdZ391528N", -- Feral
	[104] = "1ZplayerZcdZ204066N2ZplayerZcdZ77758N3ZplayerZcdZ33917N4ZplayerZcdZ200851N5ZplayerZcdZ22812N6ZplayerZcdZ102558N7ZplayerZcdZ61336N8ZplayerZcdZ319454N", -- Guardian
	[105] = "1ZplayerZbuffZ33763N2ZplayerZbuffZ428737N3ZplayerZcdZ18562N4ZplayerZcdZ197721N5ZplayerZcdZ124974N6ZplayerZcdZ391528N7ZplayerZcdZ102342N8ZplayerZcdZ740N", -- Restoration
	-- WARLOCK
	[265] = "1ZtargetZdebuffZ316099N2ZtargetZdebuffZ980N3ZplayerZbuffZ264571N4ZplayerZcdZ48181N5ZplayerZcdZ205179N6ZplayerZcdZ386997N7ZplayerZcdZ333889N8ZplayerZcdZ104773N", -- Affliction
	[266] = "1ZplayerZbuffZ264173N2ZplayerZcdZ104316N3ZplayerZcdZ111898N4ZplayerZcdZ455465N5ZplayerZcdZ265187N6ZplayerZcdZ264130N7ZplayerZcdZ48018N8ZplayerZcdZ333889N", -- Demonology
	[267] = "1ZtargetZdebuffZ157736N2ZplayerZcdZ17962N3ZplayerZcdZ17877N4ZplayerZcdZ196447N5ZplayerZcdZ111771N6ZplayerZcdZ152108N7ZplayerZcdZ1122N8ZplayerZcdZ333889N", -- Destruction
	-- WARRIOR
	[71] = "1ZplayerZcdZ7384N2ZplayerZcdZ12294N3ZplayerZcdZ384318N4ZplayerZcdZ262161N5ZplayerZcdZ228920N6ZplayerZcdZ436358N7ZplayerZcdZ118038N8ZplayerZcdZ107574N", -- Arms
	[72] = "1ZplayerZcdZ23881N2ZplayerZcdZ23920N3ZplayerZcdZ6343N4ZplayerZcdZ384318N5ZplayerZcdZ1719N6ZplayerZcdZ228920N7ZplayerZcdZ184364N8ZplayerZcdZ107574N", -- Fury
	[73] = "1ZplayerZcdZ2565N2ZplayerZbuffZ190456N3ZplayerZcdZ46968N4ZplayerZcdZ23920N5ZplayerZcdZ228920N6ZplayerZcdZ871N7ZplayerZcdZ12975N8ZplayerZcdZ107574N", -- Protection
	-- EVOKER
	[1467] = "1ZplayerZcdZ356995N2ZplayerZcdZ382266N3ZplayerZcdZ382411N4ZplayerZcdZ370452N5ZplayerZcdZ374348N6ZplayerZcdZ363916N7ZplayerZcdZ374348N8ZplayerZcdZ375087N", -- Devastation
	[1468] = "1ZplayerZcdZ366155N2ZplayerZcdZ373861N3ZplayerZcdZ382731N4ZplayerZcdZ382614N5ZplayerZcdZ370537N6ZplayerZcdZ357170N7ZplayerZcdZ363534N8ZplayerZcdZ370553N", -- Preservation
	[1473] = "1ZplayerZcdZ409311N2ZplayerZcdZ396286N3ZplayerZcdZ357208N4ZplayerZcdZ360827N5ZplayerZcdZ395152N6ZplayerZcdZ404977N7ZplayerZcdZ363916N8ZplayerZcdZ370553N", -- Augmentation
	-- MONK
	[268] = "1ZplayerZbuffZ325092N2ZplayerZcdZ322101N3ZplayerZbuffZ215479N4ZplayerZbuffZ322507N5ZplayerZcdZ115181N6ZplayerZcdZ115203N7ZplayerZcdZ122278N8ZplayerZcdZ115399N", -- Brewmaster
	[269] = "1ZplayerZcdZ107428N2ZplayerZcdZ113656N3ZplayerZcdZ137639N4ZplayerZcdZ123904N5ZplayerZcdZ152175N6ZplayerZcdZ122470N7ZplayerZcdZ115203N8ZplayerZcdZ122783N", -- Windwalker
	[270] = "1ZplayerZbuffZ119611N2ZplayerZcdZ107428N3ZplayerZcdZ322101N4ZplayerZcdZ388193N5ZplayerZcdZ115203N6ZplayerZcdZ116849N7ZplayerZcdZ325197N8ZplayerZcdZ115310N", -- Mistweaver
}

local replacedTexture = {
	[272790] = 106785, -- 倒刺buff转换
}

UF.AvadaValueSpells = { -- 显示数值的法术
	[77535] = true, -- 鲜血护盾
}

UF.AvadaGemini = { -- 自动转换的法术
	[5394] = 157153, -- 治疗之泉图腾自动转暴雨图腾
}

local avadaButtons, auraData, avadaValue = {}, {}
local maxButtons = 8             -- 改6为8
for i = 1, maxButtons do
	auraData[i] = {}
end

local watchUnits, watchTypes = {}, {}
function UF:Avada_UpdateWatchData()
	wipe(watchUnits)
	wipe(watchTypes)

	for i = 1, maxButtons do
		if auraData[i] then
			local unit = auraData[i].unit
			local iconType = auraData[i].type
			if unit and unit ~= "" then
				watchUnits[unit] = true
			end
			if iconType and iconType ~= "" then
				watchTypes[iconType] = true
			end
		end
	end
end

local function stringParser(str)
	for result in gmatch(str, "[^N]+") do
		local iconIndex, unit, iconType, spellID = strmatch(result, "(%d+)Z(%w+)Z(%w+)Z(%d+)")
		iconIndex = tonumber(iconIndex)
		spellID = tonumber(spellID)
		local geminiSpell = UF.AvadaGemini[spellID]
		if geminiSpell and IsPlayerSpell(geminiSpell) then
			spellID = geminiSpell
		end
		auraData[iconIndex] = {index = iconIndex, unit = unit, type = iconType, spellID = spellID}
	end
end

function UF:Avada_RefreshIcons()
	local specIndex = GetSpecialization()
	if specIndex > 4 then specIndex = 1 end -- use 1st spec for lower level
	local specID = GetSpecializationInfo(specIndex)
	if not specID then return end

	wipe(auraData)
	local profileIndex = NDuiADB["AvadaIndex"][myFullName] and NDuiADB["AvadaIndex"][myFullName][specID]
	local classString = NDuiADB["AvadaProfile"][specID] and NDuiADB["AvadaProfile"][specID][profileIndex] or UF.DefaultAvada[specID]
	if classString then
		stringParser(classString)
	end

	for i = 1, maxButtons do
		local button = avadaButtons[i]
		if button then
			local spellID = auraData[i] and auraData[i].spellID
			local texture = spellID and GetSpellTexture(replacedTexture[spellID] or spellID) or EMPTY_TEXTURE
			if auraData[i] and auraData[i].type == "item" then
				texture = spellID and GetItemIcon(spellID) or EMPTY_TEXTURE
			end
			button.Icon:SetTexture(texture)
			button.Icon:SetDesaturated(true)
			button.Count:SetText("")
		end
	end
end

function UF:Avada_RefreshAll()
	UF.Avada_RefreshIcons(self)
	UF:Avada_UpdateWatchData()
end

function UF:Avada_GetUnitAura(unit, spellID, filter)
	for index = 1, 40 do
		local data = C_UnitAuras.GetAuraDataByIndex(unit, index, filter)
		if not data then break end
		if data.spellId == spellID then
			return data.name, data.applications, data.duration, data.expirationTime, data.sourceUnit, data.spellId, data.points[1]
		end
	end
end

function UF:Avada_UpdateAura(button, unit, spellID, filter)
	local name, count, duration, expire, caster, spellID, value = UF:Avada_GetUnitAura(unit, spellID, filter)
	if name and caster == "player" then
		button.Count:SetText(count > 1 and count or "")
		button.CD:SetCooldown(expire-duration, duration)
		button.CD:Show()
		button.Icon:SetDesaturated(false)
	else
		button.CD:Hide()
		button.Count:SetText("")
		button.Icon:SetDesaturated(true)
	end
	button.CD:SetReverse(true)

	if avadaValue then
		if UF.AvadaValueSpells[spellID] and value then
			avadaValue:SetText(B.Numb(value))
		else
			avadaValue:SetText("")
		end
	end
end

function UF:Avada_UpdateCD(button, spellID)
	local chargeInfo = C_Spell.GetSpellCharges(spellID)
	local charges = chargeInfo and chargeInfo.currentCharges
	local maxCharges = chargeInfo and chargeInfo.maxCharges
	local chargeStart = chargeInfo and chargeInfo.cooldownStartTime
	local chargeDuration = chargeInfo and chargeInfo.cooldownDuration

	local cooldownInfo = C_Spell.GetSpellCooldown(spellID)
	local start = cooldownInfo and cooldownInfo.startTime
	local duration = cooldownInfo and cooldownInfo.duration

	if charges and maxCharges > 1 then
		button.Count:SetText(charges)
	else
		button.Count:SetText("")
	end
	if charges and charges > 0 and charges < maxCharges then
		button.CD:SetCooldown(chargeStart, chargeDuration)
		button.CD:Show()
		button.Icon:SetDesaturated(false)
		button.Count:SetTextColor(0, 1, 0)
	elseif start and duration > 1.5 then
		button.CD:SetCooldown(start, duration)
		button.CD:Show()
		button.Icon:SetDesaturated(true)
		button.Count:SetTextColor(1, 1, 1)
	else
		button.CD:Hide()
		button.Icon:SetDesaturated(false)
		if charges == maxCharges then button.Count:SetTextColor(1, 0, 0) end
	end
	button.CD:SetReverse(false)
end

function UF:Avada_UpdateItem(button, itemID)
	local count = C_Item.GetItemCount(itemID)
	if count and count > 1 then
		button.Count:SetText(count)
	else
		button.Count:SetText("")
	end

	local start, duration = C_Item.GetItemCooldown(itemID)
	if start and duration > 3 then
		button.CD:SetCooldown(start, duration)
		button.CD:Show()
		button.Icon:SetDesaturated(true)
	else
		button.CD:Hide()
		button.Icon:SetDesaturated(false)
	end
	button.CD:SetReverse(false)
end

function UF:Avada_OnEvent(event, unit)
	if event == "PLAYER_TARGET_CHANGED" then
		if not watchTypes["buff"] and not watchTypes["debuff"] then return end
		if not watchUnits["target"] then return end

		for i = 1, maxButtons do
			local data = auraData[i]
			if data and data.unit == "target" then
				UF:Avada_UpdateAura(avadaButtons[data.index], data.unit, data.spellID, filter)
			end
		end
	elseif event == "SPELL_UPDATE_COOLDOWN" or event == "SPELL_UPDATE_CHARGES" then
		if not watchTypes["cd"] then return end

		for i = 1, maxButtons do
			local data = auraData[i]
			if data and data.type == "cd" then
				UF:Avada_UpdateCD(avadaButtons[data.index], data.spellID)
			end
		end
	elseif event == "BAG_UPDATE_COOLDOWN" then
		if not watchTypes["item"] then return end

		for i = 1, maxButtons do
			local data = auraData[i]
			if data and data.type == "item" then
				UF:Avada_UpdateItem(avadaButtons[data.index], data.spellID)
			end
		end
	end
end

function UF:Avada_OnAura(unit)
	if not watchTypes["buff"] and not watchTypes["debuff"] then return end
	if not watchUnits[unit] then return end

	for i = 1, maxButtons do
		local data = auraData[i]
		if data then
			local filter = data.type == "buff" and "HELPFUL" or data.type == "debuff" and "HARMFUL"
			if data.unit == unit and filter then
				UF:Avada_UpdateAura(avadaButtons[data.index], unit, data.spellID, filter)
			end
		end
	end
end

function UF:Avada_Toggle(frame)
	frame = frame or oUF_PlayerPlate
	if not frame then return end

	if C.db["Avada"]["Enable"] then
		for i = 1, maxButtons do frame.Avada[i]:Show() end             -- 改6为maxButtons
		B:RegisterEvent("UNIT_AURA", UF.Avada_OnAura)
		frame:RegisterEvent("PLAYER_TARGET_CHANGED", UF.Avada_OnEvent, true)
		frame:RegisterEvent("SPELL_UPDATE_COOLDOWN", UF.Avada_OnEvent, true)
		frame:RegisterEvent("SPELL_UPDATE_CHARGES", UF.Avada_OnEvent, true)
		frame:RegisterEvent("BAG_UPDATE_COOLDOWN", UF.Avada_OnEvent, true)

		UF.Avada_RefreshAll(frame)
		frame:RegisterEvent("TRAIT_CONFIG_UPDATED", UF.Avada_RefreshAll, true)
	else
		for i = 1, maxButtons do frame.Avada[i]:Hide() end             -- 改6为maxButtons
		B:UnregisterEvent("UNIT_AURA", UF.Avada_OnAura)
		frame:UnregisterEvent("PLAYER_TARGET_CHANGED", UF.Avada_OnEvent)
		frame:UnregisterEvent("SPELL_UPDATE_COOLDOWN", UF.Avada_OnEvent)
		frame:UnregisterEvent("SPELL_UPDATE_CHARGES", UF.Avada_OnEvent)
		frame:UnregisterEvent("BAG_UPDATE_COOLDOWN", UF.Avada_OnEvent)
		frame:UnregisterEvent("TRAIT_CONFIG_UPDATED", UF.Avada_RefreshAll, true)
	end
end

function UF:AvadaKedavra(self)
	local iconSize = (C.db["Nameplate"]["PPWidth"]+2*C.mult - C.margin*(maxButtons-1))/maxButtons

	self.Avada = {}
	for i = 1, maxButtons do
		local bu = CreateFrame("Frame", "NDui_AvadaIcon" .. i, self.Health)
		bu:SetSize(iconSize, iconSize)
		B.AuraIcon(bu)
		--bu.glowFrame = B.CreateGlowFrame(bu, iconSize)

		local fontParent = CreateFrame("Frame", nil, bu)
		fontParent:SetAllPoints()
		fontParent:SetFrameLevel(bu:GetFrameLevel() + 6)
		bu.Count = B.CreateFS(fontParent, 16, "", false, "BOTTOM", 0, -10)
		if i == 1 then
			bu:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", -C.mult, -C.margin)
		else
			bu:SetPoint("LEFT", self.Avada[i-1], "RIGHT", C.margin, 0)
		end

		self.Avada[i] = bu
	end
	avadaButtons = self.Avada
	UF.avadaData = auraData

	local valueStr = B.CreateFS(self.Health, 18, "", "system")
	valueStr:ClearAllPoints()
	valueStr:SetPoint("RIGHT", self.Health, "LEFT", -5, 0)
	avadaValue = valueStr

	UF:Avada_Toggle(self)
end
