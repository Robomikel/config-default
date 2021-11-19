Function New-LaunchScriptSatisfactoryPS {
    # Satisfactory Dedicated Server
    # APP ID # 1690800 
    # https://satisfactory.fandom.com/wiki/Dedicated_servers
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "15777"
    #                       Beacon Port 
    $global:beaconport       = "15000"
    # #                       Cube Port
    # $global:clientport       = "27018"
    # #                       Rcon Port
    # $global:rconport        = "27017"
    # #                       Rcon Password
    # $global:rconpassword    = "$RANDOMPASSWORD"
    # #                       Map
    # $global:defaultmap      = "CubeWorld_Light"
    #                       Maxplayers
    # $global:maxplayers      = "20"
    # #                       Server Name
    # $global:hostname        = "SERVERNAME"
    # #                       Server Password
    # $global:serverpassword  = " "
    # #                       World and Ore Seed
    # $global:seed            = "$global:RANDOMSEED"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\ShooterGame\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "FactoryServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Appdata Directory
    $global:saves           = "FactoryGame"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "UE4Server-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\FactoryGame\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "FactoryGame.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "ServerSettings.ini"
    #                       Server Launch Command    
    $global:launchParams    = '@("${executable} -log -unattended -multihome=${ip} -ServerQueryPort=${queryport} -BeaconPort=${beaconport} -Port=${port}" )'
    # Get User Input version must be set to 0
    Get-UserInput
} 