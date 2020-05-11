if GLOBAL.STRINGS.NAMES.MIGRATION_PORTAL then
	AddPrefabPostInit("world", function(inst)
		if inst.ismastersim then
			inst:AddComponent("minspawner")
		end
	end)
else
	AddPrefabPostInit("forest", function(inst)
		if inst.ismastersim then
			inst:AddComponent("minspawner")
		end
	end)
end


--"forest" for the overworld
--"cave" for the caves. 
--No more "world" prefab.