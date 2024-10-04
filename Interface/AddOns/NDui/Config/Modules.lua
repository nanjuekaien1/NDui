-- Configure 配置页面
local _, ns = ...
local _, C = unpack(ns)

-- 动作条
C.Bars = {
	margin = 2,															-- 按键间距
	padding = 2,														-- 边缘间距
}

-- BUFF/DEBUFF相关
C.Auras = {
	BuffPos			= {"TOPRIGHT", Minimap, "TOPLEFT", -15, 0},			-- BUFF默认位置
	TotemsPos		= {"BOTTOMRIGHT", UIParent, "BOTTOM", -450, 20},	-- 图腾助手默认位置

	-- 技能监控各组初始位置
	PlayerAuraPos	= {"BOTTOM", UIParent, "BOTTOM", -149, 341},	    -- 玩家光环分组
	TargetAuraPos 	= {"BOTTOM", UIParent, "BOTTOM", 151, 342},		    -- 目标光环分组
	SpecialPos		= {"BOTTOM", UIParent, "BOTTOM", -155, 374},	    -- 玩家重要光环分组
	FocusPos		= {"TOP", UIParent, "TOP", 147, -271},		        -- 焦点光环分组
	CDPos			= {"TOP", UIParent, "TOP", -282, -450},	            -- 冷却计时分组
	EnchantPos		= {"BOTTOM", UIParent, "BOTTOM", -155, 421},	    -- 附魔及饰品分组
	RaidBuffPos		= {"TOP", UIParent, "TOP", -138, -480},		        -- 团队增益分组
	RaidDebuffPos	= {"TOP", UIParent, "TOP", 155, -470},			    -- 团队减益分组
	WarningPos		= {"BOTTOM", UIParent, "BOTTOM", 152, 358},		    -- 目标重要光环分组
	InternalPos		= {"TOP", UIParent, "TOP", -282, -312},	            -- 法术内置冷却分组 --
}

-- 头像相关
C.UFs = {
	Playercb		= {"BOTTOM", UIParent, "BOTTOM", 0, 220},			-- 玩家施法条默认位置
	Targetcb		= {"BOTTOM", UIParent, "BOTTOM", 0, 300},			-- 目标施法条默认位置
	Focuscb			= {"TOPLEFT", UIParent, "TOPLEFT", 358, -264},		-- 焦点施法条默认位置

	PlayerPos		= {"BOTTOM", UIParent, "BOTTOM", -247, 284},		-- 玩家框体默认位置
	TargetPos		= {"BOTTOM", UIParent, "BOTTOM", 247, 284},		    -- 目标框体默认位置
	ToTPos			= {"BOTTOM", UIParent, "BOTTOM", 67, 269},			-- 目标的目标框体默认位置
	PetPos			= {"BOTTOM", UIParent, "BOTTOM", -67, 269},		    -- 宠物框体默认位置
	FocusPos		= {"TOPLEFT", UIParent, "TOPLEFT", 336, -292},		-- 焦点框体默认位置
	PlayerPlate		= {"BOTTOM", UIParent, "BOTTOM", 0, 358},			-- 玩家姓名板默认位置 --
}

-- 小地图
C.Minimap = {
	Pos				= {"TOPRIGHT", UIParent, "TOPRIGHT", -7, -7},		-- 小地图默认位置
}

-- 美化及皮肤
C.Skins = {
	MicroMenuPos 	= {"BOTTOM", UIParent, "BOTTOM", 0, 2.5},			-- 微型菜单默认坐标
	RMPos  			= {"TOP", UIParent, "TOP", 0, -2},					-- 团队工具默认坐标
}

-- 鼠标提示框
C.Tooltips = {
	TipPos 	= {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -55, 230},		-- 鼠标提示框默认位置
}

-- 信息条
C.Infobar = {
	CustomAnchor	= false,											-- 自定义位置

	Guild	 		= true,												-- 公会信息
	GuildPos 		= {"TOPLEFT", UIParent, 15, -6},					-- 公会信息位置
	Friends 		= true,												-- 好友模块
	FriendsPos 		= {"TOPLEFT", UIParent, 105, -6},					-- 好友模块位置
	Latency			= true,												-- 延迟
	LatencyPos		= {"TOPLEFT", UIParent, 195, -6},					-- 延迟信息位置
	System			= true,												-- 帧数
	SystemPos		= {"TOPLEFT", UIParent, 285, -6},					-- 帧数信息位置
	Location		= true,												-- 区域信息
	LocationPos		= {"TOPLEFT", UIParent, 380, -6},					-- 区域信息位置
	Spec			= true,												-- 天赋专精
	SpecPos			= {"BOTTOMRIGHT", UIParent, -310, 6},				-- 天赋专精位置
	Durability		= true,												-- 耐久度
	DurabilityPos	= {"BOTTOM", UIParent, "BOTTOMRIGHT", -230, 6},		-- 耐久度位置
	Gold			= true,												-- 金币信息
	GoldPos			= {"BOTTOM", UIParent, "BOTTOMRIGHT", -125, 6}, 	-- 金币信息位置
	Time			= true,												-- 时间信息
	TimePos			= {"BOTTOMRIGHT", UIParent, -15, 6},				-- 时间信息位置
}
