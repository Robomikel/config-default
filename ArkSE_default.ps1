Function New-LaunchScriptArkPS {
        # Ark: Survival Evolved Server
        # APP ID # 376030
        ################## Change Default Variables #################
        #                       Server IP
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "7777"
        #                       Query Port
        $global:queryport       = "27015"
        #                       Rcon Port
        $global:rconport        = "27020"
        #                       Rcon Password
        $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Map
        $global:defaultmap      = "TheIsland"
        #                       Maxplayers
        $global:maxplayers      = "70"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        ##############################/\##############################
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\ShooterGame\Saved\Config\WindowsServer"
        #                       Server Executable
        $global:executable      = "ShooterGameServer"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\ShooterGame\Binaries\Win64"
        #                       Gamedig Query
        $global:querytype       = "arkse"
        #                       Game Process
        $global:process         = "ShooterGameServer"
        #                       Log Directory
        $global:logdirectory    = "$serverdir\ShooterGame\Saved\Logs"
        #                       Server Log
        $global:consolelog      = "ShooterGame.log"
        #                       Game-Server-Config Directory
        $global:gamedirname     = "ARKSurvivalEvolved"
        #                       Game-Server-Config
        $global:servercfg       = "GameUserSettings.ini"
        #                       Server Launch Command
        $global:launchParams    = '@("${executable} ${defaultmap}?AltSaveDirectoryName=${defaultmap}?listen?MultiHome=${ip}?MaxPlayers=${maxplayers}?QueryPort=${queryport}?RCONEnabled=True?RCONPort=${rconport}?ServerAdminPassword=${rconpassword}?Port=${port} -automanagedmods -servergamelog")'
          # Advanced must be set to "0"
        Get-UserInput
        # Download Game-Server-Config
        # Get-Servercfg
        # Edit Server Game-Server-Config
        Select-EditSourceCFG

# Function Get-ServerConfig {
#   Get-Infomessage " Creating server.cfg " 'info'
#   New-Item $servercfgdir\$servercfg -Force
#   Add-Content   $servercfgdir\$servercfg `
# "
# - - - - - - GameUserSettings.ini - - - - - - # EDIT \/   \/   \/  \/  \/  \/ \/ \/ \/
Get-Infomessage " Creating $servercfg " 'info'
New-Item $servercfgdir\$servercfg -Force
Add-Content   $servercfgdir\$servercfg [ServerSettings]
Add-Content   $servercfgdir\$servercfg NewMaxStructuresInRange=6000.000000
Add-Content   $servercfgdir\$servercfg DifficultyOffset=0.000000
Add-Content   $servercfgdir\$servercfg XPMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg DayCycleSpeedScale=1.000000
Add-Content   $servercfgdir\$servercfg DayTimeSpeedScale=1.000000
Add-Content   $servercfgdir\$servercfg NightTimeSpeedScale=1.000000
Add-Content   $servercfgdir\$servercfg TamingSpeedMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg HarvestAmountMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg HarvestHealthMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg DinoDamageMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg PlayerDamageMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg StructureDamageMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg PlayerResistanceMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg DinoResistanceMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg StructureResistanceMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg PvEStructureDecayPeriodMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg ResourcesRespawnPeriodMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg PlayerCharacterWaterDrainMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg PlayerCharacterFoodDrainMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg DinoCharacterFoodDrainMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg PlayerCharacterStaminaDrainMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg DinoCharacterStaminaDrainMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg PlayerCharacterHealthRecoveryMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg DinoCharacterHealthRecoveryMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg DinoCountMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg NoTributeDownloads=true
Add-Content   $servercfgdir\$servercfg OnlyAllowSpecifiedEngrams=false
Add-Content   $servercfgdir\$servercfg AutoSavePeriodMinutes=15
Add-Content   $servercfgdir\$servercfg RCONEnabled=true
Add-Content   $servercfgdir\$servercfg RCONPort=$rconport
Add-Content   $servercfgdir\$servercfg ServerCrosshair=false
Add-Content   $servercfgdir\$servercfg ServerForceNoHUD=false
Add-Content   $servercfgdir\$servercfg GlobalVoiceChat=false
Add-Content   $servercfgdir\$servercfg ProximityChat=false
Add-Content   $servercfgdir\$servercfg AllowThirdPersonPlayer=true
Add-Content   $servercfgdir\$servercfg AlwaysNotifyPlayerLeft=true
Add-Content   $servercfgdir\$servercfg DontAlwaysNotifyPlayerJoined=false
Add-Content   $servercfgdir\$servercfg ShowMapPlayerLocation=false
Add-Content   $servercfgdir\$servercfg ServerHardcore=false
Add-Content   $servercfgdir\$servercfg ServerPVE=false
Add-Content   $servercfgdir\$servercfg ServerPassword=
Add-Content   $servercfgdir\$servercfg ServerAdminPassword=
Add-Content   $servercfgdir\$servercfg KickIdlePlayersPeriod=2400.000000
Add-Content   $servercfgdir\$servercfg PreventDownloadSurvivors=True
Add-Content   $servercfgdir\$servercfg PreventDownloadItems=True
Add-Content   $servercfgdir\$servercfg PreventDownloadDinos=True
Add-Content   $servercfgdir\$servercfg MaxNumberOfPlayersInTribe=2
Add-Content   $servercfgdir\$servercfg BattleNumOfTribesToStartGame=15
Add-Content   $servercfgdir\$servercfg TimeToCollapseROD=9000.000000
Add-Content   $servercfgdir\$servercfg BattleAutoStartGameInterval=300.000000
Add-Content   $servercfgdir\$servercfg BattleAutoRestartGameInterval=45.000000
Add-Content   $servercfgdir\$servercfg BattleSuddenDeathInterval=1200.000000
Add-Content   $servercfgdir\$servercfg MaxTamedDinos=5500.000000
Add-Content   $servercfgdir\$servercfg PerPlatformMaxStructuresMultiplier=1.0
Add-Content   $servercfgdir\$servercfg DisablePvEGamma=false
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg PvPStructureDecay=false
Add-Content   $servercfgdir\$servercfg DisableDinoDecayPvE=true
Add-Content   $servercfgdir\$servercfg PvEDinoDecayPeriodMultiplier=1.0
Add-Content   $servercfgdir\$servercfg AdminLogging=true
Add-Content   $servercfgdir\$servercfg EnableDeathTeamSpectator
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [/script/shootergame.shootergameusersettings]
Add-Content   $servercfgdir\$servercfg MasterAudioVolume=1.000000
Add-Content   $servercfgdir\$servercfg MusicAudioVolume=1.000000
Add-Content   $servercfgdir\$servercfg SFXAudioVolume=1.000000
Add-Content   $servercfgdir\$servercfg VoiceAudioVolume=1.000000
Add-Content   $servercfgdir\$servercfg CameraShakeScale=1.000000
Add-Content   $servercfgdir\$servercfg bFirstPersonRiding=False
Add-Content   $servercfgdir\$servercfg bThirdPersonPlayer=False
Add-Content   $servercfgdir\$servercfg bShowStatusNotificationMessages=True
Add-Content   $servercfgdir\$servercfg TrueSkyQuality=0.270000
Add-Content   $servercfgdir\$servercfg FOVMultiplier=1.000000
Add-Content   $servercfgdir\$servercfg GroundClutterDensity=1.000000
Add-Content   $servercfgdir\$servercfg bFilmGrain=False
Add-Content   $servercfgdir\$servercfg bMotionBlur=True
Add-Content   $servercfgdir\$servercfg bUseDFAO=True
Add-Content   $servercfgdir\$servercfg bUseSSAO=True
Add-Content   $servercfgdir\$servercfg bShowChatBox=True
Add-Content   $servercfgdir\$servercfg bCameraViewBob=True
Add-Content   $servercfgdir\$servercfg bInvertLookY=False
Add-Content   $servercfgdir\$servercfg bFloatingNames=True
Add-Content   $servercfgdir\$servercfg bChatBubbles=True
Add-Content   $servercfgdir\$servercfg bHideServerInfo=False
Add-Content   $servercfgdir\$servercfg bJoinNotifications=False
Add-Content   $servercfgdir\$servercfg bCraftablesShowAllItems=True
Add-Content   $servercfgdir\$servercfg LookLeftRightSensitivity=1.000000
Add-Content   $servercfgdir\$servercfg LookUpDownSensitivity=1.000000
Add-Content   $servercfgdir\$servercfg GraphicsQuality=2
Add-Content   $servercfgdir\$servercfg ActiveLingeringWorldTiles=10
Add-Content   $servercfgdir\$servercfg ClientNetQuality=3
Add-Content   $servercfgdir\$servercfg LastServerSearchType=0
Add-Content   $servercfgdir\$servercfg LastServerSearchHideFull=False
Add-Content   $servercfgdir\$servercfg LastServerSearchProtected=False
Add-Content   $servercfgdir\$servercfg HideItemTextOverlay=False
Add-Content   $servercfgdir\$servercfg bDistanceFieldShadowing=True
Add-Content   $servercfgdir\$servercfg LODScalar=1.000000
Add-Content   $servercfgdir\$servercfg HighQualityMaterials=True
Add-Content   $servercfgdir\$servercfg HighQualitySurfaces=True
Add-Content   $servercfgdir\$servercfg bTemperatureF=False
Add-Content   $servercfgdir\$servercfg bDisableTorporEffect=False
Add-Content   $servercfgdir\$servercfg bChatShowSteamName=False
Add-Content   $servercfgdir\$servercfg bChatShowTribeName=True
Add-Content   $servercfgdir\$servercfg EmoteKeyBind1=0
Add-Content   $servercfgdir\$servercfg EmoteKeyBind2=0
Add-Content   $servercfgdir\$servercfg bUseVSync=False
Add-Content   $servercfgdir\$servercfg ResolutionSizeX=1280
Add-Content   $servercfgdir\$servercfg ResolutionSizeY=720
Add-Content   $servercfgdir\$servercfg LastUserConfirmedResolutionSizeX=1280
Add-Content   $servercfgdir\$servercfg LastUserConfirmedResolutionSizeY=720
Add-Content   $servercfgdir\$servercfg WindowPosX=-1
Add-Content   $servercfgdir\$servercfg WindowPosY=-1
Add-Content   $servercfgdir\$servercfg bUseDesktopResolutionForFullscreen=False
Add-Content   $servercfgdir\$servercfg FullscreenMode=2
Add-Content   $servercfgdir\$servercfg LastConfirmedFullscreenMode=2
Add-Content   $servercfgdir\$servercfg Version=5
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [ScalabilityGroups]
Add-Content   $servercfgdir\$servercfg sg.ResolutionQuality=100
Add-Content   $servercfgdir\$servercfg sg.ViewDistanceQuality=3
Add-Content   $servercfgdir\$servercfg sg.AntiAliasingQuality=3
Add-Content   $servercfgdir\$servercfg sg.ShadowQuality=3
Add-Content   $servercfgdir\$servercfg sg.PostProcessQuality=3
Add-Content   $servercfgdir\$servercfg sg.TextureQuality=3
Add-Content   $servercfgdir\$servercfg sg.EffectsQuality=3
Add-Content   $servercfgdir\$servercfg sg.TrueSkyQuality=3
Add-Content   $servercfgdir\$servercfg sg.GroundClutterQuality=3
Add-Content   $servercfgdir\$servercfg sg.IBLQuality=1
Add-Content   $servercfgdir\$servercfg sg.HeightFieldShadowQuality=3
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [/script/engine.gamesession]
Add-Content   $servercfgdir\$servercfg MaxPlayers=$maxplayers
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [SessionSettings]
Add-Content   $servercfgdir\$servercfg SessionName=$hostname
Add-Content   $servercfgdir\$servercfg MultiHome=$ip
Add-Content   $servercfgdir\$servercfg Port=$port
Add-Content   $servercfgdir\$servercfg QueryPort=$queryport
Add-Content   $servercfgdir\$servercfg " "
Add-Content   $servercfgdir\$servercfg [MessageOfTheDay]
Add-Content   $servercfgdir\$servercfg Message=
Add-Content   $servercfgdir\$servercfg Duration=220

# - - - - - - Game.ini - - - -##  EDIT \/   \/   \/  \/  \/  \/ \/ \/ \/
Get-Infomessage " Creating Game.ini " 'info'
New-Item $servercfgdir\Game.ini -Force
Add-Content   $servercfgdir\Game.ini [/script/engine.gamenetworkmanager]
Add-Content   $servercfgdir\Game.ini MaxIdleTime=+0.0
Add-Content   $servercfgdir\Game.ini DefaultMaxTimeMargin=+0.0
Add-Content   $servercfgdir\Game.ini TimeMarginSlack=+1.35
Add-Content   $servercfgdir\Game.ini DefaultMinTimeMargin=-1.0
Add-Content   $servercfgdir\Game.ini TotalNetBandwidth=600000
Add-Content   $servercfgdir\Game.ini MaxDynamicBandwidth=15000
Add-Content   $servercfgdir\Game.ini MinDynamicBandwidth=15000
Add-Content   $servercfgdir\Game.ini " "
Add-Content   $servercfgdir\Game.ini [/script/engine.gamesession]
Add-Content   $servercfgdir\Game.ini MaxSpectators=2
Add-Content   $servercfgdir\Game.ini MaxSplitscreensPerConnection=4
Add-Content   $servercfgdir\Game.ini bRequiresPushToTalk=true
Add-Content   $servercfgdir\Game.ini " "
Add-Content   $servercfgdir\Game.ini [/script/enginesettings.generalprojectsettings]
Add-Content   $servercfgdir\Game.ini CompanyName=Studio Wildcard
Add-Content   $servercfgdir\Game.ini CopyrightNotice=Copyright Wildcard Properties LLC, 2014
Add-Content   $servercfgdir\Game.ini Description=
Add-Content   $servercfgdir\Game.ini LicensingTerms=
Add-Content   $servercfgdir\Game.ini PrivacyPolicy=
Add-Content   $servercfgdir\Game.ini ProjectVersion=
Add-Content   $servercfgdir\Game.ini Homepage=www.playark.com
Add-Content   $servercfgdir\Game.ini SupportContact=support@studiowildcard.com
Add-Content   $servercfgdir\Game.ini ProjectID=B98903CA42E7089552924ABB552F3FA1
Add-Content   $servercfgdir\Game.ini ProjectName=ARK: Survival Evolved
Add-Content   $servercfgdir\Game.ini " "
Add-Content   $servercfgdir\Game.ini [/script/engine.hud]
Add-Content   $servercfgdir\Game.ini ConsoleMessageCount=4
Add-Content   $servercfgdir\Game.ini ConsoleFontSize=5
Add-Content   $servercfgdir\Game.ini MessageFontOffset=0
Add-Content   $servercfgdir\Game.ini bShowHUD=true
Add-Content   $servercfgdir\Game.ini bShowDirectorInfoDebug=false
Add-Content   $servercfgdir\Game.ini bShowDirectorInfoHUD=false
Add-Content   $servercfgdir\Game.ini DebugDisplay=AI
Add-Content   $servercfgdir\Game.ini " "
Add-Content   $servercfgdir\Game.ini [/script/engine.worldsettings]
Add-Content   $servercfgdir\Game.ini ChanceOfPhysicsChunkOverride=1.0
Add-Content   $servercfgdir\Game.ini bEnableChanceOfPhysicsChunkOverride=false
Add-Content   $servercfgdir\Game.ini DefaultAmbientZoneSettings=(bIsWorldSettings=true)
Add-Content   $servercfgdir\Game.ini EnabledPlugins=ExampleDeviceProfileSelector
Add-Content   $servercfgdir\Game.ini " "
Add-Content   $servercfgdir\Game.ini [/script/shootergame.shootergamemode]
Add-Content   $servercfgdir\Game.ini WarmupTime=15
Add-Content   $servercfgdir\Game.ini RoundTime=300
Add-Content   $servercfgdir\Game.ini TimeBetweenMatches=15
Add-Content   $servercfgdir\Game.ini KillScore=2
Add-Content   $servercfgdir\Game.ini DeathScore=-1
Add-Content   $servercfgdir\Game.ini DamageSelfScale=0.3
Add-Content   $servercfgdir\Game.ini MaxBots=1
Add-Content   $servercfgdir\Game.ini GlobalSpoilingTimeMultiplier=1
Add-Content   $servercfgdir\Game.ini GlobalItemDecompositionTimeMultiplier=1
Add-Content   $servercfgdir\Game.ini GlobalCorpseDecompositionTimeMultiplier=1
Add-Content   $servercfgdir\Game.ini OverrideMaxExperiencePointsPlayer=185000
Add-Content   $servercfgdir\Game.ini OverrideMaxExperiencePointsDino=185000
Add-Content   $servercfgdir\Game.ini PvPZoneStructureDamageMultiplier=1
Add-Content   $servercfgdir\Game.ini bIncreasePvPRespawnInterval=false
Add-Content   $servercfgdir\Game.ini IncreasePvPRespawnIntervalCheckPeriod=300
Add-Content   $servercfgdir\Game.ini IncreasePvPRespawnIntervalMultiplier=1
Add-Content   $servercfgdir\Game.ini IncreasePvPRespawnIntervalBaseAmount=60
Add-Content   $servercfgdir\Game.ini ResourceNoReplenishRadiusPlayers=1
Add-Content   $servercfgdir\Game.ini ResourceNoReplenishRadiusStructures=1
Add-Content   $servercfgdir\Game.ini bAutoPvETimer=false
Add-Content   $servercfgdir\Game.ini bAutoPvEUseSystemTime=true
Add-Content   $servercfgdir\Game.ini AutoPvEStartTimeSeconds=0
Add-Content   $servercfgdir\Game.ini AutoPvEStopTimeSeconds=0
# "
# }
}