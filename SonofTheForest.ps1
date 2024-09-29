Function New-LaunchScriptsofserverPS {
    #----------   Son of the Forest Server Install Function   -------------------
    # APP ID # 2465200
    ################## Change Default Variables #################
    #                   Server IP
    $global:ip          = "${ip}"
    #                   Server Name
    $global:hostname    = "SERVERNAME"
    #                   Steam Port
    $global:steamport   = "8766"
    #                   Server Port
    $global:port        = "27015"
    #                   Server Query Port
    $global:queryport   = "27016"
    #                   Server Max Players
    $global:maxplayers  = "8"
    #                   Server Difficulty
    ${global:gamemode}  = "Normal"

    ##############################/\##############################
    # In server.cfg
    # showLogs on to view console
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = ""
    #                       Appdata Directory
    $global:saves           = "Endnight"
    #                       Server Config Directory
    $global:servercfgdir    = "$($env:LOCALAPPDATA+"low")\$saves\SonsOfTheForestDS"
    #                       Server Executable
    $global:executable      = "SonsOfTheForestDS"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "SonsOfTheForestDS"
    #                       Log Directory
    $global:logdirectory    = "$($env:LOCALAPPDATA+"low")\$saves\SonsOfTheForestDS\logs"
    #                       Server Log
    $global:consolelog      = "sotf_log*.txt"
    #                       Game-Server-Config
    $global:servercfg       = "dedicatedserver.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -verboseLogging")'
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
  {
  `"IpAddress`": `"$ip`",
  `"GamePort`": $steamport,
  `"QueryPort`": $queryport,
  `"BlobSyncPort`": 9700,
  `"ServerName`": `"$hostname`",
  `"MaxPlayers`": $maxplayers,
  `"Password`": `"`",
  `"LanOnly`": false,
  `"SaveSlot`": 1,
  `"SaveMode`": `"Continue`",
  `"GameMode`": `"$gamemode`",
  `"SaveInterval`": 600,
  `"IdleDayCycleSpeed`": 0.0,
  `"IdleTargetFramerate`": 5,
  `"ActiveTargetFramerate`": 60,
  `"LogFilesEnabled`": true,
  `"TimestampLogFilenames`": true,
  `"TimestampLogEntries`": true,
  `"SkipNetworkAccessibilityTest`": false,
  `"GameSettings`": {},
  `"CustomGameModeSettings`": {}
}
  "
}
