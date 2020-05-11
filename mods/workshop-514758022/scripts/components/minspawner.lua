local prefabs = {
	--plants
	"berrybush","berrybush2","berrybush_juicy","carrot_planted","evergreen","deciduoustree","marsh_tree","evergreen_sparse","livingtree",
	"twiggytree","flower","flower_evil","grass","mandrake","blue_mushroom","red_mushroom","green_mushroom","reeds","sapling","marsh_bush",
	"cactus",
	--mods and mob housing
	"beehive","wasphive","houndmound","pighouse","mermhouse","spiderden","tallbirdnest","molehill","catcoonden","tentacle","beefalo",
	"lightninggoat","rabbithole","fireflies","knight","bishop","rook","grassgekko",
	--inanimate
	"rock1","rock2","rock_flintless","marblepillar","marbletree","pighead","skeleton","resurrectionstone","flint","houndbone",
}

local tilefns = {}
tilefns.berrybush = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST) end
tilefns.berrybush2 = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST) end
tilefns.berrybush_juicy = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST) end
tilefns.carrot_planted = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST or tile == GROUND.DECIDUOUS) end
tilefns.evergreen = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST) end
tilefns.deciduoustree = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST or tile == GROUND.DECIDUOUS) end
tilefns.marsh_tree = function(tile) return (tile == GROUND.MARSH) end
tilefns.evergreen_sparse = function(tile) return (tile == GROUND.FOREST) end
tilefns.livingtree = function(tile) return (tile == GROUND.FOREST) end
tilefns.twiggytree = function(tile) return (tile == GROUND.FOREST) end
tilefns.flower = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST or tile == GROUND.DECIDUOUS) end
tilefns.flower_evil = function(tile) return (tile == GROUND.FOREST or tile == GROUND.CARPET or tile == GROUND.CHECKER) end
tilefns.grass = function(tile) return (tile == GROUND.SAVANNA or tile == GROUND.GRASS) end
tilefns.mandrake = function(tile) return (tile == GROUND.GRASS) end
tilefns.blue_mushroom = function(tile) return (tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.DECIDUOUS) end
tilefns.red_mushroom = function(tile) return (tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.DECIDUOUS) end
tilefns.green_mushroom = function(tile) return (tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.DECIDUOUS) end
tilefns.reeds = function(tile) return (tile == GROUND.MARSH) end
tilefns.sapling = function(tile) return (tile == GROUND.FOREST or tile == GROUND.GRASS or tile == GROUND.DECIDUOUS) end
tilefns.marsh_bush = function(tile) return (tile == GROUND.MARSH) end
tilefns.cactus = function(tile) return (tile == GROUND.DESERT_DIRT) end
tilefns.beehive = function(tile) return (tile == GROUND.GRASS) end
tilefns.wasphive = function(tile) return (tile == GROUND.GRASS) end
tilefns.houndmound = function(tile) return (tile == GROUND.DESERT_DIRT) end
tilefns.pighouse = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST or tile == GROUND.DECIDUOUS) end
tilefns.mermhouse = function(tile) return (tile == GROUND.MARSH) end
tilefns.spiderden = function(tile) return (tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.SAVANNA or tile == GROUND.ROCKY) end
tilefns.tallbirdnest = function(tile) return (tile == GROUND.ROCKY) end
tilefns.molehill = function(tile) return (tile == GROUND.GRASS or tile == GROUND.DECIDUOUS or tile == GROUND.FOREST) end
tilefns.catcoonden = function(tile) return (tile == GROUND.DECIDUOUS) end
tilefns.rock1 = function(tile) return (tile == GROUND.GRASS or tile == GROUND.DESERT_DIRT or tile == GROUND.FOREST or tile == GROUND.DECIDUOUS or tile == GROUND.DIRT or tile == GROUND.ROCKY) end
tilefns.rock2 = function(tile) return (tile == GROUND.DIRT or tile == GROUND.DESERT_DIRT or tile == GROUND.FOREST or tile == GROUND.DECIDUOUS or tile == GROUND.ROCKY) end
tilefns.rock_flintless = function(tile) return (tile == GROUND.DESERT_DIRT or tile == GROUND.DIRT) end
tilefns.marbletree = function(tile) return (tile == GROUND.ROCKY) end
tilefns.marblepillar = function(tile) return (tile == GROUND.ROCKY) end
tilefns.pighead = function(tile) return (tile == GROUND.MARSH) end
tilefns.skeleton = function(tile) return (tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.ROCKY or tile == GROUND.SAVANNA or tile == GROUND.FOREST or tile == GROUND.DIRT or tile == GROUND.DECIDUOUS or tile == GROUND.DESERT_DIRT) end
tilefns.resurrectionstone = function(tile) return (tile == GROUND.ROCKY or tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.SAVANNA or tile == GROUND.DIRT or tile == GROUND.DECIDUOUS or tile == GROUND.DESERT_DIRT) end
tilefns.flint = function(tile) return (tile == GROUND.GRASS or tile == GROUND.ROCKY or tile == GROUND.DIRT or tile == GROUND.DESERT_DIRT or tile == GROUND.FOREST) end
tilefns.tentacle = function(tile) return (tile == GROUND.MARSH) end
tilefns.beefalo = function(tile) return (tile == GROUND.SAVANNA) end
tilefns.lightninggoat = function(tile) return (tile == GROUND.DIRT or tile == GROUND.DESERT_DIRT) end
tilefns.rabbithole = function(tile) return (tile == GROUND.GRASS or tile == GROUND.SAVANNA) end
tilefns.houndbone = function(tile) return (tile == GROUND.DIRT or tile == GROUND.DESERT_DIRT) end
tilefns.fireflies = function(tile) return (tile == GROUND.DECIDUOUS or tile == GROUND.GRASS or tile == GROUND.FOREST) end
tilefns.knight = function(tile) return (tile == GROUND.FOREST) end
tilefns.bishop = function(tile) return (tile == GROUND.FOREST) end
tilefns.rook = function(tile) return (tile == GROUND.FOREST) end
tilefns.grassgekko = function(tile) return (tile == GROUND.ROCKY) end

function c_countprefabsonground(prefab, noprint)
	local count = 0
	for k, v in pairs(Ents) do
		local owner = v.components.inventoryitem and v.components.inventoryitem.owner
		if owner == nil then
			if v.prefab == prefab then
				count = count + 1
			end
		end
	end
	if not noprint then
		print("There are ", count, prefab.."s in the world's ground.")
	end
	return count
end

local function TrySpawn(strfab)
	local pt = Vector3(math.random(-1000, 1000), 0, math.random(-1000, 1000))
	local tile = TheWorld.Map:GetTileAtPoint(pt.x, pt.y, pt.z)
	local canspawn = tile ~= GROUND.IMPASSABLE and tile ~= GROUND.INVALID and tile ~= 255
	local tilecheck = tilefns[strfab]
	canspawn = canspawn and tilecheck(tile)
	if canspawn then
		print(strfab, "spawned!")
		local b = SpawnPrefab(strfab)
		b.Transform:SetPosition(pt:Get())
	else
		TrySpawn(strfab)
	end
end

local function updateWorld(self)
	for k, v in pairs(prefabs) do
		local min_num = self.minprefs[v]
		local count = c_countprefabsonground(v, true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn(v)
			end
		end
	end
end

-- This function waits until the Ents table is initialized
-- Here's the kick: the data is loaded BEFORE we can read the Ents table
-- So first we wait until the Ents table loads
-- After it loads, we check that no data of ours was loaded
-- If minprefs is empty, then we put the minimum numbers
local function updatePrefabs(self)
	local next = next
	if next(Ents) == nil then
		self.inst:DoTaskInTime(0, function() updatePrefabs(self) end)
	else
		if next(self.minprefs) == nil then
			for k, v in pairs(prefabs) do
				local c = c_countprefabsonground(v, true)
				self.minprefs[v] = c
			end
		end
	end
end


local MinSpawner = Class(function(self, inst)
	self.inst = inst
	self.minprefs = {}

	inst:ListenForEvent("ms_cyclecomplete", function() updateWorld(self) end)
	inst:DoTaskInTime(0, function() updatePrefabs(self) end)
end)

function MinSpawner:OnSave()
	local data = {}
	for k, v in pairs(self.minprefs) do
		data[k] = v
	end
	return data
end

function MinSpawner:OnLoad(data)
	if data then
		for k, v in pairs(data) do
			self.minprefs[k] = v
		end
	end
end

return MinSpawner
