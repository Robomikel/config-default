Function New-LaunchScriptDSTserverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Don't Starve Together Dedicated Server
    # APP ID # 343050
    # https://steamcommunity.com/sharedfiles/filedetails/?id=590681995
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "10999"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"

    ##############################/\##############################
    # See Default Lanuch Params. 
    #  To start Master and caves servers may need to adjust params
    # to start both
    # May need to configure Ports in .ini
    # storage save and config folder moved to serverfiles root (Klei)
    
    
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Executable
    $global:executable      = "dontstarve_dedicated_server_nullrenderer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\bin"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "dontstarve_dedicated_server_nullrenderer"
    ######                  Moved Klei to Server Root  ####### 
    $global:persistentstorageroot = "$serverdir\Klei"
    #                       Log Directory 
    $global:logdirectory    = "$persistentstorageroot\$gamedirname\$cluster\$shard"
    #                       Server Log
    $global:consolelog      = "server_log.txt"    
    #                       Game-Server-Config Directory
    $global:gamedirname     = "DontStarveTogether"

    $global:shard = "Master"
    $global:cluster = "Cluster_1"

    
    #                       Server Config Directory
    $global:servercfgdir    = "$persistentstorageroot\$gamedirname\$cluster\$shard\"
    #                       Game-Server-Config
    $global:servercfg       = "server.ini"
    # Download Game-Server-Config
    New-Servercfg
    #                       Server Config Directory
    $global:servercfgdir    = "$persistentstorageroot\$gamedirname\$cluster"
    #                       Game-Server-Config
    $global:servercfg       = "cluster.ini"
    # Download Game-Server-Config
    New-Clustercfg
    # Advanced must be set to "0"
    Get-UserInput
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -console_enabled -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root ${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${shard} -backup_log_count 10")'

    # BOTH CAVES AND MASTER
    #$global:launchParams = '@("$executable -console -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root ${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${shard} -backup_logs ; ; $executable -console -persistent_storage_root $serverdir\${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard cave -backup_logs")'

    # Caves
    #$global:launchParams = '@("$executable -console -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root ${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${cave} -backup_logs")'
}

Function New-Servercfg {
Get-Infomessage " Creating $servercfg " 'info'
New-Item $servercfgdir\$servercfg -Force
Add-Content   $servercfgdir\$servercfg [SHARD]
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg is_master=
Add-Content   $servercfgdir\$servercfg "# Default: none"
Add-Content   $servercfgdir\$servercfg "# Required: If shard_enabled = true"
Add-Content   $servercfgdir\$servercfg "# Sets a shard to be the master shard for a cluster. There must be exactly one master server per cluster. Set this to true in your master server`’s server.ini, and false in every other server.ini."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg name=
Add-Content   $servercfgdir\$servercfg "# Default: none"
Add-Content   $servercfgdir\$servercfg "# Required: if shard_enabled = true and is_master = false"
Add-Content   $servercfgdir\$servercfg "# This is the name of the shard that will show up in log files. It is ignored for the master server, which always has the name [SHDMASTER]."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg id=
Add-Content   $servercfgdir\$servercfg "# Default: Randomly generated number."
Add-Content   $servercfgdir\$servercfg "# This is field is automatically generated for non-master servers, and is used internally to uniquely identify a server. Altering this or removing it may cause problems on your server if anybody`’s character currently resides in the world that this server manages."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [STEAM]
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg authentication_port=
Add-Content   $servercfgdir\$servercfg "# Default: 8766"
Add-Content   $servercfgdir\$servercfg "# Internal port used by steam. Make sure that this is different for each server you run on the same machine."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg master_server_port=
Add-Content   $servercfgdir\$servercfg "# Default: 27016"
Add-Content   $servercfgdir\$servercfg "# Internal port used by steam. Make sure that this is different for each server you run on the same machine."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [NETWORK]
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg server_port=$port
Add-Content   $servercfgdir\$servercfg "# Default: 10999"
Add-Content   $servercfgdir\$servercfg "# The UDP port that this server will listen for connections on. If you are running a multi-level cluster, this port must be different for each server on the same machine. This port must be between 10998 and 11018 inclusive in order for players on the same LAN to see it in their server listing. Ports below 1024 are restricted to privileged users on some operating systems."
}

Function New-Clustercfg {
Get-Infomessage " Creating $servercfg " 'info'
New-Item $servercfgdir\$servercfg -Force
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [MISC]
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg max_snapshots=
Add-Content   $servercfgdir\$servercfg "# Default: 6"
Add-Content   $servercfgdir\$servercfg "# Maximum number of snapshots to retain. These snapshots are created every time a save occurs, and are available in the `"Rollback`" tab on the `"Host Game`" screen."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg console_enabled=
Add-Content   $servercfgdir\$servercfg "# Default: true"
Add-Content   $servercfgdir\$servercfg "# Allow lua commands to be entered in the command prompt or terminal that the server is running in."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [SHARD]
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg shard_enabled=
Add-Content   $servercfgdir\$servercfg "# Default: false"
Add-Content   $servercfgdir\$servercfg "# Enable server sharding. This must be set to true for multi-level servers. For single-level servers, it can be omitted."
Add-Content   $servercfgdir\$servercfg "# Must match in each cluster.ini (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg bind_ip=${ip}
Add-Content   $servercfgdir\$servercfg "# Overridable in server.ini"
Add-Content   $servercfgdir\$servercfg "# Default: 127.0.0.1"
Add-Content   $servercfgdir\$servercfg "# Required: If shard_enabled = true and is_master = true"
Add-Content   $servercfgdir\$servercfg "# This is the network address the master server will listen on for other shard servers to connect to. Set this to 127.0.0.1 if all of your servers in your cluster are on the same machine, or 0.0.0.0 if the servers in your cluster are on different machines. This only needs to be set for the master server, either in cluster.ini, or the master server`'s server.ini."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg master_ip=
Add-Content   $servercfgdir\$servercfg "# Overridable in server.ini"
Add-Content   $servercfgdir\$servercfg "# Default: none"
Add-Content   $servercfgdir\$servercfg "# Required: If shard_enabled = true and is_master = false"
Add-Content   $servercfgdir\$servercfg "# This is the I.P. address that a non-master shard will use when trying to connect to the master shard. If all servers in a cluster are on the same machine, set this to 127.0.0.1"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg master_port=
Add-Content   $servercfgdir\$servercfg "# Overridable in server.ini"
Add-Content   $servercfgdir\$servercfg "# Default: 10888"
Add-Content   $servercfgdir\$servercfg "# This is UDP port that the master server will listen on, and that a non-master shard will use when trying to connect to the master shard. This should be set to the same value for all shards by having a single entry in cluster.ini, or omitted completely to use the default. This must be different from the server_port setting on any shard that is running on the same machine as the master shard."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg cluster_key=
Add-Content   $servercfgdir\$servercfg "# Overridable in server.ini"
Add-Content   $servercfgdir\$servercfg "# Default: none"
Add-Content   $servercfgdir\$servercfg "# Required if shard_enabled = true"
Add-Content   $servercfgdir\$servercfg "# This is a password used to authenticate a slave server to the master. If you are running servers on different machines that need to connect to each other, this value must be the same on each machine. For servers running on the same machine, you can just set this once in cluster.ini."
Add-Content   $servercfgdir\$servercfg "# Must match in each cluster.ini (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [STEAM]
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg steam_group_only=
Add-Content   $servercfgdir\$servercfg "# Default: false"
Add-Content   $servercfgdir\$servercfg "# When set to true, the server will only allow connections from players belonging to the steam group listed in the steam_group_id setting."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg steam_group_id=
Add-Content   $servercfgdir\$servercfg "# Default: 0"
Add-Content   $servercfgdir\$servercfg "# Steam group id for steam_group_only / steam_group_admins settings. See here for instructions on finding your steam group id: [Server Admin] https://forums.kleientertainment.com/topic/55994-server-admin-associate-your-server-with-a-steam-group/ Associate your server with a steam group"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg steam_group_admins=
Add-Content   $servercfgdir\$servercfg "# Default: false"
Add-Content   $servercfgdir\$servercfg "# When this is set to true, admins of the steam group specified in steam_group_id will also have admin status on the server. "
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [NETWORK]
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg offline_cluster=
Add-Content   $servercfgdir\$servercfg "# Default: false"
Add-Content   $servercfgdir\$servercfg "# Create an offline cluster. The server will not be listed publicly, and only players on the local network will be able to join, and any steam-related functionality will not work."
Add-Content   $servercfgdir\$servercfg "# Must match in each cluster.ini (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg tick_rate=
Add-Content   $servercfgdir\$servercfg "# Default: 15"
Add-Content   $servercfgdir\$servercfg "# This is the number of times per-second that the server sends updates to clients. Increasing this may improve precision, but will result in more network traffic. It is recommended to leave this at the default value of 15. If you do change this option, it is recommended that you do so only for LAN games, and use a number evenly divisible into 60 (15, 20, 30)."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg whitelist_slots=
Add-Content   $servercfgdir\$servercfg "# Default: 0"
Add-Content   $servercfgdir\$servercfg "# The number of reserved slots for whitelisted players. To whitelist a player, add their Klei UserId to the whitelist.txt file (Place this file in the same directory as cluster.ini)"
Add-Content   $servercfgdir\$servercfg "# Master cluster.ini only (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg cluster_password=
Add-Content   $servercfgdir\$servercfg "# Default: none"
Add-Content   $servercfgdir\$servercfg "# This is the password that players must enter to join your server. Leave this blank or omit it for no password."
Add-Content   $servercfgdir\$servercfg "# Master cluster.ini only (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg cluster_name=$hostname
Add-Content   $servercfgdir\$servercfg "# The name for your server cluster. This is the name that will show up in server browser."
Add-Content   $servercfgdir\$servercfg "# Master cluster.ini only (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg cluster_description=
Add-Content   $servercfgdir\$servercfg "# Default: empty"
Add-Content   $servercfgdir\$servercfg "# Cluster description. This will show up in the server details area on the `"Browse Games`" screen."
Add-Content   $servercfgdir\$servercfg "# Master cluster.ini only (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg lan_only_cluster=
Add-Content   $servercfgdir\$servercfg "# Default: false"
Add-Content   $servercfgdir\$servercfg "# When set to true, the server will only accept connections from machines on the same LAN "
Add-Content   $servercfgdir\$servercfg "# Master cluster.ini only (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg cluster_intention=
Add-Content   $servercfgdir\$servercfg "# Default: Varies, depending on game mode."
Add-Content   $servercfgdir\$servercfg "# The cluster`’s playstyle. This field is the equivalent of the `"Server Playstyle`" field on the `"Host Game`" screen. Valid values are cooperative, competitive, social, or madness."
Add-Content   $servercfgdir\$servercfg "# Master cluster.ini only (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg autosaver_enabled=
Add-Content   $servercfgdir\$servercfg "# Default: true"
Add-Content   $servercfgdir\$servercfg "# When this is set to false, the game will no longer automatically save at the end of each day. The game will still save on shutdown, and can be manually saved using c_save()."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [GAMEPLAY]
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg max_players=$maxplayers
Add-Content   $servercfgdir\$servercfg "# Default: 16"
Add-Content   $servercfgdir\$servercfg "# The maximum number of players that may be connected to the cluster at one time."
Add-Content   $servercfgdir\$servercfg "# Master cluster.ini only (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg pvp=
Add-Content   $servercfgdir\$servercfg "# Default: false"
Add-Content   $servercfgdir\$servercfg "# Enable PVP."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg game_mode=
Add-Content   $servercfgdir\$servercfg "# Default: survival"
Add-Content   $servercfgdir\$servercfg "# The cluster`’s game mode. This field is the equivalent of the `"Game Mode`" field on the `"Host Game`" screen. Valid values are survival, endless or wilderness"
Add-Content   $servercfgdir\$servercfg "# Must match in each cluster.ini (See NOTES)"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg pause_when_empty=
Add-Content   $servercfgdir\$servercfg "# Default: false"
Add-Content   $servercfgdir\$servercfg "# Pause the server when there are no players connected."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg vote_enabled=
Add-Content   $servercfgdir\$servercfg "# Default: true"
Add-Content   $servercfgdir\$servercfg "# Set to true to enable voting features."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg "# NOTES:"
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg "# For multi-level clusters with servers running on more than one machine, you will have multiple copies of the cluster.ini file, one per machine."
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg "# Settings above that are marked `"Master cluster.ini only`" are only valid in the cluster.ini on the same machine as the master, and can be omitted from the cluster.ini on other machines, as they will be ignored."
Add-Content   $servercfgdir\$servercfg "# Settings above that are marked `"Must match in each cluster.ini`" must be set to the same value in each cluster.ini file, or omitted from each cluster.ini file if you wish to use the default (for settings that have one)"

}