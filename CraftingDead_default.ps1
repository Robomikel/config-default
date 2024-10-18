Function New-LaunchScriptCraftingDeadPS {
    # Crafting Dead Dedicated Server
    # APP ID # 685100   
    # https://www.craftingdead.net/
    ################## Change Default Variables #################
    #                           Server IP 
    $global:ip                  = "${ip}"
    #                           Server Name 
    $global:hostname            = "SERVERNAME"
    #                           Server Port
    $global:port                = 28091
    #                           Server Query Port
    $global:queryport           = 28092
    #                           Server Max Players
    $global:maxplayers          = 20
    #                           Server Password
    $global:serverpassword      = ""
    #                           World Name
    $global:worldname           = "World"
    #                           Rcon Port
    $global:rconport            = 28093
    #                           Rcon Password
    $global:rconpassword        = "$RANDOMPASSWORD"
    ##############################/\##############################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "```"Crafting Dead```""
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "Crafting Dead"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Logs"
    #                       Server Log
    $global:consolelog      = "Launch.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "properties.json"
    #                       Server Launch Command
    $global:launchParams    = '@("/c ${executable}")'
    # Advanced must be set to "0"
    Get-UserInput

    Get-CraftingDeadInstallChanges
} 
function Get-CraftingDeadInstallChanges {

    Get-Infomessage " Creating $servercfg " 'info'
    Write-log "Create $servercfgdir\$servercfg"
    Get-Infomessage "***  Editing Default Server Name $servercfg ***" 'info' 
    $a = Get-Content "$servercfgdir\$servercfg" -raw | ConvertFrom-Json
    $a.game_title = "${hostname}"
    $a.game_port = ${port}    
    $a.steam_port_messages = ${queryport}
    $a.world_name = "${worldname}"
    $a.player_count = ${maxplayers} 
    $a.rcon_port = ${rconport}
    $a.rcon_password = "${rconpassword}"
    
    # $a.IpAddress = "${ip}"
    # $a.Password = "${serverpassword}" 
    # $a.SkipNetworkAccessibilityTest = "$true"
    # $a.Rcon.Enabled = $true 

    Get-Infomessage "***  setting Default Server Name $servercfg ***" 'info' 
    # $a | ConvertTo-Json | set-content "$servercfgdir\$servercfg" -Force
    $a | ConvertTo-Json -Depth 10 | set-content "$servercfgdir\$servercfg" -Force



#     new-item -Path ${servercfgdir} -Name ${servercfg} -ItemType File -Value `
# "
# {
#     `"game_title`": `"$hostname`",
#     `"game_description`": `"`",
#     `"game_port`": $port,
#     `"steam_port_messages`": $queryport,
#     `"world_name`": `"$worldname`",
#     `"world_map`": `"Fellvern Island`",
#     `"player_count`": $maxplayers,
#     `"player_admins`": [
#     ],
#     `"rcon`": false,
#     `"rcon_port`": $rconport,
#     `"rcon_password`": `"$rconpassword`"
# }
# "

}

# Function Edit-armareforgeservercfg {
#     Get-Infomessage "***  Editing Default Server Name $servercfg ***" 'info' 
#     $a = Get-Content "$servercfgdir\$servercfg" -raw | ConvertFrom-Json
#     $a.gameHostBindAddress = "${ip}"
#     $a.region = "US"
#     $a.gameHostBindPort = "${port}"
#     $a.adminPassword = "${adminpassword}"
#     $a.game.playerCountLimit = "${maxplayers}"
#     $a.game.name = "${hostname}"
#     $a.steamQueryPort = "${queryport}"
#    # $a.Port = ${port}
#     # $a.QueryPort = ${queryport}
#     # $a.Password = "${serverpassword}" 
#     # $a.MaxConnectedUsers = ${maxplayers} 
#     # $a.SaveName = "${worldname}"
#     # $a.Rcon.Enabled = $true 
#     # $a.Rcon.Port = ${rconport}
#     # $a.Rcon.Password = "${rconpassword}"
#     Get-Infomessage "***  setting Default Server Name $servercfg ***" 'info' 
#     $a | ConvertTo-Json | set-content "$servercfgdir\$servercfg" -Force
# }