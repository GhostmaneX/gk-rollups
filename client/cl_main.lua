local CoreObject = exports[Config.Core.Triggers]:GetCoreObject()

RegisterNetEvent('gk-rollups:client:Consumables', function(itemremove, itemadd, meta, amount, stress, lang, timer, animd, anims, flag, prop, bones, coord, rotat)
    Consumables(itemremove, itemadd, meta, amount, stress, lang, timer, animd, anims, flag, prop, bones, coord, rotat)
end)

RegisterNetEvent('gk-rollups:notify')
AddEventHandler('gk-rollups:notify', function(msg, type)
    CoreObject.Functions.Notify(msg, type)
end)

RegisterNetEvent("gk-rollups:client:Get10Rollups")
AddEventHandler("gk-rollups:client:Get10Rollups", function()
    if Config.Core.Notify == "okokNotify" then
        exports['okokNotify']:Alert("SUCCESS", "You have Got 10 Rollups.", 5000, 'success')
    elseif QBCore then
        QBCore.Functions.Notify('You Have Received 10 RollUps', 'success', 7500)
    else
        CoreObject.Functions.Notify('You Have Received 10 RollUps', 'success', 7500)
    end
end)

RegisterNetEvent("gk-rollups:client:Get72Rollups")
AddEventHandler("gk-rollups:client:Get72Rollups", function()
    if Config.Core.Notify == "okokNotify" then
        exports['okokNotify']:Alert("SUCCESS", "You have Got 72 Rollups.", 5000, 'success')
    elseif QBCore then
        QBCore.Functions.Notify('You Have Received 72 RollUps', 'success', 7500)
    else
        CoreObject.Functions.Notify('You Have Received 72 RollUps', 'success', 7500)
    end
end)

function Consumables(itemremove, itemadd, meta, amount, stress, lang, timer, animd, anims, flag, prop, bones, coord, rotat)
    CoreObject.Functions.Progressbar('rollups', lang, timer * 1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false
    }, {
        animDict = animd,
        anim = anims,
        flags = flag
    }, {
        model = prop,
        bone = bones,
        coords = coord,
        rotation = rotat
    }, {}, function()
        TriggerServerEvent('gk-rollups:server:RemoveItem', itemremove, 1)
        TriggerServerEvent('gk-rollups:server:AddItem', itemadd, 1)
        TriggerServerEvent('gk-rollups:server:SetMeta', meta, amount)
        TriggerServerEvent('gk-rollups:server:RemoveStress', stress)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('gk-rollups:notify', "Cancelled.", 'primary')
    end)
end