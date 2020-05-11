local function IsDST()
	return GLOBAL.TheSim:GetGameID() == "DST"
end

local function RespawnMandrake(user)
	local pt = GLOBAL.Vector3(user.Transform:GetWorldPosition())
	local spawn_pt
	local theta = math.random() * 2 * math.pi
	local radius = GetModConfigData("dist")
	local offset = GLOBAL.FindWalkableOffset(pt, theta, radius, 12, true)
	if offset then
		spawn_pt = pt + offset
	end
	if spawn_pt then
		local mandrake
		if IsDST() then
			mandrake = GLOBAL.SpawnPrefab("mandrake_planted")
		else
			mandrake = GLOBAL.SpawnPrefab("mandrake")
		end
		if mandrake then
			mandrake.Physics:Teleport(spawn_pt:Get())
			mandrake:FacePoint(pt)
		end
	end
end

local function NewOnEaten(inst)
	if IsDST() and not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	local old_oneaten = inst.components.edible.oneaten
	inst.components.edible:SetOnEatenFn(function(inst, eater)
		RespawnMandrake(eater)
		return old_oneaten(inst, eater)
	end)
end

local function NewOnEatenPrepared(inst)
	if IsDST() and not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	inst.components.edible:SetOnEatenFn(function(inst, eater)
		RespawnMandrake(eater)
	end)
end

local function NewOnFinished(inst)
	if IsDST() and not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	local old_onfinished = inst.components.finiteuses.onfinished
	inst.components.finiteuses:SetOnFinished(function(inst)
		RespawnMandrake(inst.components.inventoryitem.owner)
		return old_onfinished(inst)
	end)
end

AddPrefabPostInit("mandrake", NewOnEaten)
AddPrefabPostInit("cookedmandrake", NewOnEaten)
AddPrefabPostInit("mandrakesoup", NewOnEatenPrepared)
AddPrefabPostInit("panflute", NewOnFinished)