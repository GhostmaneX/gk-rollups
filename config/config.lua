Config = {
    Core = {
        Notify = "okokNotify", -- If you are using okokNotify write okokNotify else you are using QBCore write QBCore else you are using Custom Core write Other.
        Triggers = "qb-core", -- put your core for triggers / exports. example: gk-core / qb-core / gk-hub
        CoreObject = "QBCore", -- put your core. example: QBCore / GKCore / GKHub
        HudEvent = 'hud:client:UpdateNeeds', -- The name of your hud event. Default; 'hud:client:UpdateNeeds'
        AddStressEvent = 'hud:server:GainStress', -- Event to remove stress from player. Default; 'hud:server:GainStress'
        RemoveStressEvent = 'hud:server:RelieveStress', -- Event to remove stress from player. Default; 'hud:server:RelieveStress'
        EvidenceEvent = 'evidence:client:SetStatus', -- Event to set drunk evidence status for police. Default; 'evidence:client:SetStatus'
        RollupItemName = "rollup", -- if you want to change the rollups item name you can change, this is the default name that is configed for this script.
        Rollups72PackItemName = "72rollupspack", -- if you want to change the 72 rollups pack item name you can change, this is the default name that is configed for this script.
        Rollups10PackItemName = "10rollupspack" -- if you want to change the 10 rollups pack item name you can change, this is the default name that is configed for this script.
    }
}