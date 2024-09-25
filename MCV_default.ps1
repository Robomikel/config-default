Function New-LaunchScriptMCVserverPS {
  #
  # Military Conflict: Vietnam Dedicated Server
  # APP ID # 1136190
  # WIKI
  ################## Change Default Variables #################
  #                       Server IP 
  $global:ip              = "${ip}"
  #                       Server Port 
  $global:port            = "27015"
  #                       Client Port
  $global:clientport      = "27005"
  #                       Source TV Port
  $global:sourcetvport    = "27020"
  #                       Server Map 
  $global:defaultmap      = "mcv_camp" 
  #                       Max Players 
  $global:maxplayers      = "24"
  #						  Game Type
  $global:gametype        = "0"
  #                       Game Mode
  $global:gamemode        = "0"
  #                     Server Name
  $global:hostname        = "SERVERNAME"
  #                       Rcon Password
  $global:rconpassword    = "$RANDOMPASSWORD"
  ##############################/\##############################
  # ] cl_game_mode_list (to get full up to date listing)
# GameType: 0 - classic
# 	GameMode: 0 - TeamDeathmatch
# 	GameMode: 1 - Aliens
# 	GameMode: 2 - CaptureTheFlag
# 	GameMode: 3 - Conquest
# 	GameMode: 4 - Deathmatch
# 	GameMode: 5 - FireFight
# 	GameMode: 6 - LastManStanding
# 	GameMode: 7 - GunGame
# 	GameMode: 8 - Demolition
# 	GameMode: 9 - Domination
# 	GameMode: 10 - GunGameDeathmatch
# 	GameMode: 11 - LastTeamStanding
# GameType: 1 - training
# 	GameMode: 0 - training
# GameType: 2 - Fun
# 	GameMode: 0 - Fun
# GameType: 3 - PVE
# 	GameMode: 0 - TeamDeathmatch
# 	GameMode: 1 - Dummy
# 	GameMode: 2 - CaptureTheFlag
# 	GameMode: 3 - Conquest
# GameType: 4 - custom
# 	GameMode: 0 - custom
  ##################### Do not change below #####################
  #                       System Directory 
  $global:systemdir       = "$serverdir\vietnam"
  #                       Server Config Directory
  $global:servercfgdir    = "$serverdir\vietnam\cfg"
  #                       Server Executable 
  $global:executable      = "mcv_x64"
  #                       Server Executable Directory
  $global:executabledir   = "$serverdir"
  #                       Gamedig Query
  $global:querytype       = "protocol-valve"
  #                       Game Process
  $global:process         = "mcv_x64"
  #                       Log Directory
  $global:logdirectory    = "$serverdir\vietnam"
  #                       Server Log
  $global:consolelog      = "console.log"
  #                       Game-Server-Config Directory
  $global:gamedirname     = ""
  #                       Game-Server-Config
  $global:servercfg       = "server.cfg"
  #                       Server Launch Command
  $global:launchParams    = '@("${executable} -console -game vietnam -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers_override ${maxplayers} +game_type ${gametype} +game_mode ${gamemode} -usercon -condebug")'
  # Advanced must be set to "0"
  Get-UserInput
  # Download Game-Server-Config
  #Get-Servercfg
  # Edit Server Game-Server-Config
  #Select-EditSourceCFG
  # Rename Source $executable.exe
  Select-RenameSource
  Get-MCVdefaultCfg
}


Function Get-MCVdefaultCfg {
  Get-Infomessage " Creating server.cfg " 'info'
  New-Item $servercfgdir\$servercfg -Force
  Add-Content   $servercfgdir\$servercfg `
  "  
sv_password   // only needed to make your server private.
sv_contact your@email.com 

//-----------------------------------------------
// Default MCV Dedicated Server Configuration File
// By SHOUBI and Robomikel
//-----------------------------------------------

// Set the Host Name
hostname $hostname
//sv_password "" //public or password protected server!

// HTTP redirect download URL
sv_downloadurl `"`"
sv_allowdownload 1

// ........................... RCON Configuration .......................... //

// RCON - remote console password.
rcon_password $RCONPASSWORD

// Number of minutes to ban users who fail rcon authentication
// min. 0
sv_rcon_banpenalty 0 //permanent ban!

// Max number of times a user can fail rcon authentication before being banned
// min. 1 max. 20
sv_rcon_maxfailures 3

//----------------------------------------------
// server cvars
//----------------------------------------------
sv_alltalk 1
bot_quota 20
bot_quota_mode `"fill`"
sv_allow_votes 0 //disable vote to avoid too much abuse
mp_autokick 0 // avoid getting kick due to inactivity use afk manager plugin for better results

//----------------------------------------------
// server logging
//----------------------------------------------
log on
sv_logbans 1
sv_logecho 1
sv_logfile 1
sv_log_onefile 1

//----------------------------------------------
// Execute Banned user files.
//----------------------------------------------
exec banned_user.cfg
exec banned_ip.cfg
writeid
writeip"
}