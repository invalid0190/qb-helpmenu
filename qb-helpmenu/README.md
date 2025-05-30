# ✨ QB-HelpMenu - Professional In-Game Help Menu Framework ✨

## 📖 Overview

QB-HelpMenu is a modern, feature-rich, and highly customizable in-game help and guide menu for your FiveM server, designed to provide players with easy access to essential information, commands, and guides.

Built with a focus on professionalism and user experience, this resource offers a **clean NUI interface**, **role-based content**, **dynamic updates**, **multilingual support**, and **handy shortcuts** to improve player onboarding and engagement.

## 🔥 Key Features

-   🎨 **Modern NUI Interface:** A clean, dark/light themed UI with smooth animations and a responsive design.
-   🌍 **Multilingual Support:** Full support for multiple languages via locale files, with an in-game language selector.
-   ⚙️ **Config-Driven Content:** All help sections, tips, and notifications are easily customizable via `config.lua`.
-   🎭 **Role-Based Content:** Dynamically show help sections based on player job (with grade support), gang, or whether they are a new player.
-   ⌨️ **Command Shortcuts:** Create custom aliases, combinations, and macros for quick command execution.
-   🕒 **Command History:** Keep track of recently used commands for easy re-execution.
-   ⭐ **Favorites System:** Bookmark important commands or sections for quick access.
-   🔍 **Search Functionality:** Quickly find relevant help topics with a built-in search.
-   💡 **Dynamic Tips/Alerts:** Display random tips loaded from a configurable list or external source.
-   🚶 **Auto-Show on First Join/Return:** Optionally show the help menu automatically for new players or those returning after a set period (requires database).
-   🔔 **Informative Notifications:** Notify players about help menu events and status.
-   🌙/☀️ **Theme Toggle:** Users can switch between dark and light themes (NUI).
-   🎯 **Keyboard Shortcuts:** Navigate and interact with the help menu using configurable keyboard shortcuts.
-   📋/🖨️ **Copy/Print Content:** Easily copy help content to clipboard or print it.
-   🤝 **NUI Callbacks:** Built with NUI callbacks for seamless communication between client and UI.
-   💾 **Database Integration:** Tracks player join times and language preferences (requires `oxmysql`).

---

## 🛠️ Setup Guide

Follow these steps to get QB-HelpMenu up and running on your server:

1.  ⬇️ **Download:** Place the `qb-helpmenu` folder into your server's `resources/[qb]` directory.

2.  📊 **Database:** Ensure you have `oxmysql` installed and configured. The script will automatically create the necessary `helpmenu_preferences` table on the first start if it doesn't exist.

3.  🌐 **Locales:** The script uses locale files for translations. The default is `locales/en.lua`. Create new locale files (e.g., `locales/es.lua`, `locales/fr.lua`) for additional languages and add your translations.

4.  📝 **Configuration:** Edit `config.lua` to customize all aspects of the script. This is where you define language settings, help content, notifications, auto-show features, tips, commands, keybindings, and UI.

5.  ✅ **Start Resource:** Add `ensure qb-helpmenu` to your `server.cfg`.

6.  🔄 **Restart Server:** Restart your FiveM server to apply all changes.

---

## ⚙️ Configuration Options (`config.lua`)

Here's a detailed breakdown of the key configuration options available in `config.lua`:

### Language Configuration

-   `Config.DefaultLanguage`: Sets the default language code (e.g., 'en', 'es', 'fr').
-   `Config.AvailableLanguages`: A table listing available languages. Each entry requires `code`, `name`, and optional `flag` (emoji).
-   `Config.LanguageSelection`: Settings for the in-game language selector:
    -   `enabled`: `true` to enable, `false` to disable the language selection feature.
    -   `position`: Position of the selector ('top-right', 'top-left', 'bottom-right', 'bottom-left').
    -   `showFlags`: `true` to show country flags next to language names.
    -   `rememberSelection`: `true` to remember the user's last selected language using the database.
    -   `autoDetect`: `true` to attempt to automatically detect the user's system language on first join.

### Command Configuration

-   `Config.Command`: Defines the command players use to open the help menu (default: 'help').

### Auto-Show Configuration

-   `Config.AutoShowHelp`: `true` to automatically show the menu for new or returning players based on the threshold.
-   `Config.DaysThreshold`: The number of days of inactivity before a returning player sees the menu again.

### Notification Settings

-   `Config.UseQBCoreNotifications`: `true` to use QBCore notifications, `false` to use native FiveM notifications.

### Theme Settings

-   `Config.DefaultTheme`: Sets the default UI theme ('dark' or 'light').
-   `Config.AllowThemeToggle`: `true` to allow users to switch themes in the NUI.

### Search Settings

-   `Config.EnableSearch`: `true` to enable the search bar in the NUI.
-   `Config.SearchMinLength`: Minimum characters required in the search input to start filtering.
-   `Config.SearchDelay`: Delay in milliseconds before the search filter is applied after typing stops.

### Shortcuts Settings

-   `Config.EnableShortcuts`: `true` to enable the keyboard shortcuts panel.
-   `Config.Shortcuts`: Configure keybindings for various menu actions:
    -   `toggle`: Key to open/close the help menu.
    -   `search`: Key to focus the search input.
    -   `close`: Key to close the help menu.

### Bookmark Settings

-   `Config.EnableBookmarks`: `true` to enable the section bookmarking feature.
-   `Config.MaxBookmarks`: The maximum number of sections a player can bookmark.

### History Settings

-   `Config.EnableHistory`: `true` to enable tracking and displaying command history.
-   `Config.MaxHistoryItems`: The maximum number of command history items to store.

### Quick Actions Settings

-   `Config.EnableQuickActions`: `true` to enable quick action buttons (copy, print, bookmark) in the NUI.
-   `Config.QuickActions`: Specify which quick actions are enabled:
    -   `copy`: `true` to enable copy to clipboard.
    -   `print`: `true` to enable printing the content.
    -   `bookmark`: `true` to enable bookmarking the current section.

### UI Settings

-   `Config.UISettings`: Fine-tune the appearance of the help menu NUI:
    -   `width`: The width of the help menu container.
    -   `maxHeight`: The maximum height of the help menu container.
    -   `animationDuration`: Duration of UI animations in milliseconds.
    -   `borderRadius`: Border radius of the help menu container.
    -   `padding`: Inner padding of the help menu content area.

### Help Text Configuration

-   `Config.HelpText`: This is the core table for defining your help content. It's a list of sections, each being a table with:
    -   `type`: Specifies the category (`general`, `job`, `gang`, `newPlayer`).
    -   `title`: The title of the section (translate this in locale files).
    -   `content`: A table of strings, each representing a bullet point or line item (translate these in locale files).
    -   `job`: (Required for `job` type) The internal name of the job (e.g., "police").
    -   `gang`: (Required for `gang` type) The internal name of the gang (e.g., "ballas").
    -   `minGrade`: (Optional for `job` type) The minimum job grade level required to see this section.

### Tips Configuration

-   `Config.Tips`: A table of strings. These tips will be shown randomly as notifications periodically.
-   `Config.DisplayTime`: (Note: This is primarily for legacy/native text display and less relevant for the NUI.)

---

## 🌍 Translation Guide

To add support for a new language, follow these steps:

1.  **Create Locale File:** Duplicate the existing `locales/en.lua` file.
2.  **Rename File:** Rename the duplicated file to the language code you want to add (e.g., `locales/de.lua` for German).
3.  **Translate Content:** Open the new locale file and translate all the strings within the `Translations` table to the target language.
4.  **Update `fxmanifest.lua`:** Open the `fxmanifest.lua` file for `qb-helpmenu` and add your new locale file to the `files` list.
5.  **Update `config.lua`:** Open `config.lua` and add your new language to the `Config.AvailableLanguages` table. Include its `code`, `name`, and an appropriate `flag` emoji.
6.  **Restart Server:** Restart your FiveM server for the new language to become available in-game.

---

## 🤝 Contributing

Contributions are always welcome! If you have ideas for new features, bug fixes, or improvements, please feel free to contribute. 