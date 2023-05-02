Function New-LaunchScriptacserverPS {
    # Assetto Corsa Dedicated Server
    # 	302550
    # https://www.assettocorsa.net/forum/index.php?faq/dedicated-server-manual.28/
    #$global:systemdir="Assetto Corsa\Server"
    
    ################## Change Default Variables #################
    
    ##############################/\##############################
    
    #TCP/UDP 9600
    #TCP 8081
    #Change executable and process to AssettoServer, if mod installed
    
    ###################### Do not change below #####################
    #                           System Directory
    $global:systemdir           = "$serverdir"
    #                           Server Config Directory
    $global:servercfgdir        = "$serverdir\cfg"
    #                           Server Executable. Use "AssettoServer" if Mod installed
    $global:executable          = "acServer"
    #                           Server Executable Directory
    $global:executabledir       = "$serverdir"
    #                           Gamedig Query
    $global:querytype           = "assettocorsa"
    #                           Game Process. Use "AssettoServer" if Mod installed
    $global:process             = "acServer"
    #                           Log Directory
    $global:logdirectory        = "$serverdir\logs"
    #                           Server Log
    $global:consolelog          = "output_*.log"
    #                           Game-Server-Config
    $global:servercfg           = "server_cfg.ini"
    #                           Server Launch Command
    $global:launchParams        = '@("${executable}")'
    # Advanced must be set to "0"
    Get-UserInput
}