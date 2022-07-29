Function New-LaunchScriptRemnantsPS {
        # Remnants Server
        # APP ID # 1141420
        ################## Change Default Variables #################
        #                       Server IP
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "7777"
        #                       Query Port
        $global:queryport       = "27015"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        ##############################/\##############################
        # UDP 14001, 7777
        #TCP 1985
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\Remnants\Saved\Config\WindowsServer"
        #                       Server Executable
        $global:executable      = "RemnantsServer-Win64-Test"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\Remnants\Binaries\Win64"
        #                       Gamedig Query
        $global:querytype       = "protocol-valve"
        #                       Game Process
        $global:process         = "RemnantsServer-Win64-Test"
        #                       Log Directory
        $global:logdirectory    = "$serverdir\Remnants\Saved\Logs"
        #                       Server Log
        $global:consolelog      = "Remnants.log"
        #                       Game-Server-Config Directory
        # $global:gamedirname     = "ARKSurvivalEvolved"
        #                       Game-Server-Config
        $global:servercfg       = "ServerConfig.ini"
        #                       Server Launch Command
        $global:launchParams    = '@("${executable} -MultiHome=${ip} -Port=${port} -QueryPort=${queryport} -log -force_steamclient_link")'
          # Advanced must be set to "0"
        Get-UserInput
        # Download Game-Server-Config
        # Get-Servercfg
        # Edit Server Game-Server-Config
        # Select-EditSourceCFG
} 