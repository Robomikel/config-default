Function New-LaunchScriptCraftopiaPS { 
        #----------   Craftopia Server Install Function   -------------------
        # APP ID # 1670340
        # https://steamcommunity.com/sharedfiles/filedetails/?id=2525156012
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP} = "${ip}"
        #                       Server Port
        $global:port = "6587"
        #                       Server Name
        $global:hostname = "SERVERNAME"
        ##############################/\##############################
        #  isUseSteamLobby=1
        #         To convert your Singleplayer world into Multiplayer you have to open the following folder:
        # C:\Users\%USERNAME%\AppData\LocalLow\PocketPair\Craftopia\save
        ###################### Do not change below #####################
        #                               System Directory
        $global:systemdir = "$serverdir"
        #                               Server Config Directory
        $global:servercfgdir = "$serverdir"
        #                               Appdata Directory
        # $global:saves                   = "PocketPair"
        #                               Server Executable
        $global:executable = "Craftopia"
        #                               Server Executable Directory
        $global:executabledir = "$serverdir"
        #                               Gamedig Query
        $global:querytype = "protocol-valve"
        #                               Game Process
        $global:process = "Craftopia"
        #                               Log Directory
        $global:logdirectory = "$serverdir"
        #                               Server Log
        $global:consolelog = "Serverlog-*.log"
        #                               Game-Server-Config
        $global:servercfg = "ServerSetting.ini"
        #                               Server Launch Command
        $global:launchParams = '@("${executable} -batchmode -showlogs")'
        # Advanced must be set to "0"
        Get-UserInput
        # Download Game-Server-Config
        # Get-Servercfg
}





