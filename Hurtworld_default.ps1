Function New-LaunchScriptHurtWorldPS {
    #----------  Hurtworld dedicated server -------------------
    # APP ID # 	405100	
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Password
    # $global:rconpassword    = "$RANDOMPASSWORD"
    #                       SV_LAN
    # $global:sv_lan          = "0"
    #                       Maxplayers
    # $global:maxplayers      = "24"    
    #                       Server Query Port  
    $global:queryport       = "12881"
    #                       Server Port
    $global:port            = "12871"
    #                       Client Port
    # $global:clientport      = "33540"
    
    
    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "Hurtworld"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "Hurtworld"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "gamelog.txt"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = ""
    #                       Server Launch Command
    # $global:launchParams    = '@("${executable}  -batchmode -nographics -exec "host ${port};queryport ${queryport};servername <color=#FF0000>SurvivalServers.com</color> ${hostname};addadmin ${admin}" -logfile "${consolelog}"")'
    #                                            -batchmode -nographics -exec "host 12871;queryport 12881;servername <color=#FF0000>SurvivalServers.com</color> HurtWorld;addadmin UID here " -logfile "gamelog.txt"
    $global:launchParams    = '@("${executable}  -batchmode -nographics -exec `"host ${port};queryport ${queryport};servername <color=#FF0000>${hostname}</color> HurtWorld;addadmin $steamid64 `" -logfile `"${consolelog}`"")'
                                               # -batchmode -nographics -exec "servername Unconfigured;host 12871" -logfile "gamelog.txt"
    # Advanced must be set to "0"
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    # Install Adjustment
    
}
