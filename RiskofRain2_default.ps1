Function New-LaunchScriptRiskofrain2PS { 
    #----------   Risk of Rain 2 Install Function   -------------------
    # APP ID # 1180760
    # 
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Query Port
    $global:queryport       = "27016"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Maxplayers
    $global:maxplayers      = "4"
    #                       Server Password
    $global:serverpassword  = ""

    ##############################/\##############################
    ###################### Do not change below #####################
    #                               System Directory
    $global:systemdir               = "$serverdir\RustDedicated_Data"
    #                               Server Config Directory
    $global:servercfgdir            = "$serverdir\Risk of Rain 2_Data\Config"
    #                               Server Executable
    $global:executable              = "Risk of Rain 2"
    #                               Server Executable Directory
    $global:executabledir           = "$serverdir"
    #                               Gamedig Query
    $global:querytype               = "protocol-valve"
    #                               Game Process
    $global:process                 = "Risk of Rain 2"
    #                               Log Directory
    $global:logdirectory            = "$serverdir"
    #                               Server Log
    $global:consolelog              = "Serverlog-*.log"
    #                               Game-Server-Config Directory
    #$global:gamedirname             = "Rust"
    #                               Game-Server-Config
    $global:servercfg               = "server.cfg"
    #                               Server Launch Command
    $global:launchParams            = '@("`"${executable}`"")'
    # Advanced must be set to "0"
    Get-ror2serverInstallChanges
    Get-UserInput
    # Download Game-Server-Config
    #Get-Servercfg
}

Function Get-ror2serverInstallChanges {
    New-Item $servercfgdir\$servercfg -Force
    Add-Content   $servercfgdir\$servercfg `
    "
//====================//
// SERVER.CFG //
//====================//
// Ensure there are no local users.
remove_all_local_users;
// Set default parameters. These can be repeated in server.cfg with the desired parameters changed.
sv_maxplayers $maxplayers;
steam_server_heartbeat_enabled 1;
sv_hostname `"$hostname`";
sv_port $port;
steam_server_query_port $queryport;
steam_server_steam_port 0;
sv_password `"$serverpassword`";

// Execute any custom configuration here.
echo `"Loading custom server configuration...`"
exec server;

// Start hosting.
echo `"Hosting server...`"
host 1;
"
}


