
local module, L = BigWigs:ModuleDeclaration("C'Thun", "Ahn'Qiraj")

module.revision = 30069
local eyeofcthun = AceLibrary("Babble-Boss-2.2")["Eye of C'Thun"]
local cthun = AceLibrary("Babble-Boss-2.2")["C'Thun"]
local bzthescarabwall = AceLibrary("Babble-Zone-2.2")["The Scarab Wall"]
local bzgatesofahnqiraj = AceLibrary("Babble-Zone-2.2")["Gates of Ahn'Qiraj"]

module.enabletrigger = {eyeofcthun, cthun}
module.toggleoptions = {"icon", "rape", -1, "tentacle", "glare", "group", -1, "giant", "acid", "weakened", -1, "proximity", "stomach", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Cthun",
    
    icon_cmd = "icon",
    icon_name = "眼棱目标标记",
    icon_desc = "在眼棱目标上标记一个图标",
    
    proximity_cmd = "proximity",
    proximity_name = "近距离警告",
    proximity_desc = "显示近距离警告框",

    stomach_cmd = "stomach",
    stomach_name = "胃中的玩家",
    stomach_desc = "显示在胃中的玩家，而不是过于接近的玩家",
    
    tentacle_cmd = "tentacle",
    tentacle_name = "触须警报",
    tentacle_desc = "触须出现时进行警告",
    
    rape_cmd = "rape",
    rape_name = "强奸笑话很有趣",
    rape_desc = "有些人喜欢色情笑话。",
	
    glare_cmd = "glare",
    glare_name = "黑暗凝视警报",
    glare_desc = "黑暗凝视出现时进行警告",
    
    group_cmd = "group",
    group_name = "黑暗凝视小队警报",
    group_desc = "小队X受到黑暗凝视时进行警报",
    
    giant_cmd = "giant",
    giant_name = "巨眼警报",
    giant_desc = "巨眼出现时进行警告",
    
    weakened_cmd = "weakened",
    weakened_name = "虚弱状态警报",
    weakened_desc = "虚弱状态出现时进行警告",
    
    acid_cmd = "acid",
    acid_name = "消化酸液警报",
    acid_desc = "当你有5层消化酸液时显示警告",
    
	
    barStartRandomBeams = "随机眼棱开始！",

	eye_beam_trigger = "Giant Eye Tentacle begins to cast Eye Beam.",
	eye_beam_trigger_cthun = "Eye of C'Thun begins to cast Eye Beam.",
    eyebeam     = "%s 受到眼棱攻击",
    Unknown = "未知", -- Eye Beam on Unknown
    
    tentacle    = "触须派对 - 5秒",
    norape      = "5秒后触须出现！",
    barTentacle = "触须派对！",
    barNoRape   = "触须派对！",

    glare       = "黑暗凝视！",
    msgGlareEnds    = "黑暗凝视5秒后结束",
    barGlare    = "下一次黑暗凝视！",
    barGlareEnds = "黑暗凝视结束",
    barGlareCasting = "正在施放黑暗凝视",

    phase2starting  = "眼睛已死！主体即将出现！",

    playersInStomach = "胃中的玩家",

    barGiant	= "巨眼触须！",
    barGiantC	= "巨爪触须！",
    GiantEye = "5秒后出现巨眼触须！",
    gedownwarn	= "巨眼已击败！",

	weakenedtrigger = "is weakened!",
    weakened    = "克苏恩虚弱45秒",
    invulnerable2   = "5秒后派对结束",
    invulnerable1   = "派对结束 - 克苏恩无敌",
    barWeakened = "克苏恩变得虚弱！",

	digestiveAcidTrigger = "You are afflicted by Digestive Acid [%s%(]*([%d]*).",
    msgDigestiveAcid = "5层消化酸液",

    ["First Tentacle dead"] = "First Tentacle dead",
    ["First Tentacle"] = "First Tentacle",
    ["Second Tentacle"] = "Second Tentacle",

    window_bar = "机会窗口",
	trigger_bigClawDies = "Giant Claw Tentacle dies.",
	trigger_bigEyeDies = "Giant Eye Tentacle dies.",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-11
    cmd = "Cthun",
    
    icon_cmd = "icon",
    icon_name = "眼棱目标标记",
    icon_desc = "在眼棱目标上标记一个图标",
    
    proximity_cmd = "proximity",
    proximity_name = "近距离警告",
    proximity_desc = "显示近距离警告框",

    stomach_cmd = "stomach",
    stomach_name = "胃中的玩家",
    stomach_desc = "显示在胃中的玩家，而不是过于接近的玩家",
    
    tentacle_cmd = "tentacle",
    tentacle_name = "触须警报",
    tentacle_desc = "触须出现时进行警告",
    
    rape_cmd = "rape",
    rape_name = "强奸笑话很有趣",
    rape_desc = "有些人喜欢色情笑话。",
	
    glare_cmd = "glare",
    glare_name = "黑暗凝视警报",
    glare_desc = "黑暗凝视出现时进行警告",
    
    group_cmd = "group",
    group_name = "黑暗凝视小队警报",
    group_desc = "小队X受到黑暗凝视时进行警报",
    
    giant_cmd = "giant",
    giant_name = "巨眼警报",
    giant_desc = "巨眼出现时进行警告",
    
    weakened_cmd = "weakened",
    weakened_name = "虚弱状态警报",
    weakened_desc = "虚弱状态出现时进行警告",
    
    acid_cmd = "acid",
    acid_name = "消化酸液警报",
    acid_desc = "当你有5层消化酸液时显示警告",
    
	
    barStartRandomBeams = "随机眼棱开始！",

	eye_beam_trigger = "Giant Eye Tentacle begins to cast Eye Beam.",
	eye_beam_trigger_cthun = "Eye of C'Thun begins to cast Eye Beam.",
    eyebeam     = "%s 受到眼棱攻击",
    Unknown = "未知", -- Eye Beam on Unknown
    
    tentacle    = "触须派对 - 5秒",
    norape      = "5秒后触须出现！",
    barTentacle = "触须派对！",
    barNoRape   = "触须派对！",

    glare       = "黑暗凝视！",
    msgGlareEnds    = "黑暗凝视5秒后结束",
    barGlare    = "下一次黑暗凝视！",
    barGlareEnds = "黑暗凝视结束",
    barGlareCasting = "正在施放黑暗凝视",

    phase2starting  = "眼睛已死！主体即将出现！",

    playersInStomach = "胃中的玩家",

    barGiant	= "巨眼触须！",
    barGiantC	= "巨爪触须！",
    GiantEye = "5秒后出现巨眼触须！",
    gedownwarn	= "巨眼已击败！",

	weakenedtrigger = "is weakened!",
    weakened    = "克苏恩虚弱45秒",
    invulnerable2   = "5秒后派对结束",
    invulnerable1   = "派对结束 - 克苏恩无敌",
    barWeakened = "克苏恩变得虚弱！",

	digestiveAcidTrigger = "You are afflicted by Digestive Acid [%s%(]*([%d]*).",
    msgDigestiveAcid = "5层消化酸液",

    ["First Tentacle dead"] = "First Tentacle dead",
    ["First Tentacle"] = "First Tentacle",
    ["Second Tentacle"] = "Second Tentacle",

    window_bar = "机会窗口",
	trigger_bigClawDies = "Giant Claw Tentacle dies.",
	trigger_bigEyeDies = "Giant Eye Tentacle dies.",
} end )

module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = false

local timer = {
	nextspawn = 28,
	p1RandomEyeBeams = 8, -- how long does eye of c'thun target the same player at the beginning
	p1Tentacle = 45,      -- tentacle timers for phase 1
	p1TentacleStart = 45, -- delay for first tentacles from engage onwards
	p1GlareStart = 45,    -- delay for first dark glare from engage onwards
	p1Glare = 87,         -- interval for dark glare
	p1GlareCasting = 3,   -- time it takes from casting dark glare until the spell starts
	p1GlareDuration = 39, -- duration of dark glare

	p2Tentacle = 30,      -- tentacle timers for phase 2
	p2ETentacle = 60,     -- Eye tentacle timers for phase 2
	p2GiantClaw = 60,     -- Giant Claw timer for phase 2
	p2FirstGiantClaw = 12, -- first giant claw after eye of c'thun dies
	p2FirstGiantEye = 42, -- first giant eye after eye of c'thun dies
	p2FirstEyeTentacles = 42, -- first eye tentacles after eye of c'thun dies
	p2FirstGiantClawAfterWeaken = 8,
	p2FirstGiantEyeAfterWeaken = 38,
	p2FirstEyeAfterWeaken = 38,


	reschedule = 50,      -- delay from the moment of weakening for timers to restart
	target = 1,           -- delay for target change checking on Eye of C'Thun and Giant Eye Tentacle
	CheckTentacleHP = 0.5, -- delay for updating flesh tentacle hp
	weakened = 45,        -- duration of a weaken

	eyeBeam = 2,         -- Eye Beam Cast time
}
local icon = {
	window = "inv_misc_pocketwatch_01",
	giantEye = "inv_misc_eye_01", --"Interface\\Icons\\Ability_EyeOfTheOwl"
	giantClaw = "Spell_Nature_Earthquake",
	eyeTentacles = "spell_shadow_siphonmana", --"Interface\\Icons\\Spell_Nature_CallStorm"
	darkGlare = "Inv_misc_ahnqirajtrinket_04",
	weaken = "INV_ValentinesCandy",
	eyeBeamSelf = "Ability_creature_poison_05",
	digestiveAcid = "ability_creature_disease_02",
}
local syncName = {
	p2Start = "CThunP2Start"..module.revision,
	weaken = "CThunWeakened"..module.revision,
	weakenOver = "CThunWeakenedOver"..module.revision,
	tentacleSpawn = "TentacleSpawn"..module.revision,
	giantEyeDown = "CThunGEdown"..module.revision,
	giantClawSpawn = "GiantClawSpawn"..module.revision,
	giantEyeSpawn = "GiantEyeSpawn"..module.revision,
	eyeBeam = "CThunEyeBeam"..module.revision,
	fleshtentacledead2 = "CThunFleshTentacleDead2"..module.revision,
	window = "CThunWindow"..module.revision,
}

local gianteye = "Giant Eye Tentacle"
local fleshtentacle = "Flesh Tentacle"

local cthunstarted = nil
local phase2started = nil
local fleshtentacledead = nil
local secondTentacleLowWarn = nil
local firstGlare = nil
local firstWarning = nil
--local target = nil
local tentacletime = timer.p1Tentacle
local isWeakened = nil

local doCheckForWipe = false

local eyeTarget = nil

function module:OnRegister()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

function module:OnEnable()
	if self.core:IsModuleActive("Qiraji Mindslayer", "Ahn'Qiraj") then self.core:DisableModule("Qiraji Mindslayer", "Ahn'Qiraj") end
	
	--self:RegisterEvent("CHAT_MSG_SAY")--Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Emote")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Emote")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckEyeBeam")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckDigestiveAcid")


	self:ThrottleSync(20, syncName.p2Start)
	self:ThrottleSync(50, syncName.weaken)
	self:ThrottleSync(3, syncName.giantEyeDown)
	self:ThrottleSync(600, syncName.weakenOver)
	self:ThrottleSync(2, syncName.fleshtentacledead2)
	self:ThrottleSync(25, syncName.giantClawSpawn)
	self:ThrottleSync(25, syncName.giantEyeSpawn)
	self:ThrottleSync(25, syncName.tentacleSpawn)
	self:ThrottleSync(5, syncName.window)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	self.firstTentacleHP = 100
	self.secondTentacleHP = 100
	self.warning = 100
	fleshtentacledead = nil
	secondTentacleLowWarn = nil
	eyeTarget = nil
	cthunstarted = nil
	firstGlare = nil
	firstWarning = nil
	phase2started = nil
	doCheckForWipe = false

	tentacletime = timer.p1Tentacle

	self:RemoveProximity()
	self:TriggerEvent("BigWigs_StopDebuffTrack")
end

function module:OnEngage()
	self:CThunStart()
end

function module:OnDisengage()
	self:RemoveProximity()
	self:TriggerEvent("BigWigs_StopDebuffTrack")
end

function module:MINIMAP_ZONE_CHANGED(msg)
	--The Scarab Wall when you release, then Gates of Ahn'Qiraj as you run back, then Ahn'Qiraj when you zone in
	if (GetMinimapZoneText() == bzthescarabwall or GetMinimapZoneText() == bzgatesofahnqiraj) and self.core:IsModuleActive(module.translatedName) then
		self.core:DisableModule(module.translatedName)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if (msg == string.format(UNITDIESOTHER, eyeofcthun)) then
		self:Sync(syncName.p2Start)
	elseif (msg == string.format(UNITDIESOTHER, gianteye)) then
		self:Sync(syncName.giantEyeDown)
	elseif (msg == string.format(UNITDIESOTHER, fleshtentacle)) and not fleshtentacledead then
		self:Sync(syncName.fleshtentacledead2)
	end
	
	if msg == L["trigger_bigClawDies"] or msg == L["trigger_bigEyeDies"] then
		self:Sync(syncName.window)
	end
end

function module:CheckForWipe(event)
	if doCheckForWipe then
		BigWigs:CheckForWipe(self)
	end
end

function module:Emote(msg)
	if string.find(msg, L["weakenedtrigger"]) then
		self:Sync(syncName.weaken)
	end
end

function module:CheckEyeBeam(msg)
	if string.find(msg, L["eye_beam_trigger"]) then
		self:Sync(syncName.eyeBeam)
	elseif string.find(msg, L["eye_beam_trigger_cthun"]) then
		self:Sync(syncName.eyeBeam)
		if not cthunstarted then
			self:SendEngageSync()
		end
	end
end

function module:CheckDigestiveAcid(msg)
	local _, _, stacks = string.find(msg, L["digestiveAcidTrigger"])

	if stacks then
		if tonumber(stacks) == 5 then
			self:DigestiveAcid()
		end
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.p2Start then
		self:CThunP2Start()
	elseif sync == syncName.weaken then
		self:CThunWeakened()
	elseif sync == syncName.weakenOver then
		self:CThunWeakenedOver()
	elseif sync == syncName.giantEyeDown then
		self:Message(L["gedownwarn"], "Positive")
	elseif sync == syncName.eyeBeam then
		self:EyeBeam()
	elseif sync == syncName.giantClawSpawn then
		lastspawn = GetTime()
		self:GCTentacleRape()
	elseif sync == syncName.giantEyeSpawn then
		lastspawn = GetTime()
		self:GTentacleRape()
	elseif sync == syncName.tentacleSpawn then
		self:TentacleRape()
	elseif sync == syncName.fleshtentacledead2 then
		self:FleshTentacle()
	elseif sync == syncName.window then
		self:Window()
	end
end


function module:FleshTentacle()
	
	if not fleshtentacledead then
		fleshtentacledead = true
		secondTentacleLowWarn = nil
		self.firstTentacleHP = 1
		self.secondTentacleHP = 100
		self:Message(L["First Tentacle dead"], "Important" )
		self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
	end
end

function module:Window()
	local window = (lastspawn + timer.nextspawn) - GetTime()
	if window > 0 then
		self:Bar(L["window_bar"], window, icon.window, true, "white")
	end
end

function module:CThunStart()
	if not cthunstarted then
		cthunstarted = true
		doCheckForWipe = true
		fleshtentacledead = nil
		secondTentacleLowWarn = nil

		self:Bar(L["barStartRandomBeams"], timer.p1RandomEyeBeams, icon.giantEye, true, "Cyan")

		self:P1ClawTentacle()

		if self.db.profile.tentacle then
			self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p1TentacleStart, icon.eyeTentacles, true, "Blue")
			self:DelayedMessage(timer.p1TentacleStart - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, "Alert")
		end

		firstGlare = true
		self:DarkGlare()

		firstWarning = true

		self:DelayedSync(timer.p1TentacleStart, syncName.tentacleSpawn)
		self:ScheduleRepeatingEvent("bwcthuntarget", self.CheckTarget, timer.target, self)

		self:Proximity()
	end
end

function module:CThunP2Start()
	if not phase2started then
		fleshtentacledead = nil
		secondTentacleLowWarn = nil
		phase2started = true
		doCheckForWipe = false -- disable wipe check since we get out of combat, enable it later again
		tentacletime = timer.p2Tentacle

		self:TriggerEvent("BigWigs_StartHPBar", self, L["First Tentacle"], 100)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 0)
		self:TriggerEvent("BigWigs_StartHPBar", self, L["Second Tentacle"], 100)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 0)
		self:ScheduleRepeatingEvent("bwcthunCheckTentacleHP", self.CheckTentacleHP, timer.CheckTentacleHP, self )

		self:Message(L["phase2starting"], "Bosskill")

		-- cancel dark glare
		self:RemoveBar(L["barGlare"] )
		self:RemoveBar(L["barGlareCasting"] )
		self:RemoveBar(L["barGlareEnds"] )
		self:CancelScheduledEvent("bwcthundarkglare") -- ok
		self:CancelDelayedBar(L["barGlareEnds"])
		self:CancelDelayedBar(L["barGlare"])
		self:RemoveWarningSign(icon.darkGlare)

		-- cancel eye tentacles

		self:RemoveBar(L["barTentacle"] )
		self:RemoveBar(L["barNoRape"] )
		self:CancelDelayedMessage(self.db.profile.rape and L["tentacle"] or L["norape"])
		self:CancelDelayedSync(syncName.tentacleSpawn)

		-- cancel p1 claw tentacle
		self:RemoveBar("Claw Tentacle")

		-- cancel dark glare group warning
		self:CancelScheduledEvent("bwcthuntarget") -- ok

		self:RemoveBar(L["barStartRandomBeams"] )

		-- start P2 events
		if self.db.profile.tentacle then
			-- first eye tentacles
			self:DelayedMessage(timer.p2FirstEyeTentacles - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
			self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p2FirstEyeTentacles, icon.eyeTentacles, true, "Blue")
		end

		if self.db.profile.giant then
			self:Bar(L["barGiant"], timer.p2FirstGiantEye, icon.giantEye, true, "Cyan")
			self:DelayedMessage(timer.p2FirstGiantEye - 5, L["GiantEye"], "Urgent", false, nil, true)

			self:Bar(L["barGiantC"], timer.p2FirstGiantClaw, icon.giantClaw, true, "Black")
		end

		self:DelayedSync(timer.p2FirstEyeTentacles, syncName.tentacleSpawn)
		self:DelayedSync(timer.p2FirstGiantEye, syncName.giantEyeSpawn)
		self:DelayedSync(timer.p2FirstGiantClaw, syncName.giantClawSpawn)
		self:ScheduleRepeatingEvent("bwcthuntargetp2", self.CheckTarget, timer.target, self )

	end
	if self.db.profile.stomach then
		self:TriggerEvent("BigWigs_StartDebuffTrack", self:ToString(), "Interface\\Icons\\Ability_Creature_Disease_02", L["playersInStomach"])
	end
end

function module:CThunWeakened()
	isWeakened = true
	fleshtentacledead = nil
	secondTentacleLowWarn = nil
	self.firstTentacleHP = 100
	self.secondTentacleHP = 100
	self.warning = 100
	self:TriggerEvent("BigWigs_StopHPBar", self, L["First Tentacle"])
	self:TriggerEvent("BigWigs_StopHPBar", self, L["Second Tentacle"])
	self:ThrottleSync(0.1, syncName.weakenOver)

	if self.db.profile.weakened then
		self:Message(L["weakened"], "Positive" )
		self:Sound("Murloc")
		self:Bar(L["barWeakened"], timer.weakened, icon.weaken, true, "White")
		self:DelayedMessage(timer.weakened - 5, L["invulnerable2"], "Urgent")
	end

	-- cancel tentacle timers
	self:CancelDelayedMessage(self.db.profile.rape and L["tentacle"] or L["norape"])
	self:CancelDelayedMessage(L["GiantEye"])
	self:CancelDelayedSync(syncName.giantEyeSpawn)
	self:CancelDelayedSync(syncName.giantClawSpawn)
	self:CancelDelayedSync(syncName.tentacleSpawn)


	self:RemoveBar(L["barTentacle"])
	self:RemoveBar(L["barNoRape"])
	self:RemoveBar(L["barGiant"])
	self:RemoveBar(L["barGiantC"])

	self:DelayedSync(timer.weakened, syncName.weakenOver)
end

function module:CThunWeakenedOver()
	isWeakened = nil
	self:ThrottleSync(600, syncName.weakenOver)
	self.firstTentacleHP = 100
	self.secondTentacleHP = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, L["First Tentacle"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 0)
	self:TriggerEvent("BigWigs_StartHPBar", self, L["Second Tentacle"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 0)
		
	self:CancelDelayedSync(syncName.weakenOver) -- ok

	if self.db.profile.weakened then
		self:RemoveBar(L["barWeakened"])
		self:CancelDelayedMessage(L["invulnerable2"])

		self:Message(L["invulnerable1"], "Important")
	end

	-- next giant claw 10s after weaken
	self:Bar(L["barGiantC"], timer.p2FirstGiantClawAfterWeaken, icon.giantClaw, true, "Black")
	self:DelayedSync(timer.p2FirstGiantClawAfterWeaken, syncName.giantClawSpawn)

	-- next giant eye 40s after weaken
	self:Bar(L["barGiant"], timer.p2FirstGiantEyeAfterWeaken, icon.giantEye, true, "Cyan")
	self:DelayedSync(timer.p2FirstGiantEyeAfterWeaken, syncName.giantEyeSpawn)
	self:DelayedMessage(timer.p2FirstGiantEyeAfterWeaken - 5, L["GiantEye"], "Urgent", false, nil, true)

	--next rape party
	self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p2FirstEyeAfterWeaken, icon.eyeTentacles, true, "Blue")
	self:DelayedSync(timer.p2FirstEyeAfterWeaken, syncName.tentacleSpawn)
	self:DelayedMessage(timer.p2FirstEyeAfterWeaken - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
end

function module:DelayedEyeBeamCheck()
	local name = L["Unknown"]
	self:CheckTarget()
	if eyeTarget then
		name = eyeTarget
			
		if self.db.profile.icon and (IsRaidLeader() or IsRaidOfficer()) then
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i) == name then
					SetRaidTarget("raid"..i, 8)
				end
			end
		end
		
		if name == UnitName("player") then
			self:WarningSign(icon.eyeBeamSelf, 2 - 0.1)
			SendChatMessage("我受到眼棱攻击！", "SAY")
		else
			for i = 1, GetNumRaidMembers(), 1 do
				if name == UnitName('Raid' .. i) and CheckInteractDistance("Raid" .. i, 3) then
					self:Message("眼棱即将攻击 " .. name .. " ! 快离开！", "Important" )
				end
			end
		end
	end
	self:Bar(string.format(L["eyebeam"], name), timer.eyeBeam - 0.1, icon.giantEye, true, "green")
end

function module:EyeBeam()
	self:ScheduleEvent("CThunDelayedEyeBeamCheck", self.DelayedEyeBeamCheck, 0.1, self) -- has to be done delayed since the target change is delayed
end

function module:DigestiveAcid()
	if self.db.profile.acid then
		self:Message(L["msgDigestiveAcid"], "Red", true, "RunAway")
		self:WarningSign(icon.digestiveAcid, 5) --ability_creature_disease_02
	end
end

-----------------------
-- Utility Functions --
-----------------------
function module:CheckTentacleHP()
	local health
	if UnitName("target") == fleshtentacle and not UnitIsDeadOrGhost("target") then
		health = math.floor(UnitHealth("target")/UnitHealthMax("target")*100)
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == fleshtentacle and not UnitIsDeadOrGhost("Raid"..i.."target") then
				health = math.floor(UnitHealth("Raid"..i.."target")/UnitHealthMax("Raid"..i.."target")*100)
				break;
			end
		end
	end
	
	if secondTentacleLowWarn == true and health and health >= 20 then
		secondTentacleLowWarn = nil
		self.firstTentacleHP = 1
		self.secondTentacleHP = 100
		self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
	end
	
	if not fleshtentacledead then
		if health and health < self.firstTentacleHP then
			self.firstTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		elseif health and health > self.firstTentacleHP and health < self.secondTentacleHP then
			self.secondTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		end
	elseif fleshtentacledead then
		self.firstTentacleHP = 1
		if health and health < self.secondTentacleHP then
			self.secondTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		end
		if self.secondTentacleHP <= 20 and not secondTentacleLowWarn then
			self:Message("Second Tentacle at "..self.secondTentacleHP.."% HP")
			secondTentacleLowWarn = true
		end
	end
end

function module:CheckTarget()
	local i
	local newtarget = nil
	local enemy = eyeofcthun

	if phase2started then
		enemy = gianteye
	end
	if UnitName("target") == enemy then
		newtarget = UnitName("targettarget")
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == enemy then
				newtarget = UnitName("Raid"..i.."targettarget")
				break
			end
		end
	end
	if newtarget then
		eyeTarget = newtarget
	end
end

-- P1
function module:P1ClawTentacle()

	if phase2started then
		self:CancelScheduledEvent("bwcthunp1claw")
	else
		self:ScheduleEvent("bwcthunp1claw", self.P1ClawTentacle, 8, self )
		self:Bar("Claw Tentacle", 8, icon.giantClaw, true, "Black")
	end
end

function module:DarkGlare()
	if self.db.profile.glare then
		if firstGlare then
			self:ScheduleEvent("bwcthundarkglare", self.DarkGlare, timer.p1GlareStart, self )

			self:Bar(L["barGlare"], timer.p1GlareStart, icon.darkGlare, true, "Red")
			firstGlare = nil
		else
			self:ScheduleEvent("bwcthundarkglare", self.DarkGlare, timer.p1Glare, self )

			self:WarningSign(icon.darkGlare, timer.p1GlareCasting)
			self:Message(L["glare"], "Urgent", true, false)
			self:Bar(L["barGlareCasting"], timer.p1GlareCasting, icon.darkGlare, true, "Red")

			self:DelayedBar(timer.p1GlareCasting, L["barGlareEnds"], timer.p1GlareDuration, icon.darkGlare, true, "Red")
			self:DelayedMessage(timer.p1GlareCasting + timer.p1GlareDuration - 5, L["msgGlareEnds"], "Urgent", false, nil, true)
			self:DelayedBar(timer.p1GlareCasting + timer.p1GlareDuration, L["barGlare"], timer.p1Glare - timer.p1GlareCasting - timer.p1GlareDuration, icon.darkGlare, true, "Red")
		end
	end
end

-- P2
function module:GTentacleRape()
	self:DelayedSync(timer.p2ETentacle, syncName.giantEyeSpawn)
	if self.db.profile.giant then
		self:Bar(L["barGiant"], timer.p2ETentacle, icon.giantEye, true, "Cyan")
		self:DelayedMessage(timer.p2ETentacle - 5, L["GiantEye"], "Urgent", false, nil, true)
	end
end

function module:GCTentacleRape()
	doCheckForWipe = true
	self:DelayedSync(timer.p2GiantClaw, syncName.giantClawSpawn)
	if self.db.profile.giant then
		self:Bar(L["barGiantC"], timer.p2GiantClaw, icon.giantClaw, true, "Black")
	end
end

function module:TentacleRape()
	self:DelayedSync(tentacletime, syncName.tentacleSpawn)
	if self.db.profile.tentacle then
		self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], tentacletime, icon.eyeTentacles, true, "Blue")
		self:DelayedMessage(tentacletime - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
	end
end
