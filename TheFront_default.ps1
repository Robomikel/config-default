Function New-LaunchScriptTheFrontPS {
    # The Front Dedicated Server
    # APP ID # 2612550
    #
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = 7777
    #                       Query Port
    $global:queryport       = $($port+2)
    #                       Server Password
    $global:serverpassword  = " "
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Admin Steam ID 64
    $global:steamid64       = " "
    #                       BeaconPort
    $global:beaconport      = $($port+1)
    ##############################/\##############################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\TheFrontManager"
    #                       Server Executable
    $global:executable      = "TheFrontServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\ProjectWar\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "TheFrontServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\ProjectWar\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "TheFrontServer.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "ServerConfig_.ini"
    #                       Server Launch Command
    #                       start "" "C:\Path\to\Server\Directory\ProjectWar\Binaries\Win64\TheFrontServer.exe" ProjectWar ProjectWar_Start ?Listen?MaxPlayers=8 -server -game -QueueThreshold=8 -ServerName="Your server name" -ServerAdminAccounts=STEAM64ID;STEAM64ID;STEAM64ID -log log=log.log -locallogtimes -EnableParallelCharacterMovementTickFunction -EnableParallelCharacterTickFunction -UseDynamicPhysicsScene -OutIPAddress=YOUR_PUBLIC_IP -ServerID=ANY_IDEA -port=PORT -BeaconPort=PORT+1 -QueryPort=PORT+2 -Game.PhysicsVehicle=false -ansimalloc -Game.MaxFrameRate=35 -ShutDownServicePort=PORT+3
    $global:launchParams    = '@("${executable} ProjectWar ProjectWar_Start ?Listen?MaxPlayers=$maxplayers -ServerName=`"$hostname`" -ServerAdminAccounts=$steamid64 -OutIPAddress=$extip -ServerID=ANY_IDEA -port=$port -BeaconPort=$beaconport -QueryPort=$queryport -ShutDownServicePort=$([int]$port+3)  -Game.PhysicsVehicle=false -ansimalloc -Game.MaxFrameRate=35 -server -game -QueueThreshold=8  -log log=$consolelog -locallogtimes -EnableParallelCharacterMovementTickFunction -EnableParallelCharacterTickFunction -UseDynamicPhysicsScene")'

    Get-UserInput
    If(!(Test-Path $servercfgdir)){
        New-item -ItemType Directory -Name "TheFrontManager" -Path $systemdir
    }
    If(!(Test-Path $servercfgdir\$servercfg)){
        Get-Infomessage "creating $servercfg" 'info'
        New-Item -ItemType File -Name $servercfgdir\$servercfg -Force
        Add-Content $servercfgdir\$servercfg [BaseServerConfig]
        Add-Content $servercfgdir\$servercfg IsCanMail=1.000000
        Add-Content $servercfgdir\$servercfg 'ServerName="Your server name, remove if the name was set on the command line"'
        Add-Content $servercfgdir\$servercfg ServerPassword=$serverpassword
        Add-Content $servercfgdir\$servercfg 'ServerTitle="A short description of your server"'
        Add-Content $servercfgdir\$servercfg PlayerAddExpRate=1
    }
    # if((Test-Path $servercfgdir\$servercfg)){
    #     $jsonFile = "$servercfgdir\$servercfg"
    #     $jsonData = Get-Content -Raw $jsonFile | ConvertFrom-Json

    #     $jsonData.ServerName = "$hostname"

    #     $jsonData.ServerPassword = "$serverpassword"

    #     $jsonData.MaxPlayers = "$maxplayers"
    #     # Example: Remove a property
    #     # $jsonData.PSObject.Properties.Remove("propertyNameToRemove")
    #     $jsonData | ConvertTo-Json -Depth 10 | Set-Content "$servercfgdir\$servercfg"

    # }

}

