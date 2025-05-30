Config = {}

-- Language Configuration
Config.DefaultLanguage = 'en' -- Default language for the help menu
Config.AvailableLanguages = {
    {
        code = 'en',
        name = 'English',
        flag = '🇬🇧'
    },
    {
        code = 'es',
        name = 'Español',
        flag = '🇪🇸'
    },
    {
        code = 'fr',
        name = 'Français',
        flag = '🇫🇷'
    }
}

-- Language Selection Settings
Config.LanguageSelection = {
    enabled = true, -- Enable/disable language selection feature
    position = 'top-right', -- Position of language selector (top-right, top-left, bottom-right, bottom-left)
    showFlags = true, -- Show country flags next to language names
    rememberSelection = true, -- Remember user's language selection
    autoDetect = true -- Automatically detect user's system language
}

-- Command Configuration
Config.Command = 'help' -- Command to open help menu
Config.AutoShowHelp = true -- Show help menu automatically for new players
Config.DaysThreshold = 7 -- Number of days before showing help menu again for returning players

-- Notification Settings
Config.UseQBCoreNotifications = true -- Use QBCore notifications or native notifications

-- Theme Settings
Config.DefaultTheme = 'dark' -- Default theme (dark/light)
Config.AllowThemeToggle = true -- Allow users to toggle between dark and light themes

-- Search Settings
Config.EnableSearch = true -- Enable search functionality
Config.SearchMinLength = 2 -- Minimum characters required for search
Config.SearchDelay = 300 -- Delay in milliseconds before search triggers

-- Shortcuts Settings
Config.EnableShortcuts = true -- Enable keyboard shortcuts
Config.Shortcuts = {
    toggle = 'F7', -- Key to toggle help menu
    search = '/', -- Key to focus search
    close = 'ESCAPE' -- Key to close help menu
}

-- Bookmark Settings
Config.EnableBookmarks = true -- Enable bookmark functionality
Config.MaxBookmarks = 10 -- Maximum number of bookmarks allowed

-- History Settings
Config.EnableHistory = true -- Enable command history
Config.MaxHistoryItems = 20 -- Maximum number of history items to store

-- Quick Actions Settings
Config.EnableQuickActions = true -- Enable quick actions
Config.QuickActions = {
    copy = true, -- Enable copy to clipboard
    print = true, -- Enable print functionality
    bookmark = true -- Enable bookmark functionality
}

-- UI Settings
Config.UISettings = {
    width = 900, -- Width of help menu
    maxHeight = '85vh', -- Maximum height of help menu
    animationDuration = 300, -- Animation duration in milliseconds
    borderRadius = 15, -- Border radius of help menu
    padding = 20 -- Padding inside help menu
}

-- Help Text Configuration
Config.HelpText = {
    -- General Commands
    {
        type = 'general',
        title = 'General Commands',
        content = {
            '/help - Show this help menu',
            '/report - Report a player',
            '/ooc - Out of character chat'
        }
    },
    -- Job Commands
    {
        type = 'job',
        job = 'police',
        title = 'Police Commands',
        content = {
            '/duty - Toggle duty status',
            '/cuff - Handcuff a player',
            '/uncuff - Remove handcuffs',
            '/escort - Escort a player'
        }
    },
    {
        type = 'job',
        job = 'ambulance',
        title = 'EMS Commands',
        content = {
            '/duty - Toggle duty status',
            '/heal - Heal a player',
            '/revive - Revive a player',
            '/check - Check player status'
        }
    },
    -- Gang Information
    {
        type = 'gang',
        gang = 'ballas',
        title = 'Ballas Gang Information',
        content = {
            'Territory: Strawberry',
            'Gang Commands: /gang',
            'Territory Control: /turf'
        }
    },
    {
        type = "newPlayer",
        title = "Getting Started",
        content = {
            "Welcome to the server! We're glad to have you here.",
            "This guide will help you get started with the basics.",
            "Remember to read the server rules in our Discord.",
            "Don't hesitate to ask staff or other players for help!"
        }
    },
    {
        type = "newPlayer",
        title = "Basic Controls",
        content = {
            "F1 - Open phone",
            "F2 - Open inventory",
            "F3 - Open character menu",
            "F5 - Open job menu",
            "F6 - Open radio menu",
            "F7 - Open help menu",
            "TAB - Open scoreboard",
            "ESC - Open pause menu"
        }
    },
    {
        type = "newPlayer",
        title = "Essential Commands",
        content = {
            "/help - Show this help menu",
            "/report - Report a player or issue",
            "/ooc - Out of character chat",
            "/me - Roleplay action",
            "/do - Roleplay description",
            "/try - Attempt an action",
            "/911 - Emergency services",
            "/311 - Non-emergency services"
        }
    },
    {
        type = "newPlayer",
        title = "Roleplay Guide",
        content = {
            "Always stay in character (IC)",
            "Use /me for actions and /do for descriptions",
            "Respect other players' roleplay",
            "Follow server rules and guidelines",
            "Use proper grammar and spelling",
            "Avoid meta-gaming and power-gaming",
            "Report rule breakers to staff"
        }
    },
    {
        type = "newPlayer",
        title = "Jobs & Economy",
        content = {
            "Visit the job center to find work",
            "Start with basic jobs like delivery or garbage",
            "Save money to buy vehicles and properties",
            "Join a company for better pay and benefits",
            "Check the job board for available positions",
            "Some jobs require specific licenses",
            "Work your way up through job ranks"
        }
    },
    {
        type = "newPlayer",
        title = "Transportation",
        content = {
            "Use public transport (bus/train)",
            "Buy vehicles from dealerships",
            "Rent vehicles for short-term use",
            "Use taxi services (/taxi)",
            "Purchase a personal vehicle",
            "Maintain your vehicles regularly",
            "Follow traffic laws and speed limits"
        }
    },
    {
        type = "newPlayer",
        title = "Housing",
        content = {
            "Visit real estate agents for properties",
            "Start with apartments or small houses",
            "Save money for better properties",
            "Customize your home with furniture",
            "Store vehicles in your garage",
            "Invite friends to your property",
            "Pay rent or mortgage on time"
        }
    },
    {
        type = "newPlayer",
        title = "Emergency Services",
        content = {
            "/911 - Call emergency services",
            "/311 - Call non-emergency services",
            "Police respond to crimes and accidents",
            "EMS can heal and revive players",
            "Fire department handles fires and rescues",
            "Stay calm during emergencies",
            "Follow instructions from emergency services"
        }
    },
    {
        type = "newPlayer",
        title = "Tips & Tricks",
        content = {
            "Join the server Discord for updates",
            "Make friends and join a group",
            "Learn the map and important locations",
            "Save money for emergencies",
            "Keep your phone charged",
            "Use the GPS system for navigation",
            "Check the server website for guides"
        }
    },
    {
        type = "newPlayer",
        title = "Community",
        content = {
            "Join our Discord server",
            "Follow our social media",
            "Participate in community events",
            "Join roleplay groups and organizations",
            "Make friends and build relationships",
            "Help other new players",
            "Report bugs and suggest improvements"
        }
    },
    {
        type = "newPlayer",
        title = "Server Rules & Guidelines",
        content = {
            "Respect all players and staff.",
            "No cheating, exploiting, or unauthorized mods.",
            "No harassment, hate speech, or toxic behavior.",
            "Value your character's life (no fail RP).",
            "Follow all roleplay and server rules."
        }
    },
    {
        type = "newPlayer",
        title = "How to Use Voice Chat",
        content = {
            "Press [N] to talk (or your server's voice key).",
            "Adjust your voice range with [Z] (whisper, normal, shout).",
            "Use headphones for better audio quality.",
            "Don't talk OOC (out of character) in voice unless necessary."
        }
    },
    {
        type = "newPlayer",
        title = "How to Make Money",
        content = {
            "Start with legal jobs: delivery, garbage, taxi, fishing, mining, etc.",
            "Look for side hustles: recycling, collecting, or odd jobs.",
            "Save up for licenses to unlock better jobs.",
            "Avoid illegal activities until you understand the server rules."
        }
    },
    {
        type = "newPlayer",
        title = "How to Get a Vehicle",
        content = {
            "Visit the car dealership to buy your first car.",
            "Use public transport or taxis if you don't have a car.",
            "Rent vehicles for short-term use.",
            "Don't steal vehicles—this can get you in trouble with police and staff."
        }
    },
    {
        type = "newPlayer",
        title = "How to Get a House",
        content = {
            "Visit the real estate office or use /house menu.",
            "Start with an apartment or small house.",
            "Store your items and vehicles safely at home."
        }
    },
    {
        type = "newPlayer",
        title = "How to Interact with Other Players",
        content = {
            "Use /me and /do for roleplay actions and descriptions.",
            "Be polite and stay in character.",
            "Join groups, gangs, or organizations for more roleplay opportunities."
        }
    },
    {
        type = "newPlayer",
        title = "How to Contact Staff",
        content = {
            "Use /report to contact staff for help or to report issues.",
            "Join the Discord for support and announcements.",
            "Don't spam staff with unnecessary requests."
        }
    },
    {
        type = "newPlayer",
        title = "How to Use the Phone",
        content = {
            "Press F1 to open your phone.",
            "Use the phone for messages, calls, GPS, and job apps.",
            "Add important contacts (police, EMS, friends)."
        }
    },
    {
        type = "newPlayer",
        title = "How to Use the Inventory",
        content = {
            "Press F2 to open your inventory.",
            "Drag and drop items to use, give, or drop them.",
            "Keep your inventory organized and don't carry illegal items."
        }
    },
    {
        type = "newPlayer",
        title = "How to Stay Safe",
        content = {
            "Don't share your account or password.",
            "Beware of scams and fake staff.",
            "Report suspicious behavior to staff."
        }
    },
    {
        type = "newPlayer",
        title = "How to Join Events",
        content = {
            "Watch for server announcements about events.",
            "Participate in races, jobs, or community gatherings.",
            "Win prizes and meet new friends."
        }
    },
    {
        type = "newPlayer",
        title = "Useful Locations",
        content = {
            "Job Center: Get a job or change careers.",
            "Hospital: Heal or respawn if you're injured.",
            "Police Station: Report crimes or get help.",
            "Car Dealership: Buy or sell vehicles.",
            "Bank: Deposit or withdraw money."
        }
    },
    {
        type = "newPlayer",
        title = "FAQ (Frequently Asked Questions)",
        content = {
            "How do I get started? Use /help and read the new player guide.",
            "What if I'm stuck or lost? Use /report or ask in Discord.",
            "How do I make friends? Join events, groups, or talk to players.",
            "Where can I find the rules? In Discord or the /help menu.",
            "Who do I contact for help? Use /report or contact staff in Discord."
        }
    }
}

Config.DisplayTime = 30 -- How long the help text stays on screen (in seconds)

return Config 