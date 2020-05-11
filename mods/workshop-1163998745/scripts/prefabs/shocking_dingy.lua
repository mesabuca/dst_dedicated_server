local assets =
{
    Asset("ANIM", "anim/shocking_dingy.zip"),
    Asset("ANIM", "anim/swap_shocking_dingy.zip"),
    Asset("ATLAS", "images/inventoryimages/shocking_dingy.xml"),
	Asset("IMAGE", "images/inventoryimages/shocking_dingy.tex"),
}

local prefabs =
{
    "shocking_dingy_charge",
}

local function onattack_shock(inst, attacker, target)

	local pt = target:GetPosition()
	target:StartThread(function()
		local pos = pt
		TheWorld:PushEvent("ms_sendlightningstrike", pos)
		Sleep(.3 + math.random() * .2)
	end)
	
end
		
local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_shocking_dingy", "swap_tornado_stick")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function staff_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("tornado_stick")
    inst.AnimState:SetBuild("shocking_dingy")
    inst.AnimState:PlayAnimation("idle")

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.entity:SetPristine()

    -------
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.TORNADOSTAFF_USES)
    inst.components.finiteuses:SetUses(TUNING.TORNADOSTAFF_USES)
    inst.components.finiteuses:SetOnFinished(inst.Remove)

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange(8, 10)
    inst.components.weapon:SetOnAttack(onattack_shock)
    inst.components.weapon:SetProjectile("shocking_dingy_charge")

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "shocking_dingy"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/shocking_dingy.xml"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	
    inst:AddComponent("dingyshocking")

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("shocking_dingy", staff_fn, assets, prefabs)
