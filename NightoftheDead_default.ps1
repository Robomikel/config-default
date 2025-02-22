Function New-LaunchScriptNotDserverPS {
    # Night of the Dead Dedicated Server
    # APP ID # 	1420710
    # 
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Admin Password
    $global:adminpassword   = "$adminpassword"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\LF\Saved\Config"
    #                       Server Executable
    $global:executable      = "LFServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\LF\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "LFServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\LF\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "LF.log"
    #                       Game-Server-Config Directory
    # $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "ServerSettings.ini"
    #                       Server Launch Command    
    $global:launchParams    = '@("${executable} ?listen -log -Port=${port} -QueryPort=${queryport} -CRASHREPORTS")'
    # Advanced must be set to "0"
    Get-UserInput
    # Install Adjustment
    Get-Infomessage "***  starting Server before Setting $servercfg Please Wait ***" 'info'
    Set-Location $serverdir
    Start-Process cmd "/c StartServer.bat"
    while (!(Get-Process $process -ea SilentlyContinue )) {
        Wait-process -Name $process -Timeout 45 >$null 2>&1
    }
    Get-StopServer    
    Set-Location $currentdir
} 