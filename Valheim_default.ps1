Function New-LaunchScriptvalheimPS { 
    #----------   Valheim Server Install Function   -------------------
    # APP ID # 896660
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = 2456
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       World 
    $global:defaultmap      = "Dedicated"
    #                       Server Password
    $global:serverpassword = "$RANDOMPASSWORD"

    ##############################/\##############################
    #set SteamAppId=892970

    #echo "Starting server PRESS CTRL-C to exit"
    #REM NOTE: Minimum password length is 5 characters & Password cant be in the server name.
    #REM NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
    # -savedir [PATH] 
    ###################### Do not change below #####################
    #                               System Directory
    $global:systemdir               = "$serverdir\valheim_server_Data"
    #                               Server Config Directory
    $global:servercfgdir            = "$serverdir"
    #                               Server Executable
    $global:executable              = "valheim_server"
    #                               Server Executable Directory
    $global:executabledir           = "$serverdir"
    #                               Gamedig Query
    $global:querytype               = "protocol-valve"
    #                              Server Ports
    $global:queryport               = $port + 1
    #                 
    $global:steamport               = $port + 2
    #                               Game Process
    $global:process                 = "valheim_server"
    #                               Log Directory
    $global:logdirectory            = "$serverdir"
    #                               Server Log
    $global:consolelog              = "Serverlog-*.log"
    #                               Game-Server-Config Directory
    $global:gamedirname             = "$serverdir"
    #                               Game-Server-Config
    $global:servercfg               = "server.cfg"
    #                               Server Launch Command
    #$global:launchParams            = '@("${executable} -nographics -batchmode -name ${hostname} -port ${port} -world ${defaultmap} -password ${serverpassword} -logfile ${logdirectory}\Serverlog-$date.log")'
    # 
    $global:launchParams            = '@("${executable} -nographics -batchmode -name `"${hostname}`" -port ${port} -world `"${defaultmap}`" -password `"${serverpassword}`"")'
    #                                    valheim_server -nographics -batchmode -name "My server" -port 2456 -world "Dedicated" -password "secret"
    # Get User Input version must be set to 0
    Get-UserInput
}





