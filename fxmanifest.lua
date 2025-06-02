fx_version 'cerulean'
game 'gta5'

author 'ay-eye'
description 'QB-HelpMenu - In-Game Help/Guide Menu'
version '1.1.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js'
}

lua54 'yes' 