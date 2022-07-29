Function New-LaunchScriptSquadserverPS {
    # Squad Dedicated Server
    # APP ID # 403240
    # https://squad.gamepedia.com/Server_Configuration
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7787"
    #                       Query Port
    $global:queryport       = "27165"
    #                       Maxplayers
    $global:maxplayers      = "80"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    
    # Need to be open on Windows firewall and router.
    # Port = Game port = UDP (Default 7787, 7788 UDP)
    # QueryPort = Steam query port = UDP (Default 27165 UDP)
    # QueryPort+1 = Second Steam query port = UDP and TCP (Default 27165, 27166 UDP and TCP)
    # RCON Port = UDP and TCP (Default 21114) must be open.
    
    #               Advanced Steam WorkShop Mods Configuration
    #                       WorkShop Mod Directory
    $global:moddir        = "$systemdir\Mods"

    #                       steam appID for SE regular game (workshop content tied to this appID)
    $global:reg_appID       = '393380'
    #                       list of mods to download and copy to server mod folder
    $global:wsmods          = "@('2428425228')"
    
    
    ###################### Do not change below #####################
    #                               System Directory
    $global:systemdir               = "$serverdir\SquadGame\Plugins"
    #                               Server Config Directory
    $global:servercfgdir            = "$serverdir\SquadGame\ServerConfig"
    #                               Server Executable
    $global:executable              = "SquadGameServer"
    #                               Server Executable Directory
    $global:executabledir           = "$serverdir"
    #                               Gamedig Query
    $global:querytype               = "protocol-valve"
    #                               Game Process
    $global:process                 = "SquadGameServer"
    #                               Log Directory
    $global:logdirectory            = "$serverdir\SquadGame\Saved\Logs"
    #                               Server Log
    $global:consolelog              = "SquadGame.log"
    #                               Game-Server-Config Directory
    $global:gamedirname             = "Squad"
    #                               Game-Server-Config
    $global:servercfg               = "Server.cfg"
    #                               Server Launch Command
    $global:launchParams            = '@("${executable} MULTIHOME=${IP} Port=${port} QueryPort=${queryport} FIXEDMAXPLAYERS=${maxplayers} FIXEDMAXTICKRATE=50 RANDOM=ALWAYS -log")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    set-plugins
    Function set-plugins {
        If(!Test-path $systemdir){
            New-item -Name $systemdir -ItemType Directory
        }
    }
} 