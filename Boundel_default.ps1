Function New-LaunchScriptboundelserverPS {
    # Boundel Server
    # 454070
    ################## Change Default Variables ################# 
    #                       Requieres Steam Login
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Port 
    $global:port            = "8002"
    ###########################/\#################################
    # 8002 TCP/UDP

    ###################### Do not change below #####################
    #                       System Directory 
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "world"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Datcha_Server"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "world"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = ""
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -batchmode")'
    # Advanced must be set to "0"
    Get-UserInput
}