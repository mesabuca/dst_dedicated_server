local conf_winter_tree = GetModConfigData("winter_tree")
local conf_glowcap = GetModConfigData("glowcap")
local conf_mushlight = GetModConfigData("mushlight")

local function setItemPause(item, pause)
    if item ~= nil then
        -- c_announce("setItemPause: "..(item.prefab and item.prefab or 'noname').." "..tostring(pause))
        if pause then
            if item.components.perishable then item.components.perishable:StopPerishing() end
            if item.components.fueled then item.components.fueled:StopConsuming() end
        else
            if item.components.perishable then item.components.perishable:StartPerishing() end
            if item.components.fueled then item.components.fueled:StartConsuming() end
        end
    end
end

local function AddEternalFn(inst)

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

    inst:AddTag('eternal')
    inst:ListenForEvent("itemget", function(inst)
        local container = inst.components.container
        for i=1,container.numslots do
            if container.slots[i] ~= nil then
                setItemPause(container.slots[i], true)
            end
        end
    end)

    local func_RemoveItemBySlot = inst.components.container.RemoveItemBySlot
    inst.components.container.RemoveItemBySlot = function(self, slot)
        local item = func_RemoveItemBySlot(self, slot)
        setItemPause(item, false)
        return item
    end
end

if conf_mushlight == 1 then
    AddPrefabPostInit('mushroom_light', AddEternalFn)
end

if conf_glowcap == 1 then
    AddPrefabPostInit('mushroom_light2', AddEternalFn)
end

if conf_winter_tree == 1 then
    AddPrefabPostInit('winter_tree', AddEternalFn)
    AddPrefabPostInit('winter_deciduoustree', AddEternalFn)
    AddPrefabPostInit('winter_twiggytree', AddEternalFn)
end
