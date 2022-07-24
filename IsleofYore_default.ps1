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
    $global:servercfgdir    = "$serverdir\IslesOfYore\Saved\Yore"
    #                       Server Executable
    $global:executable      = "IslesOfYoreServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "IslesOfYoreServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\IslesOfYore\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "IslesOfYore.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "Session.json"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -restport=${port} -queryport=${queryport} -log ")'
    #
  
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    Set-Location $executabledir
    Get-Infomessage "***  starting Server before Setting $servercfg Please Wait ***" 'info'
    Start-Process cmd "/c start IslesOfYoreServer.exe"
    Start-sleep -Seconds 30
    Get-Infomessage "***  stopping Server before Setting $servercfg Please Wait ***" 'info'
    Get-StopServer   
    Get-isleofyoreInstallChanges
    Set-Location $currentdir

} 

function Get-isleofyoreInstallChanges {
    Get-Infomessage "***  Editing Default Server Name $servercfg ***" 'info' 
    $a = Get-Content "$serverdir\IslesOfYore\Saved\Yore\session.json" -raw | ConvertFrom-Json
    $a.ServerName = "${hostname}"
    $a.ServerPassword = "${serverpassword}" 
    $a.PublicConnections = "${maxplayers}" 
    Get-Infomessage "***  setting Default Server Name $servercfg ***" 'info' 
    $a | ConvertTo-Json | set-content "$serverdir\IslesOfYore\Saved\Yore\session.json"
}