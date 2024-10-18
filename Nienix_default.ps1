Function New-LaunchScriptNienixPS {
    # Nienix Dedicated Server
    # APP ID # 2320610
    #
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "22222"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################





    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Data"
    #                       Server Executable
    $global:executable      = "NienixDedicatedServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "NienixDedicatedServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Logs"
    #                       Server Log
    $global:consolelog      = "log.txt"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "config.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable}")'
    # Advanced must be set to "0"
    Get-UserInput

    $xml = [xml](Get-Content "$servercfgdir\config.cfg")

    $xml.ConfigurationData.hostname = "$hostname"
    $xml.ConfigurationData.hostport = "$port"

    $xml.Save("$servercfgdir\config.cfg")




}
