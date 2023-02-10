QBCore = exports['qb-core']:GetCoreObject()

-- Events --

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('tp-us:server:RequestCommands')
end)

RegisterNetEvent('tp-us:client:RequestCommands', function(isAllowed)
    if isAllowed and Config.CommandsEnabled then
        TriggerEvent('chat:addSuggestion', '/' .. Config.TpMeCommand, Lang:t('other.tp_yourself'), {{name = Lang:t('other.tp_yourself_x_name'), help = Lang:t('other.tp_yourself_x_help')}, {name = Lang:t('other.tp_yourself_y_name'), help = Lang:t('other.tp_yourself_y_help')}, {name = Lang:t('other.tp_yourself_z_name'), help = Lang:t('other.tp_yourself_z_help')}})
        TriggerEvent('chat:addSuggestion', '/' .. Config.TpYouCommand, Lang:t('other.tp_someone'), {{name = Lang:t('other.tp_someone_id_name'), help = Lang:t('other.tp_someone_id_help')}, {name = Lang:t('other.tp_someone_x_name'), help = Lang:t('other.tp_someone_x_help')}, {name = Lang:t('other.tp_someone_y_name'), help = Lang:t('other.tp_someone_y_help')}, {name = Lang:t('other.tp_someone_z_name'), help = Lang:t('other.tp_someone_z_help')}})
    end
end)

RegisterNetEvent('tp-us:client:teleportPlayer', function(xCoord, yCoord, zCoord)
    local ped = PlayerPedId()

    DoScreenFadeOut(500)

    while not IsScreenFadedOut() do
        Wait(10)
    end

    SetEntityCoords(ped, xCoord, yCoord, zCoord)
    DoScreenFadeIn(500)
end)