Function New-LaunchScriptVoxMachinaePS {
    #---------- Vox Machinae Dedicated Server -------------------
    # APP ID # 	944490	
    ################## Change Default Variables #################
    #                       Server IP
    ${global:ip}            = "${ip}"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Maxplayers
    $global:maxplayers      = "16"    
    #                       Server Port
    $global:port            = "4510"
    #                       Password
    # $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Map
    # $global:defaultmap      = "c1_s1"
    # #                       Admin Password
    # $global:adminpassword   = "$RANDOMPASSWORD"
    #                       SV_LAN
    # $global:sv_lan          = "0"
    #                       Server Query Port  
    # $global:queryport       = "27017"
    #                       Client Port
    # $global:clientport      = "33540"
    
    
    ##############################/\##############################
    # See manual.txt for playlist info

    # COMMON FLAGS
    # -maxplayers 16			(set the number of players supported on the server, maximum is 16)
    # -servername "My Cool Server"	(change the server name from the default of "Vox Machinae Server")
    # -lan				(run in local network mode, disables Steam/Oculus networking, is not displayed in server browser outside of local subnet)
    #                 (a LAN game will only show in the server browser for computers on the same subnet, 255.255.255.xxx)
    # -logFile "dedicated.log"	(write out a log file, to check for errors)
    # -bots				(allow bots to spawn and fill in empty server slots)
    # -serverport 5000		(change the server port from default of 4510, note that a LAN game will not show in the server browser on non-default port)
    #                 (in future versions, the next port numerically will be used for ipv6. if hosting multiple servers, increment by twos)
    # -playlist "playlist.txt"	(set the location of the playlist file)
    # -restartempty 24		(set the time in hours after which the server will shut down after being empty)
    # -restartmax 72			(same as above, but the server will shut down even if populated)
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "vmserver"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "vmserver"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "dedicated.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "playlist.txt"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -servername `"${hostname}`" -maxplayers ${maxplayers} -serverport ${port} -playlist `"${servercfg}`" -logFile `"${logdirectory}\${consolelog}`"")'
                            # 
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    # Install Adjustment
    
}
