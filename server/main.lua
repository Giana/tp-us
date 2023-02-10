QBCore = exports['qb-core']:GetCoreObject()

-- Functions --

function isAllowedToTeleport(playerSrc)
    if IsPlayerAceAllowed(playerSrc, Config.AceGroup) then
        return true
    else
        return false
    end
end

function teleportPlayer(id, xCoord, yCoord, zCoord)
    TriggerClientEvent('tp-us:client:teleportPlayer', id, xCoord, yCoord, zCoord)
end

function validId(id)
    local player = QBCore.Functions.GetPlayer(id)

    if player then
        return true
    end

    return false
end

-- Commands --

RegisterCommand(Config.TpMeCommand, function(source, args)
    local src = source

    if isAllowedToTeleport(src) then
        if args and args[1] and args[2] and args[3] then
            TriggerEvent('tp-us:server:teleportMe', src, args[1], args[2], args[3])
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.args_required'), 'error')
        end
    end
end)

RegisterCommand(Config.TpYouCommand, function(source, args)
    local src = source

    if isAllowedToTeleport(src) then
        if args and args[1] and args[2] and args[3] and args[4] then
            TriggerEvent('tp-us:server:teleportYou', src, args[1], args[2], args[3], args[4])
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.args_required'), 'error')
        end
    end
end)

-- Events --

RegisterNetEvent('tp-us:server:RequestCommands')
AddEventHandler('tp-us:server:RequestCommands', function()
    local src = source

    if isAllowedToTeleport(src) then
        TriggerClientEvent('tp-us:client:RequestCommands', src, true)
    end
end)

RegisterNetEvent('tp-us:server:teleportMe')
AddEventHandler('tp-us:server:teleportMe', function(source, x, y, z)
    local src = source
    local xCoord = tonumber(x)
    local yCoord = tonumber(y)
    local zCoord = tonumber(z)

    if xCoord and yCoord and zCoord then
        teleportPlayer(src, xCoord, yCoord, zCoord)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.getting_coords'), 'error')
    end
end)

RegisterNetEvent('tp-us:server:teleportYou')
AddEventHandler('tp-us:server:teleportYou', function(source, id, x, y, z)
    local src = source
    local id = tonumber(id)
    local xCoord = tonumber(x)
    local yCoord = tonumber(y)
    local zCoord = tonumber(z)

    if xCoord and yCoord and zCoord then
        if id then
            if validId(id) then
                teleportPlayer(id, xCoord, yCoord, zCoord)
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.getting_player'), 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.getting_id'), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.getting_coords'), 'error')
        return
    end
end)