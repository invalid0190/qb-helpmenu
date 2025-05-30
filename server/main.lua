local QBCore = exports['qb-core']:GetCoreObject()

-- Initialize database table for language preferences
MySQL.ready(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS helpmenu_preferences (
            citizenid VARCHAR(50) PRIMARY KEY,
            language VARCHAR(10) DEFAULT 'en',
            last_join TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ]])
end)

-- Save language preference
RegisterNetEvent('qb-helpmenu:server:saveLanguage', function(language)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    MySQL.Async.execute('INSERT INTO helpmenu_preferences (citizenid, language) VALUES (?, ?) ON DUPLICATE KEY UPDATE language = ?',
        {Player.PlayerData.citizenid, language, language})
end)

-- Get saved language preference
QBCore.Functions.CreateCallback('qb-helpmenu:server:getLanguage', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(nil) end

    MySQL.Async.fetchScalar('SELECT language FROM helpmenu_preferences WHERE citizenid = ?',
        {Player.PlayerData.citizenid}, function(language)
        cb(language)
    end)
end)

-- Get last join time
QBCore.Functions.CreateCallback('qb-helpmenu:server:getLastJoin', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(nil) end

    MySQL.Async.fetchScalar('SELECT last_join FROM helpmenu_preferences WHERE citizenid = ?',
        {Player.PlayerData.citizenid}, function(lastJoin)
        cb(lastJoin)
    end)
end)

-- Update last join time
RegisterNetEvent('qb-helpmenu:server:updateLastJoin', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    MySQL.Async.execute('INSERT INTO helpmenu_preferences (citizenid, last_join) VALUES (?, CURRENT_TIMESTAMP) ON DUPLICATE KEY UPDATE last_join = CURRENT_TIMESTAMP',
        {Player.PlayerData.citizenid})
end)

-- Event handler for player loaded
RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
    local src = source
    TriggerClientEvent('qb-helpmenu:server:updateLastJoin', src)
end) 