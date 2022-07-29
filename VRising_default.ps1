Function New-LaunchScriptVRisingserverPS {
    #----------   V Rising Dedicated Server   -------------------
    # APP ID # 1829350
    # https://github.com/StunlockStudios/vrising-dedicated-server-instructions
    ################## Change Default Variables #################
    #                           Server IP 
    $global:ip                  = "${ip}"
    #                           Server Name 
    $global:hostname            = "SERVERNAME"
    #                           Server Port
    $global:port                = 9876
    #                           Server Query Port
    $global:queryport           = 9877
    #                           Server Max Players
    $global:maxplayers          = 40
    #                           Server Password
    $global:serverpassword      = ""
    #                           World Name
    $global:worldname           = "world1"
    #                           Rcon Password
    $global:rconpassword        = "$RANDOMPASSWORD"
    #                           Rcon Port
    $global:rconport            = 25575
    ##############################/\##############################
    # 
    # 
    ###################### Do not change below #####################
    #                           System Directory     
    $global:systemdir           = ""
    #                           Server Config Directory
    $global:servercfgdir        = "$serverdir\save-data\Settings"
    #                           Server Executable
    $global:executable          = "VRisingServer"
    #                           Server Executable Directory
    $global:executabledir       = "$serverdir"
    #                           Gamedig Query
    $global:querytype           = "protocol-valve"
    #                           Game Process
    $global:process             = "VRisingServer"
    #                           Log Directory
    $global:logdirectory        = "$serverdir\logs\"
    #                           Server Log
    $global:consolelog          = "VRisingServer.log"
    #                           Game-Server-Config
    $global:servercfg           = "ServerHostSettings.json"  
    #                           Server Launch Command
    $global:launchParams        = '@("${executable} -persistentDataPath .\save-data -serverName `"${hostname}`" -logFile `"${logdirectory}\${consolelog}`"")'
    #                           = '@("${executable} -persistentDataPath .\save-data -serverName `"${hostname}`" -saveName `"${worldname}`" -logFile `"${logdirectory}\${consolelog}`"")'
    #                           VRisingServer.exe -persistentDataPath .\save-data -serverName "My V Rising Server" -saveName "world1" -logFile ".\logs\VRisingServer.log"
    # Advanced must be set to "0"
    Get-UserInput

    Set-Location $executabledir
    Get-Infomessage "***  starting Server before Setting $servercfg Please Wait ***" 'info'
    Start-Process cmd "/c start ${executable} -persistentDataPath .\save-data"
    Start-sleep -Seconds 30
    Get-Infomessage "***  stopping Server before Setting $servercfg Please Wait ***" 'info'
    Get-StopServer   
    
    Get-vrisingInstallChanges
    # Set-Location $currentdir

} 

function Get-vrisingInstallChanges {
   # if (!(Test-Path "$servercfgdir\ServerHostSettings.json")) {
        Get-Infomessage "***  Copying $servercfg to -persistentDataPath ***" 'info'
        Copy-Item -Path "$serverdir\VRisingServer_Data\StreamingAssets\Settings\ServerHostSettings.json" -Destination "$servercfgdir\ServerHostSettings.json" -Force
    #    if (!(Test-Path "$servercfgdir\ServerGameSettings.json")) {
            Get-Infomessage "***  Copying ServerGameSettings.json to -persistentDataPath ***" 'info'
            Copy-Item -Path "$serverdir\VRisingServer_Data\StreamingAssets\Settings\ServerGameSettings.json" -Destination "$servercfgdir\ServerGameSettings.json" -Force
    #    }
  #  } 
    Get-Infomessage "***  Editing Default Server Name $servercfg ***" 'info' 
    $a = Get-Content "$servercfgdir\ServerHostSettings.json" -raw | ConvertFrom-Json
    $a.Name = "${hostname}"
    $a.Port = ${port}
    $a.QueryPort = ${queryport}
    $a.Password = "${serverpassword}" 
    $a.MaxConnectedUsers = ${maxplayers} 
    $a.SaveName = "${worldname}"
    $a.Rcon.Enabled = $true 
    $a.Rcon.Port = ${rconport}
    $a.Rcon.Password = "${rconpassword}"
    Get-Infomessage "***  setting Default Server Name $servercfg ***" 'info' 
    $a | ConvertTo-Json | set-content "$servercfgdir\ServerHostSettings.json" -Force
}