Function New-LaunchScriptDayZserverPS {
    #----------   DayZ Server  -------------------
    # APP ID # 223350
    # requires https://www.microsoft.com/en-us/download/details.aspx?id=35 Direct x
    # https://community.bistudio.com/wiki/DayZ:Server_Configuration
    ################## Change Default Variables #################
    #                       Requieres Steam Login
    #                       Server IP
    ${global:IP}            = "${ip}"
    # default reserved ports are 2302 - 2306 gameports must be N+100 ie 2402-2406  "
    #                       Server Port 
    $global:port            = "2302"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Admin Password
    $global:adminpassword   = "$RANDOMPASSWORD"
    #                       Rcon Port
    $global:rconport        = "2301"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Mods
    $global:mods            = " "
    # $mods                 ="Mods\1351712613;Mods\1355481562;Mods\1374639840;Mods\1439779114;Mods\333310405;Mods\450814997;Mods\463939057;Mods\549676314;Mods\773125288;Mods\773131200;Mods\843425103;Mods\843577117;Mods\843593391;Mods\497660133"
    #                       Server Mods
    $global:servermods      = " "
    ##############################/\##############################
    # -config=serverDZ.cfg - Selects the Server Config File
    # -port=2302 - Port to have dedicated server listen on
    # -profiles=C:\Users\%USER%\Documents\DayZServer – Path to the folder containing server profile. By default, server logs are written to server profile folder. Logs/dumps/etc will be created there, along with BattlEye/BEC/Rcon related files. Windows Environment variables are supported (E.g. %userprofile%).
    # -doLogs - Enables all log messages in the server RPT file
    # -adminLog - Enables the admin log
    # -netLog - Enables the network traffic logging
    # -freezeCheck - Stops the server when frozen for more than 5 min and create a dump file
    # -filePatching - Ensures that only PBOs are loaded and NO unpacked data.
    # -BEpath= - Sets a custom path to the Battleye files
    # -cpuCount= - Sets the number of logical CPU cores to use for parallel tasks processing. It should be less or equal than the numbers of available cores.
    # -limitFPS= - Limits server FPS to specified value (current max is 200) to lower CPU usage of low population servers.
    # -mod=<string> - Loads the specified sub-folders for different mods. Separated by semi-colons. Absolute path and multiple stacked folders are possible.
    # -serverMod=<string> 
    ##############################/\##############################
    #               Advanced Steam WorkShop Mods COnfiguration
    #                       WorkShop Mod Directory
    $global:moddir        = "$serverdir\Mods"

    #                       steam appID for SE regular game (workshop content tied to this appID)
    $global:reg_appID       = '107410'
    #                       list of mods to download and copy to server mod folder
    $global:wsmods          = "@('450814997','463939057','773125288','773131200','843593391','1439779114','333310405','1374639840')"
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = ""
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\cfg"
    #                       Server Executable
    $global:executable      = "DayZServer_x64"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "arma3"
    #                       Game Process
    $global:process         = "DayZServer_x64"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\SC"
    #                       Server Log
    $global:consolelog      = "dayzserver_*.rpt"
    #                       Game-Server-Config Directory 
    $global:gamedirname     = "DayZ"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    # #                       Game-Server-Config
    # $global:config2         = "network.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -ip=${ip} -port=${port} -config=${servercfgdir}\${servercfg} -mod=${mods} -servermod=${servermods} -bepath=${serverdir}\battleye\ -profiles=SC -doLogs -adminLog -netLog -freezeCheck -filePatching -limitFPS=120 ")'
                              #'@("${executable} -ip=${ip} -port=${port} -config=${servercfgdir}\${servercfg} -mod=${mods} -servermod=${servermods} -bepath=${serverdir}\battleye\ -profiles=SC -doLogs -adminLog -netLog -freezeCheck -filePatching -cpuCount= -limitFPS=120                           
                              # -ip=${ip} -port=${port} -config=${servercfgfullpath} -mod=${mods} -servermod=${servermods} -bepath=${bepath} -limitFPS=60 -dologs -adminlog -freezeCheck
                              # ${executable} -ip=${ip} -port=${port} -cfg=${servercfgdir}\network.cfg -config=${servercfgdir}\${servercfg} -mod=${mods} -servermod=${servermods} -bepath=${serverdir}\battleye\ -profiles=SC -name=SC -loadmissiontomemory
      # Advanced must be set to "0"
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg    
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Install Adjustment
    Get-InstallChangesdayz
}

Function Get-InstallChangesdayz {
    Add-Content $ssmlog "[$logdate] Creating BEserver.cfg" 
    New-Item $serverdir\battleye\BEServer.cfg -Force | Out-File -Append -Encoding Default  $ssmlog
    Add-Content   $serverdir\battleye\BEServer.cfg "RConPassword $RCONPASSWORD"
    Add-Content   $serverdir\battleye\BEServer.cfg "RConIP 127.0.0.1"
    Add-Content   $serverdir\battleye\BEServer.cfg "RConPort $RCONPORT"
    ((Get-Content -path $servercfgdir\${servercfg} -Raw) -replace '\b32\b', "$maxplayers") | Set-Content -Path $servercfgdir\${servercfg} 
    ((Get-Content -path $servercfgdir\${servercfg} -Raw) -replace "\bdayzpass\b", "$SERVERPASSWORD") | Set-Content -Path $servercfgdir\${servercfg}
}