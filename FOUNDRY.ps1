Function New-LaunchScriptFOUNDRYPS {
    #----------   FOUNDRY Server Install Function   -------------------
    # APP ID # 2915550
    ################## Change Default Variables #################
    #                   Server IP
    $global:ip          = "${ip}"
    #                   Server Name
    $global:hostname    = "SERVERNAME"
    #                   Save Interval
    $global:saveinterval   = "300"
    #                   Server Port
    $global:port        = "3724"
    #                   Server Query Port
    $global:queryport   = "27015"
    #                   server world name
    $global:galaxyname  = "MyFancyFactory"
    #                   Server Password
    $global:serverpassword  = "$RANDOMPASSWORD"
    #                   Server Max Players
    $global:maxplayers  = "32"

    ##############################/\##############################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = ""
    #                       Appdata Directory
    # $global:saves           = "Channel 3 Entertainment\FoundryDedicatedServer\save"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "FoundryDedicatedServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "FoundryDedicatedServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\saves"
    #                       Server Log
    $global:consolelog      = "Player.log"
    #                       Game-Server-Config
    $global:servercfg       = "app.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable}")'
    # Advanced must be set to "0"
    Get-UserInput

    Set-Location $executabledir
    Get-Infomessage "***  starting Server before Setting $servercfg Please Wait ***" 'info'
    Start-Process cmd "/c start ${executable}"
    Start-sleep -Seconds 30
    Get-Infomessage "***  stopping Server before Setting $servercfg Please Wait ***" 'info'
    Get-StopServer
    Get-ServerConfig
}

Function Get-ServerConfig {
    Get-Infomessage " Creating $servercfg " 'info'
    Write-log "Create $servercfgdir\$servercfg"
    New-Item $servercfgdir\$servercfg -Force
    Add-Content   $servercfgdir\$servercfg `
  "
server_name=$hostname
server_password=$serverpassword
server_world_name=$galaxyname
autosave_interval=$saveinterval
server_port=$port
server_query_port=$queryport
server_is_public=$true
pause_server_when_empty=$true
mapseed=
server_persistent_data_override_folder=$logdirectory
server_max_players=$maxplayers
  "
}

