local CoreObject = exports[Config.Core.Triggers]:GetCoreObject()

CoreObject.Functions.CreateUseableItem(Config.Core.RollupItemName, function(source, item)
    TriggerClientEvent('gk-rollups:client:Consumables', source, item.name, '', 'hunger', math.random(10,40), math.random(5,10), 'Eating Rollup Gummy..', math.random(3,5), 'mp_player_inteat@pnq', 'loop', 49, 'ng_proc_food_candy', 60309, vector3(-0.005, 0.00, -0.01), vector3(175.0, 160.0, 0.0))
end)

CoreObject.Functions.CreateUseableItem(Config.Core.Rollups10PackItemName, function(source, item)
    local Player = CoreObject.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        Player.Functions.AddItem(Config.Core.RollupItemName, 10)
        TriggerClientEvent("gk-rollups:client:Get10Rollups", source)
    end
end)

CoreObject.Functions.CreateUseableItem(Config.Core.Rollups72PackItemName, function(source, item)
    local Player = CoreObject.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        Player.Functions.AddItem(Config.Core.RollupItemName, 72)
        TriggerClientEvent("gk-rollups:client:Get72Rollups", source)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('^5--<^3!^5>-- ^7GKHub ^5| ^7DEVELOPMENT ^5--<^3!^5>-- ^7Rollups: Script V1.0.0 ^5--<^3!^5>--^7')
end)

RegisterServerEvent('gk-rollups:server:RemoveItem', function(itemremove, amount)
    local source = source
    local Player = CoreObject.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(itemremove, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', source, CoreObject.Shared.Items[itemremove], 'remove')
    end
end)

RegisterServerEvent('gk-rollups:server:AddItem', function(itemadd, amount)
    local source = source
    local Player = CoreObject.Functions.GetPlayer(source)
    if Player.Functions.AddItem(itemadd, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', source, CoreObject.Shared.Items[itemadd], 'add')
    end
end)

RegisterServerEvent('gk-rollups:server:SetMeta', function(meta, amount)
    local src = source
    local Player = CoreObject.Functions.GetPlayer(src)
    local hunger = Player.PlayerData.metadata['hunger']
    local thirst = Player.PlayerData.metadata['thirst']
    if meta == 'hunger' then
        newhunger = hunger+amount
        Player.Functions.SetMetaData(meta, newhunger)
        TriggerClientEvent(HudEvent, src, newhunger, thirst)
        return
    end
    if meta == 'thirst' then
        newthirst = thirst+amount
        Player.Functions.SetMetaData(meta, newthirst)
        TriggerClientEvent(HudEvent, src, hunger, newthirst)
        return
    end
end)