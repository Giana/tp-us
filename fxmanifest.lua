fx_version 'cerulean'

game 'gta5'

author 'Giana - github.com/Giana'
description 'tp-us'

shared_script 'config.lua'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'qb-core'
}

lua54 'yes'