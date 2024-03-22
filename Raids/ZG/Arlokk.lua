
local module, L = BigWigs:ModuleDeclaration("High Priestess Arlokk", "Zul'Gurub")

module.revision = 30027
module.enabletrigger = module.translatedName
module.toggleoptions = {"phase", "whirlwind", "vanish", "mark", "puticon", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Arlokk",

    vanish_cmd = "vanish",
    vanish_name = "消失警报",
    vanish_desc = "显示消失持续时间的计时条。",

    mark_cmd = "mark",
    mark_name = "娅尔罗印记警报",
    mark_desc = "玩家被标记时进行警告",

    whirlwind_cmd = "whirlwind",
    whirlwind_name = "旋风斩警报",
    whirlwind_desc = "显示Boss拥有旋风斩时。",

    phase_cmd = "phase",
    phase_name = "阶段提示",
    phase_desc = "通报Boss阶段转换。",

    puticon_cmd = "puticon",
    puticon_name = "标记获得娅尔罗印记的玩家",
    puticon_desc = "在获得娅尔罗印记的玩家身上放置团队标志。\n\n（需要助理或更高权限）",

    trigger_engage = "Bethekk, your priestess calls upon your might!",--CHAT_MSG_MONSTER_YELL

    trigger_mark = "(.+) is afflicted by Mark of Arlokk.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    trigger_markYou = "You are afflicted by Mark of Arlokk.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_mark = " 被标记了！",
    bar_mark = " 被标记",

    trigger_markFade = "Mark of Arlokk fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF

    trigger_ww = "High Priestess Arlokk's Whirlwind",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_ww = "旋风斩",

    msg_trollPhase = "巨魔阶段",
    msg_pantherPhase = "猎豹阶段",
    msg_vanishPhase = "消失！",
    bar_return = "预计返回",
    bar_nextVanish = "下一次消失",
    clickme = " >点击我！<",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-03-22
    cmd = "Arlokk",

    vanish_cmd = "vanish",
    vanish_name = "消失警报",
    vanish_desc = "显示消失持续时间的计时条。",

    mark_cmd = "mark",
    mark_name = "娅尔罗印记警报",
    mark_desc = "玩家被标记时进行警告",

    whirlwind_cmd = "whirlwind",
    whirlwind_name = "旋风斩警报",
    whirlwind_desc = "显示Boss拥有旋风斩时。",

    phase_cmd = "phase",
    phase_name = "阶段提示",
    phase_desc = "通报Boss阶段转换。",

    puticon_cmd = "puticon",
    puticon_name = "标记获得娅尔罗印记的玩家",
    puticon_desc = "在获得娅尔罗印记的玩家身上放置团队标志。\n\n（需要助理或更高权限）",

    trigger_engage = "Bethekk, your priestess calls upon your might!",--CHAT_MSG_MONSTER_YELL

    trigger_mark = "(.+) is afflicted by Mark of Arlokk.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    trigger_markYou = "You are afflicted by Mark of Arlokk.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_mark = " 被标记了！",
    bar_mark = " 被标记",

    trigger_markFade = "Mark of Arlokk fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF

    trigger_ww = "High Priestess Arlokk's Whirlwind",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_ww = "旋风斩",

    msg_trollPhase = "巨魔阶段",
    msg_pantherPhase = "猎豹阶段",
    msg_vanishPhase = "消失！",
    bar_return = "预计返回",
    bar_nextVanish = "下一次消失",
    clickme = " >点击我！<",
} end )

local timer = {
	firstVanish = 35,
	vanish = 75,
	unvanish = 35,
	ww = 16,
	mark = 120,
}
local icon = {
	vanish = "Ability_Vanish",
	ww = "Ability_Whirlwind",
	mark = "Ability_Hunter_Snipershot",
}
local syncName = {
	vanishPhase = "ArlokkPhaseVanish"..module.revision,
	pantherPhase = "ArlokkPhasePanther"..module.revision,
	mark = "ArlokkMark"..module.revision,
	markFade = "ArlokkMarkFade"..module.revision,
	ww = "ArlokkWhirlwind"..module.revision,
}

module:RegisterYellEngage(L["trigger_engage"])

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --debug
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--ww
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--ww
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--ww
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--markFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--markFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--markFade
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--markOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--markOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--markYou
	
	self:ThrottleSync(3, syncName.vanishPhase)
	self:ThrottleSync(3, syncName.pantherPhase)
	self:ThrottleSync(5, syncName.mark)
	self:ThrottleSync(5, syncName.markFade)
	self:ThrottleSync(5, syncName.ww)
end

function module:OnSetup()
	self.started = nil
	vanished = nil
end

function module:OnEngage()
	self:CancelScheduledEvent("checkvanish")
	self:ScheduleRepeatingEvent("checkvanish", self.CheckVanish, 1, self)

	self:Bar(L["bar_nextVanish"], timer.firstVanish, icon.vanish, true, "White")
end

function module:OnDisengage()
end

function module:Event(msg)
	if string.find(msg, L["trigger_mark"]) then
		local _,_, markedPlayer = string.find(msg, L["trigger_mark"])
		self:Sync(syncName.mark.." "..markedPlayer)
	
	elseif msg == L["trigger_markYou"] then
		self:Sync(syncName.mark.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_markFade"]) then
		local _,_, markFadePlayer = string.find(msg, L["trigger_markFade"])
		self:Sync(syncName.markFade.." "..markFadePlayer)
	
	
	elseif string.find(msg, L["trigger_ww"]) then
		self:Sync(syncName.ww)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.pantherPhase then
		self:PantherPhase()
	elseif sync == syncName.vanishPhase then
		self:VanishPhase()
	elseif sync == syncName.mark and rest and self.db.profile.mark then
		self:Mark(rest)
	elseif sync == syncName.markFade and rest and self.db.profile.mark then
		self:MarkFade(rest)
	elseif sync == syncName.ww and self.db.profile.whirlwind then
		self:Whirlwind()
	end
end



function module:Mark(rest)
	self:Message(rest..L["msg_mark"], "Attention")

	self:Bar(rest..L["bar_mark"].. L["clickme"], timer.mark, icon.mark, true, "Green")
	self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_mark"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)

	for i=1,GetNumRaidMembers() do
		if UnitName("raid"..i) == rest then
			SetRaidTarget("raid"..i, 8)
		end
	end
end

function module:MarkFade(rest)
	self:RemoveBar(rest..L["bar_mark"].. L["clickme"])
end

function module:Whirlwind()
	self:Bar(L["bar_ww"], timer.ww, icon.ww, true, "Blue")
end

function module:PantherPhase()
	vanished = false
	self:CancelScheduledEvent("checkunvanish")
	if self.db.profile.vanish then
		self:RemoveBar(L["bar_return"])
		self:Bar(L["bar_nextVanish"], timer.vanish, icon.vanish, true, "White")
	end
	if self.db.profile.phase then
		self:Message(L["msg_pantherPhase"], "Attention")
	end

	if not vanished then
		self:ScheduleRepeatingEvent("checkvanish", self.CheckVanish, 0.5, self)
	end
end

function module:VanishPhase()
	vanished = true
	self:CancelScheduledEvent("checkvanish")
	self:RemoveBar(L["bar_ww"])
	if self.db.profile.phase then
		self:Message(L["msg_vanishPhase"], "Attention")
	end
	if self.db.profile.vanish then
		self:RemoveBar(L["bar_nextVanish"])
		self:Bar(L["bar_return"], timer.unvanish, icon.vanish, true, "White")
	end
	self:ScheduleRepeatingEvent("checkunvanish", self.CheckUnvanish, 0.5, self)
end

function module:CheckUnvanish()
	self:DebugMessage("CheckUnvanish")
	if module:IsArlokkVisible() then
		self:Sync(syncName.pantherPhase)
	end
end

function module:CheckVanish()
	self:DebugMessage("CheckVanish")
	if not module:IsArlokkVisible() then
		self:Sync(syncName.vanishPhase)
	end
end

function module:IsArlokkVisible()
	if UnitName("playertarget") == self.translatedName then
		return true
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == self.translatedName then
				return true
			end
		end
	end

	return false
end
