Function New-LaunchScriptBT1944serverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Battalion 1944 Dedicated Server
    # APP ID # 805140
    # 
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "7780"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ##############################/\##############################
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Windows"
    #                       Server Executable 
    $global:executable      = "BattalionServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Windows\Battalion\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "BattalionServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Windows\Battalion\Saved\Logs"
    #                       Server Log
    $global:consolelog      = ""  
    #                       Game-Server-Config Directory 
    $global:gamedirname     = "Battalion1944"
    #                       Game-Server-Config
    $global:servercfg       = "DefaultGame.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable}  /Game/Maps/Final_Maps/Derailed?Game=/Script/ShooterGame.WartideGameMode?listen -broadcastip=`"${extip}`" -PORT=${port} -QueryPort=${queryport} -log -defgameini=`"..\..\..\DefaultGame.ini`"")'
    # Advanced must be set to "0"
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
}
Get-Infomessage " Creating $servercfg " 'info'
New-Item $servercfgdir\$servercfg -Force
Add-Content   $servercfgdir\$servercfg [/Script/ShooterGame.BattalionGameMode]
Add-Content   $servercfgdir\$servercfg ServerName=$hostname
Add-Content   $servercfgdir\$servercfg Password=$serverpassword
Add-Content   $servercfgdir\$servercfg RCONPassword=$RANDOMPASSWORD
Add-Content   $servercfgdir\$servercfg PlayMode=Arcade
Add-Content   $servercfgdir\$servercfg IdleServerTimeout=120
Add-Content   $servercfgdir\$servercfg bAllowGlobalVoiceChat=false
Add-Content   $servercfgdir\$servercfg StartType=PlayerCount
Add-Content   $servercfgdir\$servercfg MarketPath=Loadouts/MarketArcade0.json
Add-Content   $servercfgdir\$servercfg CountdownToStartTime=10
Add-Content   $servercfgdir\$servercfg SetupRoundTime=0
Add-Content   $servercfgdir\$servercfg StratTime=5
Add-Content   $servercfgdir\$servercfg RoundTime=600
Add-Content   $servercfgdir\$servercfg PostRoundTime=8
Add-Content   $servercfgdir\$servercfg PostRoundPauseTime=1
Add-Content   $servercfgdir\$servercfg PostMatchTime=30
Add-Content   $servercfgdir\$servercfg WarmupRespawnTime=1
Add-Content   $servercfgdir\$servercfg DefaultReserveSlotTime = 120
Add-Content   $servercfgdir\$servercfg CinematicsEnabled=true
Add-Content   $servercfgdir\$servercfg CountdownToStartCinematicDelay=2
Add-Content   $servercfgdir\$servercfg NumRounds=3
Add-Content   $servercfgdir\$servercfg SwapSidesRound=-1
Add-Content   $servercfgdir\$servercfg SelfOtherDamageScale=1
Add-Content   $servercfgdir\$servercfg SelfGrenadeDamageScale=1
Add-Content   $servercfgdir\$servercfg FriendlyBulletDamageScale=0.33
Add-Content   $servercfgdir\$servercfg FriendlyGrenadeDamageScale=0.85
Add-Content   $servercfgdir\$servercfg ScoreToWinRound=200
Add-Content   $servercfgdir\$servercfg NumNations=3
Add-Content   $servercfgdir\$servercfg MaxPlayersPerTeam=6
Add-Content   $servercfgdir\$servercfg NumTeams=2
Add-Content   $servercfgdir\$servercfg RespawnDelay=5
Add-Content   $servercfgdir\$servercfg PreviousSpawnInfluence=-100
Add-Content   $servercfgdir\$servercfg PreviousSpawnAreaInfluence=-10
Add-Content   $servercfgdir\$servercfg PreviousSpawnAreaInfluenceExponent=1
Add-Content   $servercfgdir\$servercfg PreviousSpawnAreaDistance=1500
Add-Content   $servercfgdir\$servercfg RandomSpawnInfluence=0
Add-Content   $servercfgdir\$servercfg EnemySpawnInfluenceDistance=4000
Add-Content   $servercfgdir\$servercfg EnemySpawnInfluenceValue=-100
Add-Content   $servercfgdir\$servercfg EnemySpawnInfluenceExponent=1
Add-Content   $servercfgdir\$servercfg EnemySpawnWeakForceInfluenceDistance=6000
Add-Content   $servercfgdir\$servercfg EnemySpawnWeakForceInfluenceValue=0
Add-Content   $servercfgdir\$servercfg EnemySpawnWeakForceInfluenceExponent=1
Add-Content   $servercfgdir\$servercfg AllySpawnInfluenceDistance=2000
Add-Content   $servercfgdir\$servercfg AllySpawnInfluenceValue=50
Add-Content   $servercfgdir\$servercfg AllySpawnInfluenceExponent=1
Add-Content   $servercfgdir\$servercfg TeamDeathAreaTimeOfRelevance=10
Add-Content   $servercfgdir\$servercfg TeamDeathAreaInfluence=-20
Add-Content   $servercfgdir\$servercfg TeamDeathAreaDistance=1600
Add-Content   $servercfgdir\$servercfg TeamDeathAreaInfluenceExponent=1
Add-Content   $servercfgdir\$servercfg TeamDeathLastSpawnAreaTimeOfRelevance=10
Add-Content   $servercfgdir\$servercfg TeamDeathLastSpawnAreaInfluence=-5
Add-Content   $servercfgdir\$servercfg TeamDeathLastSpawnAreaDistance=1400
Add-Content   $servercfgdir\$servercfg TeamDeathLastSpawnAreaInfluenceExponent=1
Add-Content   $servercfgdir\$servercfg OutlineAllowed=true
Add-Content   $servercfgdir\$servercfg GrenadeLinesAllowed=true
Add-Content   $servercfgdir\$servercfg LockedToFirstPerson=true
Add-Content   $servercfgdir\$servercfg FadeToBlackTime=4.f
Add-Content   $servercfgdir\$servercfg ForceFreeCamOnSpectatorStart=false
Add-Content   $servercfgdir\$servercfg MaxGunsOnGround=10
Add-Content   $servercfgdir\$servercfg MaxGrenadesOnGround=10
Add-Content   $servercfgdir\$servercfg PlayerKillScore=5
Add-Content   $servercfgdir\$servercfg PlayerAssistScore=3
Add-Content   $servercfgdir\$servercfg DeathScore=0
Add-Content   $servercfgdir\$servercfg InterpStep=60
Add-Content   $servercfgdir\$servercfg RoundWinScore=10
Add-Content   $servercfgdir\$servercfg RoundDrawScore=5
Add-Content   $servercfgdir\$servercfg RoundLossScore=5
Add-Content   $servercfgdir\$servercfg GameWinScore=500
Add-Content   $servercfgdir\$servercfg GameDrawScore=350
Add-Content   $servercfgdir\$servercfg GameLossScore=200
Add-Content   $servercfgdir\$servercfg AttackObjectiveScore=5
Add-Content   $servercfgdir\$servercfg DefendObjectiveScore=10
Add-Content   $servercfgdir\$servercfg WinOnTeamEmpty=True
Add-Content   $servercfgdir\$servercfg Deckname=Market0
Add-Content   $servercfgdir\$servercfg DebugStateChanges=False
Add-Content   $servercfgdir\$servercfg SpectatorTeamEnabled=True
Add-Content   $servercfgdir\$servercfg NumBots=0
Add-Content   $servercfgdir\$servercfg AllowClientBots=False
Add-Content   $servercfgdir\$servercfg DefaultReserveSlotTime=120
Add-Content   $servercfgdir\$servercfg TimeUntilTravel=5
Add-Content   $servercfgdir\$servercfg WaitingToStartTimer=240
Add-Content   $servercfgdir\$servercfg RequiredPlayers=6
Add-Content   $servercfgdir\$servercfg InitialReserveSlotTime=120
Add-Content   $servercfgdir\$servercfg PostJoinReserveSlotTime=30
Add-Content   $servercfgdir\$servercfg VoteTime=30
Add-Content   $servercfgdir\$servercfg VoteKickEnabled=True
Add-Content   $servercfgdir\$servercfg SpectatorTransferTime=1.0f
Add-Content   $servercfgdir\$servercfg IdleCasualServerTime=120
Add-Content   $servercfgdir\$servercfg DedServerMaxTickRate=60
Add-Content   $servercfgdir\$servercfg CharacterDestroyTime=5
Add-Content   $servercfgdir\$servercfg ShouldTryBalanceTeamsOnJoin=False
Add-Content   $servercfgdir\$servercfg AutoBalanceEnabled=True
Add-Content   $servercfgdir\$servercfg RandomMapRotationEnabled=True
Add-Content   $servercfgdir\$servercfg bCheatAdminCmdsEnabled=True
Add-Content   $servercfgdir\$servercfg RecordReplays=True
Add-Content   $servercfgdir\$servercfg RecordHz=32
Add-Content   $servercfgdir\$servercfg CheckpointDelay=30
Add-Content   $servercfgdir\$servercfg SlotTimeout=90
Add-Content   $servercfgdir\$servercfg FillEmptySlotsWithBots=True
Add-Content   $servercfgdir\$servercfg LoggingEnabled=false
Add-Content   $servercfgdir\$servercfg logLocation=./gamelogs
Add-Content   $servercfgdir\$servercfg TakeItemFromBotDistance=200
Add-Content   $servercfgdir\$servercfg +ModeRotation=/Script/ShooterGame.TDMGameMode
Add-Content   $servercfgdir\$servercfg +ModeRotation=/