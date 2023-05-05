Function New-LaunchScriptStickyBotsPS {
        # StickyBots Dedicated Server
        # APP ID # 974130
        ################## Change Default Variables #################
        #                       Server IP
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "7777"
        #                       Query Port
        $global:queryport       = "27015"
        # #                       Rcon Port
        # $global:rconport        = "27020"
        # #                       Rcon Password
        # $global:rconpassword    = "$RANDOMPASSWORD"
        # #                       Map
        # $global:defaultmap      = "TheIsland"
        # #                       Maxplayers
        # $global:maxplayers      = "70"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        ##############################/\##############################
        # port +1 :  7777==7778
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\blank1\Saved\Config\WindowsServer"
        #                       Server Executable
        $global:executable      = "blank1Server-Win64-Shipping"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\blank1\Binaries\Win64"
        #                       Gamedig Query
        $global:querytype       = "protocol-valve"
        #                       Game Process
        $global:process         = "blank1Server-Win64-Shipping"
        #                       Log Directory
        $global:logdirectory    = "$serverdir\blank1\Saved\Logs"
        #                       Server Log
        $global:consolelog      = "blank1.log"
        #                       Game-Server-Config Directory
        $global:gamedirname     = ""
        #                       Game-Server-Config
        $global:servercfg       = "Game.ini"
        #                       Server Launch Command
        $global:launchParams    = '@("${executable} -MultiHome=${ip} -QueryPort=${queryport} -Port=${port} -log")'
          # Advanced must be set to "0"
        Get-UserInput
        # Download Game-Server-Config
        # Get-Servercfg
        # # Edit Server Game-Server-Config
        # Select-EditSourceCFG
} 