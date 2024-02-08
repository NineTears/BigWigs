
local module, L = BigWigs:ModuleDeclaration("Qiraji Champion", "Ahn'Qiraj")

module.revision = 20046
module.enabletrigger = module.translatedName
module.toggleoptions = {"fear"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
	cmd = "Champion",

	fear_cmd = "fear",
	fear_name = "破胆怒吼警报",
	fear_desc = "破胆怒吼出现时进行警告",
	
	fear_trigger = "afflicted by Intimidating Shout",
	fear_trigger2 = "Qiraji Champion's Intimidating Shout was resisted",
	fear_trigger3 = "Qiraji Champion's Intimidating Shout fail",
	fear_bar = "破胆怒吼冷却",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
	cmd = "Champion",

	fear_cmd = "fear",
	fear_name = "破胆怒吼警报",
	fear_desc = "破胆怒吼出现时进行警告",
	
	fear_trigger = "afflicted by Intimidating Shout",
	fear_trigger2 = "Qiraji Champion's Intimidating Shout was resisted",
	fear_trigger3 = "Qiraji Champion's Intimidating Shout fail",
	fear_bar = "破胆怒吼冷却",
} end )

local timer = {
	fear = 14,
}

local icon = {
	fear = "ability_golemthunderclap",
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_OTHER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:Event(msg)
	if string.find(msg, L["fear_trigger"]) or string.find(msg, L["fear_trigger2"]) or string.find(msg, L["fear_trigger3"]) then
		self:Bar(string.format(L["fear_bar"]), timer.fear, icon.fear, true, "blue")
	end
end
