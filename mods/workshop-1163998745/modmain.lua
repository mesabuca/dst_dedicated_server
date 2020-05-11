STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH
local TUNING = GLOBAL.TUNING
local ACTIONS = GLOBAL.ACTIONS
local Action = GLOBAL.Action
local ActionHandler = GLOBAL.ActionHandler 
local require = GLOBAL.require

local AllRecipes = GLOBAL.AllRecipes

local GetValidRecipe = GLOBAL.GetValidRecipe
local RECIPETABS = GLOBAL.RECIPETABS

local TheInput = GLOBAL.TheInput
local ThePlayer = GLOBAL.ThePlayer
local IsServer = GLOBAL.TheNet:GetIsServer()


all_clients_require_mod = true 

PrefabFiles = {
	"goat_milker",
	"shocking_dingy",
	"shocking_dingy_charge",
}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

STRINGS.NAMES.GOAT_MILKER = "Goat Milker"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GOAT_MILKER = "Can be used to milk goats."
STRINGS.CHARACTERS.WX78.DESCRIBE.GOAT_MILKER = "TO GATHER SECRETIONS."
STRINGS.RECIPE_DESC.GOAT_MILKER = "Got milk?"

STRINGS.NAMES.SHOCKING_DINGY = "Shocking Dingy"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SHOCKING_DINGY = "It let's out a small electrical charge."
STRINGS.CHARACTERS.WX78.DESCRIBE.SHOCKING_DINGY = "A BURST OF ELECTRICAL ENERGY."
STRINGS.RECIPE_DESC.SHOCKING_DINGY = "Tase something."

-- =====================================
-- =====================================

AddRecipe("goat_milker", 
{Ingredient("log", 4), Ingredient("transistor", 1)}, 
RECIPETABS.FARM, TECH.SCIENCE_ONE, nil, nil, nil, nil, nil, "images/inventoryimages/goat_milker.xml", "goat_milker.tex")	

AddRecipe("shocking_dingy", 
{Ingredient("cutstone", 2), Ingredient("transistor", 2), Ingredient("goldnugget", 4)}, 
RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/shocking_dingy.xml", "shocking_dingy.tex")

AddAction("GOATMILKING", "Milk", function(act)
	if not act.target:HasTag("lightninggoat") or not act.target:HasTag("charged") then
		act.doer.components.talker:Say("The goat has to be charged first.")
		return true
	end
		
	local loot = nil
	if act.doer ~= nil and act.doer.components.inventory ~= nil then
		loot = GLOBAL.SpawnPrefab("goatmilk")
		if loot ~= nil then
			act.doer:PushEvent("picksomething", { object = act.target, loot = loot })
			act.doer.components.inventory:GiveItem(loot, nil, act.target:GetPosition())
			act.invobject.components.finiteuses:Use(1)
			return true
		end
	end
end)
AddAction("DINGYSHOCKING", "Shock Self", function(act)
	local pt = act.doer:GetPosition()
	act.doer:StartThread(function()
		local pos = pt
		GLOBAL.TheWorld:PushEvent("ms_sendlightningstrike", pos)
		GLOBAL.Sleep(.3 + math.random() * .2)
	end)
	act.invobject.components.finiteuses:Use(1)
	return true
end)

AddStategraphActionHandler("wilson", ActionHandler(GLOBAL.ACTIONS.GOATMILKING, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(GLOBAL.ACTIONS.GOATMILKING, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(GLOBAL.ACTIONS.DINGYSHOCKING, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(GLOBAL.ACTIONS.DINGYSHOCKING, "dolongaction"))

AddComponentAction("USEITEM", "goatmilking", function(inst, doer, target, actions)
	if target:HasTag("lightninggoat") then
		table.insert(actions, GLOBAL.ACTIONS.GOATMILKING)
	end
end)
AddComponentAction("INVENTORY", "dingyshocking", function(inst, doer, actions, right)
	table.insert(actions, GLOBAL.ACTIONS.DINGYSHOCKING)
end)