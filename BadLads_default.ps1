Function New-LaunchScriptBadLadsPS {
    # BadLads Dedicated Server
    # APP ID # 1203110
    ################## Change Default Variables #################
    #                       Server IP
    # ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\BadLads\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "BadLadsServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\BadLads\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "BadLadsServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\BadLads\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "BadLads.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "BadLadsServerSettings.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -port=${port} -useperfthreads -SteamServerName=${hostname} -log")'
    #                             BadLadsServer.exe -log -port=7777 -useperfthreads -SteamServerName=My-Server-Name
  
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
} 