Function New-LaunchScriptIselofYorePS {
    # Isles of Yore Dedicated Server - Windows
    # APP ID # 1827320
    # https://docs.islesofyore.com/serverhosting-howto/
    ################## Change Default Variables #################
    #                       Server IP
    # ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "8085"
    #                       Server Query Port  
    $global:queryport       = "27016"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Password
    $global:serverpassword  = "password"
    #                       Server max Players 
    $global:maxplayers      = "25"
    ##############################/\##############################
    # json config files in IslesOfYore\Saved\Yore
    # Gameplay.json
    # Privileges.json
    # Session.json
    # World.json
    # \IslesOfYore\Saved\Config\WindowsServer
    # Engine.ini
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\IslesOfYore\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "IslesOfYoreServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\IslesOfYore\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "IslesOfYoreServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\IslesOfYore\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "IslesOfYore.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "GameUserSettings.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -restport=${port} -queryport=${queryport} -log ")'
    #
  
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG

    $a = Get-Content 'session.json' -raw | ConvertFrom-Json
    $a.ServerName = "${hostname}"
    $a.ServerPassword = "${serverpassword}" 
    $a.PublicConnections = "${maxplayers}" 
    $a | ConvertTo-Json| set-content 'session.json'
} 