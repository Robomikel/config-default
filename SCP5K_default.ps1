Function New-LaunchScriptSCP5kPS {
    # SCP: 5K - Community Dedicated Server
    # APP ID # 884110
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    # #                       Rcon Port
    # $global:rconport        = "27020"
    # #                       Rcon Password
    # $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Map
    $global:defaultmap      = "Area12_PersistentLevel"
    #                       Maxplayers
    $global:maxplayers      = "6"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\WindowsServer\Pandemic\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "PandemicServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\WindowsServer"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "PandemicServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\WindowsServer\Pandemic\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "Pandemic.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "GameUserSettings.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} ${defaultmap} -log -servername=`"${hostname}`" -SteamServerName=`"${hostname}`" -port=${port} -queryport=${queryport} -maxplayers=${maxplayers} -force_steamclient_link")'
    # start "" WindowsServer/PandemicServer.exe ${defaultmap} -log -servername="${hostname}" -SteamServerName="${hostname}" -port=${port} -queryport=${queryport} -maxplayers=${maxplayers} -force_steamclient_link
    # start "" WindowsServer/PandemicServer.exe %MAP% -log -servername="%SERVERNAME%" -SteamServerName="%SERVERNAME%" -port=%PORT% -queryport=%QUERYPORT% -maxplayers=%MAXPLAYERS% -force_steamclient_link
    Get-UserInput
    # Download Game-Server-Config
    #Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
}