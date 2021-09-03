Function New-LaunchScriptBeyondtheWirePS {
        # BeyondtheWire Server
        # APP ID # 1064780
        # https://beyondthewire.fandom.com/wiki/Server_Configuration
        ################## Change Default Variables #################
        #                       Server IP
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "7887"
        #                       Query Port
        $global:queryport       = "27165"
        #                       Rcon Port
        # $global:rconport        = "27020"
        # #                       Rcon Password
        # $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Maxplayers
        $global:maxplayers      = "100"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        ##############################/\##############################
        # MULTIHOME = The IP Address you want to bind the server to. (Use only if you have multiple IPs on your server) (Optional)

        # Port = Game port

        # QueryPort = Steam query port

        # RANDOM = Randomize map rotation (ALWAYS, FIRST, NONE) (Optional)

        # FIXEDMAXPLAYERS = Player count cannot go higher than this (Optional)

        # FIXEDMAXTICKRATE = MAX server tickrate (Optional)

        # PREFERPREPROCESSOR = CPU Affinity (Optional) UNTESTED

        # -log = Display a log window on the server (Optional)

        # -fullcrashdump = Save a full dump file on crash (can become quite large sometimes) (Optional)
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\WireGame\ServerConfig"
        #                       Server Executable
        $global:executable      = "WireGameServer"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\WireGame\Binaries\Win64"
        #                       Gamedig Query
        $global:querytype       = "protocol-valve"
        #                       Game Process
        $global:process         = "WireGameServer"
        #                       Log Directory
        $global:logdirectory    = "$serverdir\WireGame\Saved\Logs"
        #                       Server Log
        $global:consolelog      = "WireGame.log"
        #                       Game-Server-Config Directory
        # $global:gamedirname     = ""
        #                       Game-Server-Config
        $global:servercfg       = "Server.cfg"
        #                       Server Launch Command
        $global:launchParams    = '@("${executable} MULTIHOME=${ip} Port=${port} QueryPort=${queryport} FIXEDMAXPLAYERS=${maxplayers} FIXEDMAXTICKRATE=35 RANDOM=NONE -log")'
          # Get User Input version must be set to 0
        Get-UserInput
        # Download Game-Server-Config
        # Get-Servercfg
        # Edit Server Game-Server-Config
        # Select-EditSourceCFG
} 