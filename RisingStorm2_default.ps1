Function New-LaunchScriptRS2PS {
    # Rising Storm 2 - Dedicated Server
    # APP ID # 418480
    # https://wiki.rs2vietnam.com/index.php?title=DedicatedServer
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Map
    $global:defaultmap      = "VNSU-SongBe"
    #                       Maxplayers
    $global:maxplayers      = "64"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Admin Password
    $global:adminpassword   = "$RANDOMPASSWORD"
    ##############################/\##############################
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\ROGame\Config"
    #                       Server Executable
    $global:executable      = "VNGame"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "VNGame"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\ROGame\Logs"
    #                       Server Log
    $global:consolelog      = "ServerLog.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "ROGame.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} ${defaultmap}?MaxPlayers=${maxplayers}Port=${port}?QueryPort=${queryport}?Multihome=${ip}?EnableWebAdmin=true?WebAdminPort=8080?AdminPassword=${adminpassword} -log=${consolelog} -UNATTENDED")'
    #                       .\Binaries\Win64\VNGame.exe VNSU-SongBe?MaxPlayers=64?EnableWebAdmin=true?WebAdminPort=8080?AdminPassword=yourpasshere -log=ServerLog.log -UNATTENDED
    # Advanced must be set to "0"
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
} 