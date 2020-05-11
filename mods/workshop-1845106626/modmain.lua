_G = GLOBAL

_G.TUNING.EMERGENCY_BURNT_NUMBER = 1
_G.TUNING.EMERGENCY_BURNING_NUMBER = 1 -- number of fires to maintain warning level one automatically
_G.TUNING.EMERGENCY_WARNING_TIME = 1   -- minimum length of warning period
_G.TUNING.EMERGENCY_RESPONSE_TIME = 3 -- BURNT_NUMBER structures must burn within this time period to trigger flingomatic emergency response
_G.TUNING.EMERGENCY_SHUT_OFF_TIME = 30 -- stay on for this length of time

local whitelist_for_ice_flingomatic = {
	"campfire",
	"firepit",
	"coldfire",
	"coldfirepit",
	"nightlight",
	"pigtorch",
}

if GetModConfigData("more_fuel") ~= 1 then
	_G.TUNING.FIRESUPPRESSOR_MAX_FUEL_TIME = 480*5*GetModConfigData("more_fuel")
end

--For the mod of Deluxe Campfires 2.11
local deluxe_camfires_list = {
	"deluxe_firepit",
	"deluxe_firepit_fire",
	"endo_firepit",
	"endo_firepit_fire",
	"ice_star",
	"ice_star_flame",
	"heat_star",
	"heat_star_flame",
}

if GLOBAL.KnownModIndex:IsModEnabled("workshop-444235588") then
	for k, v in pairs(deluxe_camfires_list) do
		table.insert(whitelist_for_ice_flingomatic, v)
	end
end

--For the mod of Tropical Experience | The Volcano Biome
if GLOBAL.KnownModIndex:IsModEnabled("workshop-1505270912") then
	table.insert(whitelist_for_ice_flingomatic, "obsidianfirepit")
end

for k, v in pairs(whitelist_for_ice_flingomatic) do
	AddPrefabPostInit(v, function(inst)
		inst:AddTag("burnt")
	end)
end

--local NOTAGS = { "FX", "NOCLICK", "DECOR", "INLIMBO", "burnt", "player", "monster" }