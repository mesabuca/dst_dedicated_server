local assets =
{
    Asset("ANIM", "anim/goat_milker.zip"),
    Asset("ATLAS", "images/inventoryimages/goat_milker.xml"),
	Asset("IMAGE", "images/inventoryimages/goat_milker.tex"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("fertilizer")
    inst.AnimState:SetBuild("goat_milker")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "goat_milker"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/goat_milker.xml"

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.FERTILIZER_USES * 2)
    inst.components.finiteuses:SetUses(TUNING.FERTILIZER_USES * 2)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
	
    inst:AddComponent("goatmilking")

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("goat_milker", fn, assets)