
local module, L = BigWigs:ModuleDeclaration("Jin'do the Hexxer", "Zul'Gurub")

module.revision = 30041
module.enabletrigger = module.translatedName
module.toggleoptions = {"curse", "hex", "brainwash", "healingward", "puticon", "autotarget", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Jindo",

    brainwash_cmd = "brainwash",
    brainwash_name = "洗脑图腾警报",
    brainwash_desc = "金度召唤洗脑图腾时进行警告。",

    healingward_cmd = "healingward",
    healingward_name = "治疗图腾警报",
    healingward_desc = "金度召唤强效治疗结界时进行警告。",

    curse_cmd = "curse",
    curse_name = "诅咒警报",
    curse_desc = "玩家中了金度的妄想时进行警告。",

    hex_cmd = "hex",
    hex_name = "妖术警报",
    hex_desc = "玩家中了妖术时进行警告。",

    puticon_cmd = "puticon",
    puticon_name = "标记中了诅咒的玩家",
    puticon_desc = "在中了金度的妄想的玩家身上放置团队标志。\n\n(需要助理或更高权限)",

    autotarget_cmd = "autotarget",
    autotarget_name = "图腾自动目标",
    autotarget_desc = "图腾自动目标",

    trigger_engage = "Welcome to the great show, friends. Step right up to die!",--CHAT_MSG_MONSTER_YELL

    trigger_hexYou = "You are afflicted by Hex.",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    trigger_hexOther = "(.+) is afflicted by Hex.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    trigger_hexFades = "Hex fades from (.+).",----CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
    bar_hex = " 妖术",
    msg_hex = " 被妖术变形了！驱散它！",

    trigger_curseYou = "You are afflicted by Delusions of Jin'do.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_curseYou = "你被诅咒了！击杀幻影！",
    trigger_curseOther = "(.+) is afflicted by Delusions of Jin'do.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    bar_curse = " 受到诅咒",
    trigger_curseFade = "Delusions of Jin'do fades from (.*).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF

    trigger_curseDispel = "Delusions of Jin'do is removed.",--CHAT_MSG_SPELL_BREAK_AURA
    msg_curseDispel = "金度的妄想被解除了！",

    trigger_brainWash = "Jin'do the Hexxer casts Summon Brain Wash Totem.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    msg_brainWash = "洗脑图腾！",
    --trigger_brainWashDeath = "Brain Wash Totem is destroyed.",--CHAT_MSG_COMBAT_HOSTILE_DEATH

    trigger_healingWard = "Jin'do the Hexxer casts Powerful Healing Ward.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    msg_healingWard = "治疗图腾！",
    --trigger_healingWardDeath = "Powerful Healing Ward is destroyed.",--CHAT_MSG_COMBAT_HOSTILE_DEATH
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
    cmd = "Jindo",

    brainwash_cmd = "brainwash",
    brainwash_name = "洗脑图腾警报",
    brainwash_desc = "金度召唤洗脑图腾时进行警告。",

    healingward_cmd = "healingward",
    healingward_name = "治疗图腾警报",
    healingward_desc = "金度召唤强效治疗结界时进行警告。",

    curse_cmd = "curse",
    curse_name = "诅咒警报",
    curse_desc = "玩家中了金度的妄想时进行警告。",

    hex_cmd = "hex",
    hex_name = "妖术警报",
    hex_desc = "玩家中了妖术时进行警告。",

    puticon_cmd = "puticon",
    puticon_name = "标记中了诅咒的玩家",
    puticon_desc = "在中了金度的妄想的玩家身上放置团队标志。\n\n(需要助理或更高权限)",

    autotarget_cmd = "autotarget",
    autotarget_name = "图腾自动目标",
    autotarget_desc = "图腾自动目标",

    trigger_engage = "Welcome to the great show, friends. Step right up to die!",--CHAT_MSG_MONSTER_YELL

    trigger_hexYou = "You are afflicted by Hex.",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    trigger_hexOther = "(.+) is afflicted by Hex.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    trigger_hexFades = "Hex fades from (.+).",----CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
    bar_hex = " 妖术",
    msg_hex = " 被妖术变形了！驱散它！",

    trigger_curseYou = "You are afflicted by Delusions of Jin'do.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_curseYou = "你被诅咒了！击杀幻影！",
    trigger_curseOther = "(.+) is afflicted by Delusions of Jin'do.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    bar_curse = " 受到诅咒",
    trigger_curseFade = "Delusions of Jin'do fades from (.*).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF

    trigger_curseDispel = "Delusions of Jin'do is removed.",--CHAT_MSG_SPELL_BREAK_AURA
    msg_curseDispel = "金度的妄想被解除了！",

    trigger_brainWash = "Jin'do the Hexxer casts Summon Brain Wash Totem.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    msg_brainWash = "洗脑图腾！",
    --trigger_brainWashDeath = "Brain Wash Totem is destroyed.",--CHAT_MSG_COMBAT_HOSTILE_DEATH

    trigger_healingWard = "Jin'do the Hexxer casts Powerful Healing Ward.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    msg_healingWard = "治疗图腾！",
    --trigger_healingWardDeath = "Powerful Healing Ward is destroyed.",--CHAT_MSG_COMBAT_HOSTILE_DEATH
} end )

local timer = {
	hexDuration = 5,
	curseDuration = 20,
}
local icon = {
	hex = "Spell_Nature_Polymorph",
	curse = "Spell_Shadow_UnholyFrenzy",
	brainWash = "Spell_Totem_WardOfDraining",
	healingWard = "Spell_Holy_LayOnHands",
}
local syncName = {
	hex = "JindoHexStart"..module.revision,
	hexFade = "JindoHexStop"..module.revision,
	curse = "JindoCurse"..module.revision,
	curseFade = "JindoCurseStop"..module.revision,
	curseDispel = "JindoCurseDispel"..module.revision,
	brainWash = "JindoBrainWash"..module.revision,
	healingWard = "JindoHealingWard"..module.revision,
}

module:RegisterYellEngage(L["trigger_engage"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")--summon totems
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--hexYou
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--hexFade, curseFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--hexFade, curseFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--hexFade, curseFade
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--curseYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--curseOther, hexOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--curseOther, hexOther
	self:RegisterEvent("CHAT_MSG_SPELL_BREAK_AURA", "Event")--curseDispel

	self:ThrottleSync(3, syncName.hex)
	self:ThrottleSync(3, syncName.hexFade)
	self:ThrottleSync(3, syncName.curse)
	self:ThrottleSync(3, syncName.curseFade)
	self:ThrottleSync(3, syncName.curseDispel)
	self:ThrottleSync(3, syncName.brainWash)
	self:ThrottleSync(3, syncName.healingWard)
end

function module:OnSetup()
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_hexYou"] then
		self:Sync(syncName.hex.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_hexOther"]) then
		local _, _, hexPlayer = string.find(msg, L["trigger_hexOther"])
		self:Sync(syncName.hex.." "..hexPlayer)
	
	elseif string.find(msg, L["trigger_hexFades"]) then
		local _, _, hexFadePlayer = string.find(msg, L["trigger_hexFades"])
		self:Sync(syncName.hexFade.." "..hexFadePlayer)
		
		
		
	elseif msg == L["trigger_curseYou"] then
		self:Sync(syncName.curse.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_curseOther"]) then
		local _, _, cursedPlayer = string.find(msg, L["trigger_curseOther"])
		self:Sync(syncName.curse.." "..cursedPlayer)
	
	elseif string.find(msg, L["trigger_curseFade"]) then
		local _, _, curseFadePlayer = string.find(msg, L["trigger_curseFade"])
		self:Sync(syncName.curseFade.." "..curseFadePlayer)
	
	elseif string.find(msg, L["trigger_curseDispel"]) then
		self:Sync(syncName.curseDispel)
	
	
	
	elseif msg == L["trigger_brainWash"] then
		self:Sync(syncName.brainWash)
	elseif msg == L["trigger_healingWard"] then
		self:Sync(syncName.healingWard)
	end
end



function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.hex and self.db.profile.hex and rest then
		self:Hex(rest)
	elseif sync == syncName.hexFade and self.db.profile.hex and rest then
		self:HexFade(rest)
	
	elseif sync == syncName.curse and self.db.profile.curse and rest then
		self:Curse(rest)
	elseif sync == syncName.curseFade and self.db.profile.curse and rest then
		self:CurseFade(rest)
	elseif sync == syncName.curseDispel then
		self:CurseDispel()
		
	elseif sync == syncName.brainWash and self.db.profile.brainwash then
		self:BrainWash()
	elseif sync == syncName.healingWard and self.db.profile.healingward then
		self:HealingWard()
	end
end



function module:Curse(rest)
	if rest == UnitName("player") then
		self:WarningSign(icon.curse, 1)
		self:Message(L["msg_curseYou"], "Personal", true, "Beware")
	end
	
	if self.db.profile.puticon then
		self:Icon(rest)
	end
	
	self:Bar(rest..L["bar_curse"], timer.curseDuration, icon.curse, true, "Blue")
end

function module:CurseFade(rest)
	self:RemoveBar(rest..L["bar_curse"])
end

function module:CurseDispel()
	self:Message(L["msg_curseDispel"], "Urgent")
end

function module:Hex(rest)
	if UnitClass("Player") == "Paladin" then
		self:WarningSign(icon.hex, 0.7)
	elseif UnitClass("Player") == "Priest" then
		self:WarningSign(icon.hex, 0.7)
	end
	
	self:Bar(rest..L["bar_hex"], timer.hexDuration, icon.hex, true, "Green")
	self:Message(rest..L["msg_hex"], "Important")
end

function module:HexFade(rest)
	self:RemoveBar(rest..L["bar_hex"])
end

function module:BrainWash()
	self:WarningSign(icon.brainWash, 0.7)
	self:Message(L["msg_brainWash"], "Attention", true, "Alarm")
	
	if UnitName("Target") == "Jin'do the Hexxer" and UnitName("TargetTarget") == UnitName("Player") then return end
	
	if UnitName("Target") == "Shade of Jin'do" then return end
	
	if UnitClass("Player") == "Warrior" and self.db.profile.autotarget then
		TargetByName("Brain Wash Totem", true)
	elseif UnitClass("Player") == "Rogue" and self.db.profile.autotarget then
		TargetByName("Brain Wash Totem", true)
	elseif UnitClass("Player") == "Hunter" and self.db.profile.autotarget then
		TargetByName("Brain Wash Totem", true)
	elseif UnitClass("Player") == "Mage" and self.db.profile.autotarget then
		TargetByName("Brain Wash Totem", true)
	elseif UnitClass("Player") == "Warlock" and self.db.profile.autotarget then
		TargetByName("Brain Wash Totem", true)
	elseif UnitClass("Player") == "Warrior" and self.db.profile.autotarget then
		TargetByName("Brain Wash Totem", true)
	end
end

function module:HealingWard()
	self:WarningSign(icon.healingWard, 0.7)
	self:Message(L["msg_healingWard"], "Attention", true, "Alarm")
	
	if UnitName("Target") == "Brain Wash Totem" then return end
	if UnitName("Target") == "Jin'do the Hexxer" and UnitName("TargetTarget") == UnitName("Player") then return end
	
	if UnitClass("Player") == "Warrior" and self.db.profile.autotarget then
		TargetByName("Powerful Healing Ward", true)
	elseif UnitClass("Player") == "Rogue" and self.db.profile.autotarget then
		TargetByName("Powerful Healing Ward", true)
	elseif UnitClass("Player") == "Hunter" and self.db.profile.autotarget then
		TargetByName("Powerful Healing Ward", true)
	elseif UnitClass("Player") == "Mage" and self.db.profile.autotarget then
		TargetByName("Powerful Healing Ward", true)
	elseif UnitClass("Player") == "Warlock" and self.db.profile.autotarget then
		TargetByName("Powerful Healing Ward", true)
	elseif UnitClass("Player") == "Warrior" and self.db.profile.autotarget then
		TargetByName("Powerful Healing Ward", true)
	end
end
