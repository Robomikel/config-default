Function New-LaunchScriptBlackwakePS {
    # Blackwake Dedicated Server
    # APP ID # 423410
    # https://steamcommunity.com/app/420290/discussions/0/133258092252748163/
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "BlackwakeServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "BODS"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "Server.cfg"
    #                       Server Launch Command    
    $global:launchParams    = '@("${executable} -batchmode -nographics -logFile ${serverdir}\console.log")'
    # Advanced must be set to "0"
    Get-UserInput
} 