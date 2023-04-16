Function New-LaunchScriptFrozenFlamePS {
        # Frozen Flame - Dedicated Server
        # APP ID # 1348640
        # https://github.com/DreamsideInteractive/FrozenFlameServer
        ################## Change Default Variables #################
        #                       Server IP
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "7777"
        #                       Query Port
        $global:queryport       = "25575"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        #                       Rcon Port
        $global:rconport        = "27015"
        #                       Rcon Password
        $global:rconpassword    = "$RANDOMPASSWORD"
        ##############################/\##############################
        #
        #
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\FrozenFlame\Saved\Config\WindowsServer"
        #                       Server Executable
        $global:executable      = "FrozenFlameServer"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\FrozenFlame\Binaries\Win64"
        #                       Gamedig Query
        $global:querytype       = "protocol-valve"
        #                       Game Process
        $global:process         = "FrozenFlameServer"
        #                       Log Directory
        $global:logdirectory    = "$serverdir\FrozenFlame\Saved\Logs"
        #                       Server Log
        $global:consolelog      = "FrozenFlame.log"
        #                       Game-Server-Config Directory
        # $global:gamedirname     = " "
        #                       Game-Server-Config
        $global:servercfg       = "Game.ini"
        #                       Server Launch Command
        $global:launchParams    = '@("${executable} -log -LOCALLOGTIMES -MetaGameServerName=`"$hostname`" -ip=${ip} -Port=${port} -queryPort=${queryport} -RconPort=${rconport} -RconPassword=${rconpassword}")'
          # "path\to\FrozenFlameServer.exe" -log -LOCALLOGTIMES -MetaGameServerName="YOURSERVERNAME" -ip=xxx.xxx.xxx.xxx -Port=7777 -queryPort=25575 -RconPort=27015 -RconPassword=YOURPASSWORD
        Get-UserInput
        # Download Game-Server-Config
        # Get-Servercfg
        # Edit Server Game-Server-Config
        # Select-EditSourceCFG
} 
