Function New-LaunchScriptTF2serverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Team Fortress 2 Dedicated Server
    # APP ID # 232250
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Game Server Token
    $global:gslt            = "GameServerToken"
    #                       Map
    $global:defaultmap      = "cp_badlands"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"

    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory 
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\tf\cfg"
    #                       Server Executable
    $global:executable      = "tf2"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "tf2"
    #                       Game Process
    $global:process         = "tf2"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\tf"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "TeamFortress2"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    # Get User Input version must be set to 0
    Get-UserInput
    #                       Server Launch Command
    If ($gslt -ne "GameServerToken")  {
        $global:launchParams    = '@("${executable} -console -game tf -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -condebug")'
    }
    Else {
        $global:launchParams    = '@("${executable} -console -game tf -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -condebug")'
    }

    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}