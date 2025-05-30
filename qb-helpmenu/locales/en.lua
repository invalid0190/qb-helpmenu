local Translations = {
    error = {
        not_authorized = "You are not authorized to use this command",
    },
    success = {
        help_menu_shown = "Help menu displayed",
        help_menu_hidden = "Help menu hidden",
    },
    info = {
        help_menu = "Help Menu",
        press_f7 = "Press F7 to toggle help menu",
    },

    -- New Player Notification Messages
    notification = {
        first_time = "Welcome to the server! Showing you the help menu to get started.",
        returning_player = "Welcome back! It's been %d days since your last visit. Showing you the help menu to refresh your memory.",
        help_available = "Remember, you can always access the help menu using the /help command or pressing F7.",
        content_copied = "Content copied to clipboard",
        section_bookmarked = "Section bookmarked",
        section_unbookmarked = "Section unbookmarked",
        command_executing = "Executing command: %s",
        theme_switched = "Switched to %s theme",
        shortcut_removed = "Removed from favorites",
    },

    -- Help Menu Content (Titles and items)
    help_content = {
        general = {
            title = "General Commands",
            content = {
                "/help - Show this help menu",
                "/report - Report a player",
                "/ooc - Out of character chat"
            }
        },
        job = {
            police = {
                title = "Police Commands",
                content = {
                    "/duty - Toggle duty status",
                    "/cuff - Handcuff a player",
                    "/uncuff - Remove handcuffs",
                    "/escort - Escort a player"
                }
            },
            ambulance = {
                title = "EMS Commands",
                content = {
                    "/duty - Toggle duty status",
                    "/heal - Heal a player",
                    "/revive - Revive a player",
                    "/check - Check player status"
                }
            },
        },
        gang = {
            ballas = {
                title = "Ballas Gang Info",
                content = {
                    "Territory: Strawberry",
                    "Gang Commands: /gang",
                    "Turf Control: /turf"
                }
            },
        },
        newPlayer = {
            getting_started = {
                title = "Getting Started",
                content = {
                    "Welcome to the server! We're glad to have you here.",
                    "This guide will help you get started with the basics.",
                    "Remember to read the server rules in our Discord.",
                    "Don't hesitate to ask staff or other players for help!"
                }
            },
            basic_controls = {
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
            essential_commands = {
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
            roleplay_guide = {
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
            jobs_economy = {
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
            transportation = {
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
            housing = {
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
            emergency_services = {
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
            tips_tricks = {
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
            community = {
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
             server_rules = {
                title = "Server Rules & Guidelines",
                content = {
                    "Respect all players and staff.",
                    "No cheating, exploiting, or unauthorized mods.",
                    "No harassment, hate speech, or toxic behavior.",
                    "Value your character's life (no fail RP).",
                    "Follow all roleplay and server rules."
                }
            },
            voice_chat = {
                title = "How to Use Voice Chat",
                content = {
                    "Press [N] to talk (or your server's voice key).",
                    "Adjust your voice range with [Z] (whisper, normal, shout).",
                    "Use headphones for better audio quality.",
                    "Don't talk OOC (out of character) in voice unless necessary."
                }
            },
            make_money = {
                title = "How to Make Money",
                content = {
                    "Start with legal jobs: delivery, garbage, taxi, fishing, mining, etc.",
                    "Look for side hustles: recycling, collecting, or odd jobs.",
                    "Save up for licenses to unlock better jobs.",
                    "Avoid illegal activities until you understand the server rules."
                }
            },
            get_vehicle = {
                title = "How to Get a Vehicle",
                content = {
                    "Visit the car dealership to buy your first car.",
                    "Use public transport or taxis if you don't have a car.",
                    "Rent vehicles for short-term use.",
                    "Don't steal vehicles—this can get you in trouble with police and staff."
                }
            },
            get_house = {
                title = "How to Get a House",
                content = {
                    "Visit the real estate office or use /house menu.",
                    "Start with apartments or small houses.",
                    "Save money for better properties",
                    "Customize your home with furniture",
                    "Store vehicles in your garage",
                    "Invite friends to your property",
                    "Pay rent or mortgage on time"
                }
            },
            interact_players = {
                title = "How to Interact with Other Players",
                content = {
                    "Use /me and /do for roleplay actions and descriptions.",
                    "Be polite and stay in character.",
                    "Join groups, gangs, or organizations for more roleplay opportunities."
                }
            },
            contact_staff = {
                title = "How to Contact Staff",
                content = {
                    "Use /report to contact staff for help or to report issues.",
                    "Join the Discord for support and announcements.",
                    "Don't spam staff with unnecessary requests."
                }
            },
            use_phone = {
                title = "How to Use the Phone",
                content = {
                    "Press F1 to open your phone.",
                    "Use the phone for messages, calls, GPS, and job apps.",
                    "Add important contacts (police, EMS, friends)."
                }
            },
             use_inventory = {
                title = "How to Use the Inventory",
                content = {
                    "Press F2 to open your inventory.",
                    "Drag and drop items to use, give, or drop them.",
                    "Keep your inventory organized and don't carry illegal items."
                }
            },
            stay_safe = {
                title = "How to Stay Safe",
                content = {
                    "Don't share your account or password.",
                    "Beware of scams and fake staff.",
                    "Report suspicious behavior to staff."
                }
            },
            join_events = {
                title = "How to Join Events",
                content = {
                    "Watch for server announcements about events.",
                    "Participate in races, jobs, or community gatherings.",
                    "Win prizes and meet new friends."
                }
            },
            useful_locations = {
                title = "Useful Locations",
                content = {
                    "Job Center: Get a job or change careers.",
                    "Hospital: Heal or respawn if you're injured.",
                    "Police Station: Report crimes or get help.",
                    "Car Dealership: Buy or sell vehicles.",
                    "Bank: Deposit or withdraw money."
                }
            },
            faq = {
                title = "FAQ (Frequently Asked Questions)",
                content = {
                    "How do I get started? Use /help and read the new player guide.",
                    "What if I'm stuck or lost? Use /report or ask in Discord.",
                    "How do I make friends? Join events, groups, or talk to players.",
                    "Where can I find the rules? In Discord or the /help menu.",
                    "Who do I contact for help? Use /report or contact staff in Discord."
                }
            },
        }
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
}) 