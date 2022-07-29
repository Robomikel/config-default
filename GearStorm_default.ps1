Function New-LaunchScriptGearStormPS {
    # GearStorm Dedicated Server
    # APP ID # 696120
    ################## Change Default Variables #################
    #                       Server IP
    # ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Map
    $global:defaultmap      = "Austrasia"
    #                       Maxplayers
    $global:maxplayers      = "20"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\GearStorm\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "GearStormServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\GearStorm\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "GearStormServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\GearStorm\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "GearStorm.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "Game.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} /game/maps/${defaultmap}?Port=${port}?QueryPort=${queryport}?MaxPlayers=${maxplayers} -log")'
    #                                           /game/maps/Austrasia?Port=7777?QueryPort=27015?MaxPlayers=20 -log
  
    # Advanced must be set to "0"
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    $gameini = "$servercfgdir\Example_Configs\Example_$servercfg"
    $engineini = "$servercfgdir\Example_Configs\Example_Engine.ini"
    Write-log "`$gameini = $servercfgdir\Example_Configs\Example_$servercfg"
    Write-log "`$engineini = $servercfgdir\Example_Configs\Example_Engine.ini"
    If ((Test-path $gameini) -and (Test-Path $engineini)) {
        Copy-Item $gameini  $servercfgdir\$servercfg -Force
        Copy-Item $engineini $servercfgdir\Engine.ini -Force
    }
} 