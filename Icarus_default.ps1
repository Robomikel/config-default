Function New-LaunchScriptIcarusPS {
    # Icarus Dedicated Server
    # APP ID # 2089300
    # https://github.com/RocketWerkz/IcarusDedicatedServer/wiki
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "17777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Maxplayers
    $global:maxplayers      = "20"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Password
    $global:serverpassword  = " "
    ##############################/\##############################
    # -LOG=PATH
    # -saveddirsuffix=
    # -ResumeProspect
    # -LoadProspect=[ProspectName]
    # -CreateProspect=”[ProspectType] [Difficulty] [Hardcore?] [SaveName]”
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\CustomServerSaves\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "IcarusServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Icarus\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "IcarusServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\CustomServerSaves\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "Icarus.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "ServerSettings.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -SteamServerName=`"$hostname`" -PORT=$port -QueryPort=$queryport -MULTIHOME=$ip -UserDir=$serverdir\CustomServerSaves -LoadProspect=[OpenWorld_Styx Styx]")'
    # Advanced must be set to "0"
    Get-UserInput
    Get-Infomessage " Creating $servercfg " 'info'
    New-Item $servercfgdir\$servercfg -Force
    Add-Content   $servercfgdir\$servercfg  [/Script/Icarus.DedicatedServerSettings]
    Add-Content   $servercfgdir\$servercfg SessionName=
    Add-Content   $servercfgdir\$servercfg JoinPassword=$serverpassword
    Add-Content   $servercfgdir\$servercfg MaxPlayers=$maxplayers
    Add-Content   $servercfgdir\$servercfg AdminPassword=$rconpassword
    Add-Content   $servercfgdir\$servercfg ShutdownIfNotJoinedFor=300.000000
    Add-Content   $servercfgdir\$servercfg ShutdownIfEmptyFor=300.000000
    Add-Content   $servercfgdir\$servercfg AllowNonAdminsToLaunchProspects=True
    Add-Content   $servercfgdir\$servercfg AllowNonAdminsToDeleteProspects=False
    Add-Content   $servercfgdir\$servercfg LoadProspect=
    Add-Content   $servercfgdir\$servercfg CreateProspect=
    Add-Content   $servercfgdir\$servercfg ResumeProspect=True
    Add-Content   $servercfgdir\$servercfg LastProspectName=
}
