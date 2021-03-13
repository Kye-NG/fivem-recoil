-- Manifest data
fx_version 'cerulean'
games {'gta5'}

-- Resource stuff
name 'fivem-recoil'
description 'Adds recoil to weapons'
version 'v0.0.1'
author 'Kye Norman-Gill'
url 'https://github.com/Kye-NG/fivem-recoil'

-- Adds additional logging, useful when debugging issues.
client_debug_mode 'false'
server_debug_mode 'false'

-- Leave this set to '0' to prevent compatibility issues 
-- and to keep the save files your users.
experimental_features_enabled '0'

client_script 'client.lua'
