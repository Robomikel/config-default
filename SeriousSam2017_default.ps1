Function New-LaunchScriptSeriousSamserver2017PS {
    # Serious Sam 2017 Dedicated Server
    # APP ID # 564390
    ################## Change Default Variables ################# 
    #                       Server IP
    ${global:IP}            = "${ip}"
    # #                       Server Port
    $global:port            = "27015"
    #                       Server Query Port
    $global:queryport       = 27016
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Game Mode
    $global:gamemode        = "Cooperative"
    ###########################/\#################################
    
    # (cooperative group)
    #   Cooperative (this is the default)
    #   CooperativeCoinOp
    #   TeamSurvival
    # (versus group)
    #   BeastHunt
    #   CaptureTheFlag
    #   Deathmatch
    #   InstantKill
    #   LastManStanding
    #   LastTeamStanding
    #   MyBurden
    #   TeamBeastHunt
    #   TeamDeathmatch

    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "Sam2017_DedicatedServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Bin\x64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "Sam2017_DedicatedServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "DedicatedServer.log "
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} +gamemode ${gamemode} +maxplayers ${maxplayers} +port ${port} +ip ${ip} +exec ${servercfg} +sessionname ${hostname} +rconpass ${rconpassword} +logfile ${logdirectory}\${consolelog}")'
    #                                           +gamemode (gam_idGameMode)  +level (gam_strLevel) +maxplayers ${maxplayers} +port (prj_uwPort) +ip (net_strLocalHost) +exec (prj_strExecCfg) +gameoptions (prj_strOptionsScript) +sessionname (prj_strMultiplayerSessionName) +rconpass (rcts_strAdminPassword) +logfile (prj_strLogFile)
    # Advanced must be set to "0"
    Get-UserInput

    Get-sam2017Changes
}

function Get-sam2017Changes {

    new-item -Path ${servercfgdir} -Name ${servercfg} -ItemType File -Value `
"
rconpass = `"SuperSecretPassword`"; -- MAKE SURE YOU CHANGE THIS!!!!
sessionname = `"My Server Name`" -- set this to the name of your server

gam_ctMaxPlayers = 8
gamemode=`"Deathmatch`"
gam_bAutoCycleMaps = 1

local prj_strMapList = {
  `"#SunPalace.wld`",   -- put a list of map file names for rotation here
}
"
}
