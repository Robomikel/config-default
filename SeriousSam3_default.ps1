Function New-LaunchScriptSeriousSamserver3PS {
    # Serious Sam 3 Dedicated Server
    # APP ID # 41080
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
    $global:servercfgdir    = "$serverdir\Content\SeriousSam3\Config"
    #                       Server Executable
    $global:executable      = "Sam3_DedicatedServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Bin"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "Sam3_DedicatedServer"
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

    Get-sam3Changes
}

function Get-sam3Changes {

    new-item -Path ${servercfgdir} -Name ${servercfg} -ItemType File -Value `
"
gam_idGameMode=`"Cooperative`";
prj_uwPort=27015;
rcts_strAdminPassword=`"somepassword`";
prj_strMultiplayerSessionName=`"laban's server`";
rcts_strWelcomeNote=`"Welcome admin`";
gam_bAllowArmorItems=1;
gam_bAllowHealthItems=1;
gam_bAmmoStays=1;
gam_bArmorStays=1;
net_bClientsMayPause=0;
gam_bCustomizedDifficulty=1;
gam_gdDifficulty=4;
gam_strLevel=`"Content/SeriousSam3/Levels/01_BFE/01_CairoSquare/01_CairoSquare.wld`";
gam_bAutoCycleMaps=true
gam_iExtraEnemyStrength=0;
gam_iExtraEnemyStrengthPerPlayer=0;
gam_bExtraMPEnemies=1;
gam_bFriendlyFire=0;
gam_bHealthStays=1;
gam_bInfiniteAmmo=0;
gam_ctMaxPlayers=5;
gam_ctPrivateSlots=1;
gam_iRespawnCredits=-1;
gam_bRespawnInPlace=1;
-- gam_bWeaponStay=1;
gam_bAllowSeriousBombItems=0;
prj_iDedicatedFPS=100;
"
}
