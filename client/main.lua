QBCore = exports['qb-core']:GetCoreObject()

-- Events --

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('tp-us:server:RequestCommands')
end)

RegisterNetEvent('tp-us:client:RequestCommands', function(isAllowed)
    if isAllowed and Config.CommandsEnabled then
        TriggerEvent('chat:addSuggestion', '/' .. Config.TpMeCommand, 'Teleport yourself to coordinates', {{name = 'x', help = 'x coordinate'}, {name = 'y', help = 'y coordinate'}, {name = 'z', help = 'z coordinate'}})
        TriggerEvent('chat:addSuggestion', '/' .. Config.TpYouCommand, 'Teleport someone to coordinates', {{name = 'id', help = 'player ID'}, {name = 'x', help = 'x coordinate'}, {name = 'y', help = 'y coordinate'}, {name = 'z', help = 'z coordinate'}})
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