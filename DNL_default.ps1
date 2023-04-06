Function New-LaunchScriptDNLPS {
        # DNL Dedicated Server
        # APP ID # 630230
        ################## Change Default Variables #################
        #                       Server IP
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "7777"
        #                       Query Port
        $global:queryport       = "27015"
        #                       Rcon Port
        $global:rconport        = "27020"
        #                         Rcon Password
        # $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Admin Password
        $global:adminpassword   = "$RANDOMPASSWORD"
        #                       Server Password
        $global:serverpassword  = " "
        #                       Map
        $global:defaultmap      = "DNL_ALL"
        #                       Maxplayers
        $global:maxplayers      = "70"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        ##############################/\##############################
        # IMPORTANT: need to COPY below dlls to same dir as exe (\DNL\Binaries\Win64), if they are not there or steam services will not work
        # steamclient.dll
        # steamclient64.dll
        # tier0_s.dll
        # tier0_s64.dll
        # vstdlib_s.dll
        # vstdlib_s64.dll

            # 27015-27016 TCP/UDP
            # Required for steam clients to read server information.
            # If you don't have this, people will also not be able to see your server.
            # 7777-7779 TCP/UDP
            # Allows people to connect to your game server
            # 27020 TCP/UDP
            # OPTIONAL This is not required. This is only needed if you want people online to use RCON to remotely administer your server. 
            # DO NOT Port forward this unless you are sure you need it, and you have an admin password setup in your config. 
            # Ignoring this warning could result in someone hijacking your server. You have been warned.


        # Replace MYSERVERNAME with whatever you want to call your server
        # Replace MAPNAME with DNL_ALL to run the default map, or theshard to play the new map
        # Replace PASSWORD with a password for your player
        # Replace MYADMINPASSWORD with a password for your admin
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\DNL\Saved\Config\WindowsServer"
        #                       Server Executable
        $global:executable      = "DNLServer"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\DNL\Binaries\Win64"
        #                       Gamedig Query
        $global:querytype       = "protocol-valve"
        #                       Game Process
        $global:process         = "DNLServer"
        #                       Log Directory
        $global:logdirectory    = "$serverdir\DNL\Saved\Logs\alog"
        #                       Server Log
        $global:consolelog      = "*.log"
        #                       Game-Server-Config Directory
        $global:gamedirname     = ""
        #                       Game-Server-Config
        $global:servercfg       = "GameUserSettings.ini"
        #                       Server Launch Command
        $global:launchParams    = '@("${executable} ${defaultmap}?listen?SessionName=${hostname}?Port=${port}?QueryPort=${queryport}?RCONPort=${rconport}?ServerPassword=${serverpassword}?ServerAdminPassword=${adminpassword}?MaxPlayers=${maxplayers}")'
        #                       start DNLServer.exe ${defaultmap}?listen?SessionName=${hostname}?ServerPassword=${serverpassword}?ServerAdminPassword=${adminpassword}?Port=${port}?QueryPort=${queryport}?MaxPlayers=${maxplayers}exit
        #                       start DNLServer.exe MAPNAME?listen?SessionName=MYSERVERNAME?ServerPassword=PASSWORD?ServerAdminPassword=MYADMINPASSWORD?Port=7777?QueryPort=27016?MaxPlayers=127exit
        #${defaultmap}?Multihome=${ip}?Port=${port}?QueryPort=${queryport}?SessionName=${hostname}?MaxPlayers=${maxplayers}?ServerAdminPassword=${adminpassword}" -no steam client -game -server -log
        #start "" /NORMAL "DNLServer.exe" "/Game/DNL/Maps/CapeOfSacredPath/DNL_ALL?QueryPort=27015?SessionName=CHANGEME?MaxPlayers=127?listen?ServerPassword=CHANGEME?ServerAdminPassword=CHANGEME?DifficultyOffset=1.000000?NewMaxStructuresInRange=6000.000000?GlobalVoiceChat=false?ProximityChat=false?NoTributeDownloads=false?AllowThirdPersonPlayer=false?AlwaysNotifyPlayerLeft=false?DontAlwaysNotifyPlayerJoined=false?ServerHardcore=false?ServerPVE=false?ServerCrosshair=true?ServerForceNoHUD=false?ShowMapPlayerLocation=false?EnablePvPGamma=false?DisableStructureDecayPvE=false?AllowFlyerCarryPvE=false" -nosteamclient -game -server -log
        Get-UserInput
        # Download Game-Server-Config
        #Get-Servercfg
        # Edit Server Game-Server-Config
        #Select-EditSourceCFG
} 