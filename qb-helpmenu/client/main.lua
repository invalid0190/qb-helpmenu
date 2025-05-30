local QBCore = exports['qb-core']:GetCoreObject()
local display = false
local firstJoin = false
local currentLanguage = Config.DefaultLanguage -- Use default language from config

-- Function to show notification
local function ShowNotification(message, type)
    if Config.UseQBCoreNotifications then
        QBCore.Functions.Notify(message, type)
    else
        -- Fallback to native notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(message)
        DrawNotification(false, true)
    end
end

-- Function to get role-based help content
local function GetRoleBasedContent()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local helpContent = {}
    
    -- Add general help content
    for _, section in pairs(Config.HelpText) do
        if section.type == 'general' then
            table.insert(helpContent, section)
        end
    end
    
    -- Add job-specific content
    if PlayerData.job then
        local jobName = PlayerData.job.name
        local jobGrade = PlayerData.job.grade.level
        
        -- Check for job-specific content
        for _, section in pairs(Config.HelpText) do
            if section.type == 'job' and section.job == jobName then
                -- Check job grade requirements
                if not section.minGrade or jobGrade >= section.minGrade then
                    table.insert(helpContent, section)
                end
            end
        end
    end
    
    -- Add gang-specific content
    if PlayerData.gang then
        local gangName = PlayerData.gang.name
        
        -- Check for gang-specific content
        for _, section in pairs(Config.HelpText) do
            if section.type == 'gang' and section.gang == gangName then
                table.insert(helpContent, section)
            end
        end
    end
    
    -- Always add new player content (not just for firstJoin)
    for _, section in pairs(Config.HelpText) do
        if section.type == 'newPlayer' then
            table.insert(helpContent, section)
        end
    end
    
    return helpContent
end

-- Function to change language
local function ChangeLanguage(lang)
    if lang ~= currentLanguage then
        currentLanguage = lang
        -- Save language preference if enabled
        if Config.LanguageSelection.rememberSelection then
            TriggerServerEvent('qb-helpmenu:server:saveLanguage', lang)
        end
        -- Reload the help menu with new language
        if display then
            ShowHelpMenu()
        end
    end
end

-- Function to detect system language
local function DetectSystemLanguage()
    if Config.LanguageSelection.autoDetect then
        local systemLang = GetCurrentResourceName() -- This will return the system language code
        for _, lang in pairs(Config.AvailableLanguages) do
            if lang.code == systemLang then
                return lang.code
            end
        end
    end
    return Config.DefaultLanguage
end

-- Register the help command
RegisterCommand(Config.Command, function()
    if not display then
        ShowHelpMenu()
    else
        HideHelpMenu()
    end
end, false)

-- Function to show the help menu
function ShowHelpMenu()
    display = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'showHelpMenu',
        helpText = GetRoleBasedContent(),
        currentLanguage = currentLanguage,
        availableLanguages = Config.AvailableLanguages,
        languageSettings = Config.LanguageSelection
    })
end

-- Function to hide the help menu
function HideHelpMenu()
    display = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'hideHelpMenu'
    })
end

-- Function to check if player should see help menu
local function CheckFirstJoin()
    QBCore.Functions.TriggerCallback('qb-helpmenu:server:getLastJoin', function(lastJoin)
        if not lastJoin then
            -- First time player
            firstJoin = true
            ShowNotification(Lang:t('notification.first_time'), 'success')
            Wait(1000) -- Wait a bit before showing the menu
            ShowHelpMenu()
        else
            -- Check if it's been more than Config.DaysThreshold days
            local currentTime = os.time()
            local daysSinceLastJoin = math.floor((currentTime - lastJoin) / (24 * 60 * 60))
            
            if daysSinceLastJoin >= Config.DaysThreshold then
                firstJoin = true
                ShowNotification(string.format(Lang:t('notification.returning_player'), daysSinceLastJoin), 'info')
                Wait(1000) -- Wait a bit before showing the menu
                ShowHelpMenu()
            end
        end
    end)
end

-- Event handler for player loaded
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- Load saved language preference
    QBCore.Functions.TriggerCallback('qb-helpmenu:server:getLanguage', function(savedLang)
        if savedLang then
            currentLanguage = savedLang
        else
            currentLanguage = DetectSystemLanguage()
        end
    end)
    
    if Config.AutoShowHelp then
        CheckFirstJoin()
    end
end)

-- Event handler for job updates
RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    if display then
        -- Refresh help menu content when job changes
        SendNUIMessage({
            type = 'showHelpMenu',
            helpText = GetRoleBasedContent(),
            currentLanguage = currentLanguage,
            availableLanguages = Config.AvailableLanguages,
            languageSettings = Config.LanguageSelection
        })
    end
end)

-- Event handler for gang updates
RegisterNetEvent('QBCore:Client:OnGangUpdate', function()
    if display then
        -- Refresh help menu content when gang changes
        SendNUIMessage({
            type = 'showHelpMenu',
            helpText = GetRoleBasedContent(),
            currentLanguage = currentLanguage,
            availableLanguages = Config.AvailableLanguages,
            languageSettings = Config.LanguageSelection
        })
    end
end)

-- NUI Callbacks
RegisterNUICallback('closeHelpMenu', function(_, cb)
    HideHelpMenu()
    if firstJoin then
        ShowNotification(Lang:t('notification.help_available'), 'info')
        firstJoin = false
    end
    cb('ok')
end)

-- Language change callback
RegisterNUICallback('changeLanguage', function(data, cb)
    ChangeLanguage(data.language)
    cb('ok')
end)

-- Add key binding (optional)
RegisterKeyMapping(Config.Command, 'Show Help Menu', 'keyboard', Config.Shortcuts.toggle)

-- Add to Config
Config = Config or {}
Config.AutoShowHelp = true -- Enable/disable auto-show feature
Config.DaysThreshold = 30 -- Number of days before showing help menu again
Config.UseQBCoreNotifications = true -- Use QBCore notifications or native notifications
Config.AvailableLanguages = {
    { code = 'en', name = 'English' },
    { code = 'es', name = 'Español' },
    { code = 'fr', name = 'Français' }
}

-- Notification messages
Config.Notifications = {
    FirstTime = Lang:t('notification.first_time'),
    ReturningPlayer = Lang:t('notification.returning_player'),
    HelpAvailable = Lang:t('notification.help_available')
} 