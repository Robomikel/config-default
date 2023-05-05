    Function New-LaunchScriptIronArmadaserverPS {
    # Iron Armada Dedicated Server
    # APP ID # 770340
    ################## Change Default Variables ################# 
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ###########################/\#################################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Executable
    $global:executable      = "ironarmadaserver"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "ironarmadaserver"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "ia-server.log"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\iron\default-cfg-server\servercfg.toml"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -c --console")'
}