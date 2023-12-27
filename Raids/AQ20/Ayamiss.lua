
local module, L = BigWigs:ModuleDeclaration("Ayamiss the Hunter", "Ruins of Ahn'Qiraj")

module.revision = 30027
module.enabletrigger = module.translatedName
module.toggleoptions = {"bigicon", "sacrifice", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Ayamiss",

	sacrifice_cmd = "sacrifice",
	sacrifice_name = "祭品警报",
	sacrifice_desc = "被作为祭品时发出警报",
	
	bigicon_cmd = "bigicons",
	bigicon_name = "击杀幼虫时显示图标警报",
	bigicon_desc = "当幼虫产生时显示大图标警报",
	
	sacrificeother_trigger = "(.*) is afflicted by Paralyze.",
	sacrificeyou_trigger = "(.*) are afflicted by Paralyze.",
	sacrificeend_trigger = "Paralyze fades from",
	
	larva_bar = "幼虫 >点我!<",
	nextlarva_bar = "幼虫/牺牲 冷却",
	
	msg_sacrifice = " 牺牲，击杀幼虫!",
	
	p2_msg = "第二阶段",

	larvaname = "佐拉幼虫",	
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2023-12-21
	cmd = "Ayamiss",

	sacrifice_cmd = "sacrifice",
	sacrifice_name = "祭品警报",
	sacrifice_desc = "被作为祭品时发出警报",
	
	bigicon_cmd = "bigicons",
	bigicon_name = "击杀幼虫时显示图标警报",
	bigicon_desc = "当幼虫产生时显示大图标警报",
	
	sacrificeother_trigger = "(.*) is afflicted by Paralyze.",
	sacrificeyou_trigger = "(.*) are afflicted by Paralyze.",
	sacrificeend_trigger = "Paralyze fades from",
	
	larva_bar = "幼虫 >点我!<",
	nextlarva_bar = "幼虫/牺牲 冷却",
	
	msg_sacrifice = " 牺牲，击杀幼虫!",
	
	p2_msg = "第二阶段",

	larvaname = "佐拉幼虫",	
} end )

local timer = {
	sacrifice = 10,
	larvacd = 14,
}

local icon = {
	sacrifice = "ability_creature_poison_05",
}

local syncName = {
	sacrifice = "AyamissSacrifice"..module.revision,
	p2 = "AyamissP2"..module.revision,
	larvaend = "AyamissLarvaEnd"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("UNIT_HEALTH")
	
	self:ThrottleSync(5, syncName.sacrifice)
	self:ThrottleSync(5, syncName.p2)
	self:ThrottleSync(3, syncName.larvaend)
end

function module:OnSetup()
self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	local p2 = nil
	self:Bar(L["nextlarva_bar"], timer.larvacd, icon.sacrifice, true, "white")
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)
	if msg == string.format(UNITDIESOTHER, L["larvaname"]) then
		self:Sync(syncName.larvaend)
	end
end

function module:UNIT_HEALTH(arg1)
	if UnitName(arg1) == module.translatedName then
		local health = UnitHealth(arg1)
		if health > 65 and health <= 70 and not p2 then
			self:Sync(syncName.p2)
			p2 = true
		elseif health > 70 and p2 then
			p2 = nil
		end
	end
end

function module:Event(msg)
	local _,_,sacrificeother = string.find(msg, L["sacrificeother_trigger"])
	if string.find(msg, L["sacrificeyou_trigger"]) then
		self:Sync(syncName.sacrifice.." "..UnitName("player"))
	elseif sacrificeother then
		self:Sync(syncName.sacrifice.." "..sacrificeother)
	end
	if string.find(msg, L["sacrificeend_trigger"]) then
		self:Sync(syncName.larvaend)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.sacrifice and rest and self.db.profile.sacrifice then
		self:Sacrifice(rest)
	elseif sync == syncName.p2 then
		self:Phase2()
	elseif sync == syncName.larvaend and self.db.profile.sacrifice then
		self:LarvaEnd()
	end
end

function module:Sacrifice(rest)
	self:Message(rest..L["msg_sacrifice"], "Urgent", false, "Beware")
	self:Bar(L["larva_bar"], timer.larva, icon.sacrifice, true, "red")
	self:SetCandyBarOnClick("BigWigsBar "..L["larva_bar"], function(name, button, extra) TargetByName("Hive'Zara Larva", true) end, rest)
	
	if self.db.profile.bigicon then
		self:WarningSign(icon.sacrifice, 0.7)
	end
	
	bwPlayerIsAttacking = nil
	if IsRaidLeader() or IsRaidOfficer() then
		if UnitClass("Player") ~= "Rogue" and UnitClass("Player") ~= "Druid" then
			if PlayerFrame.inCombat then
				bwPlayerIsAttacking = true
			end
			
			TargetByName(rest,true)
			SetRaidTarget("target",8)
			TargetLastTarget()
			if bwPlayerIsAttacking then
				AttackTarget()
			end
		end
	end
	
	self:Bar(L["nextlarva_bar"], timer.larvacd, icon.sacrifice, true, "white")
end

function module:Phase2()
	self:Message(L["p2_msg"], "Attention")
	p2 = true
end

function module:LarvaEnd()
	self:RemoveBar(L["larva_bar"])
end