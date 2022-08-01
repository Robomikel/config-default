Function New-LaunchScriptUnfortunateSpacemenPS {
        # Unfortunate Spacemen Dedicated Server
        # APP ID # 824240
        # https://steamcommunity.com/sharedfiles/filedetails/?id=2128687084
        ################## Change Default Variables #################
        #                       Server IP
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "7777"
        #                       Query Port
        $global:queryport       = "27015"
        #                       Server Password
        $global:serverpassword  = " "
        #                       Map
        $global:defaultmap      = "Random"
        #                       Maxplayers
        $global:maxplayers      = "16"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        ##############################/\##############################
        # port +1 :  7777==7778
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\UnfortunateSpacemen\Saved\Config\WindowsServer"
        #                       Server Executable
        $global:executable      = "UnfortunateSpacemenServer"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\UnfortunateSpacemen\Binaries\Win64"
        #                       Gamedig Query
        $global:querytype       = "protocol-valve"
        #                       Game Process
        $global:process         = "UnfortunateSpacemenServer"
        #                       Log Directory
        $global:logdirectory    = "$serverdir\UnfortunateSpacemen\Saved\Logs"
        #                       Server Log
        $global:consolelog      = "UnfortunateSpacemen.log"
        #                       Game-Server-Config Directory
        $global:gamedirname     = ""
        #                       Game-Server-Config
        $global:servercfg       = "Game.ini"
        #                       Server Launch Command
        $global:launchParams    = '@("${executable} -MultiHome=${ip} -QueryPort=${queryport} -Port=${port} Map=${defaultmap} Password=${serverpassword} MaxPlayers=${maxplayers} LobbyName=${hostname} -LOG -CONSOLE")'
                                #  -NOSTEAM -console -port=${port} -queryport=${queryport} -multihome=${ip} -log -NOSTEAM 
                                # -log Map=Random Password=1234 MaxPlayers=16 LobbyName=SpacemenServer
          # Advanced must be set to "0"
        Get-UserInput
        # Download Game-Server-Config
        # Get-Servercfg
        # # Edit Server Game-Server-Config
        # Select-EditSourceCFG
        if (!(Test-path $servercfgdir\$servercfg)) {
          Get-Infomessage "***  Creating $servercfg ***" 'info'
          Copy-Item $servercfgdir\EXAMPLE_Game.ini $servercfgdir\$servercfg
        } 
        
} 