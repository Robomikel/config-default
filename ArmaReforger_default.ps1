Function New-LaunchScriptArmaReforgerPS {
    #----------  Arma Reforger Server -------------------
    # APP ID # 	1874900	
    # https://community.bistudio.com/wiki/Arma_Reforger:Server_Hosting
    # https://community.bistudio.com/wiki/Arma_Reforger:Startup_Parameters#Hosting
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:ip}            = "${ip}"
    #                       Server Port
    $global:port            = "27016"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Password
    $global:rconpassword    = ""
    #                       Admin Password
    $global:adminpassword   = "$RANDOMPASSWORD"
    #                       SV_LAN
    # $global:sv_lan          = "0"
    #                      Maxplayers
    $global:maxplayers      = "32"    
    
    
    ##############################/\##############################
    
    # As of 0.9.5 it is heavily recommended to use this startup parameter, 
    # set to a value in the 60..120 range; otherwise, the server can try to use all the available resources!
    # -maxFPS 30


    # SCRIPT       : Official scenarios (8 entries)
    # SCRIPT       : --------------------------------------------------
    # SCRIPT       : {90F086877C27B6F6}Missions/99_Tutorial.conf (Tutorial)
    # SCRIPT       : {ECC61978EDCC2B5A}Missions/23_Campaign.conf (Conflict)
    # SCRIPT       : {59AD59368755F41A}Missions/21_GM_Eden.conf (Game Master - Everon)
    # SCRIPT       : {FDE33AFE2ED7875B}Missions/23_Campaign_Montignac.conf (Conflict: Montignac)
    # SCRIPT       : {C700DB41F0C546E1}Missions/23_Campaign_NorthCentral.conf (Conflict: St. Philippe & Morton)
    # SCRIPT       : {1AEE808E7689FE54}Missions/23_Campaign_NWCoast.conf (Conflict: St. Philippe & Lamentin)
    # SCRIPT       : {28802845ADA64D52}Missions/23_Campaign_SWCoast.conf (Conflict: Morton & St. Pierre)
    # SCRIPT       : {28911C35F7B55579}Missions/23_Campaign_WestSmall.conf (Conflict: Morton & Lamentin)
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Configs"
    #                       Server Executable
    $global:executable      = "ArmaReforgerServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "ArmaReforgerServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\log"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "ArmaReforger"
    #                       Game-Server-Config
    $global:servercfg       = "server.json"
    #                       Server Launch Command
    # $global:launchParams    = '@("ArmaReforgerServer.exe -a2sIpAddress 192.168.1.10 -a2sPort 7777 -bindIP 192.168.1.42 -bindPort 2302 -config myConfigFile.json -maxFPS 30 -nwkResolution 500 -nds 1 -staggeringBudget 5000 -streamingBudget 500 -streamsDelta 200 -listScenarios -logStats 10000 -logAppend -loglevel information")'
    $global:launchParams    = '@("${executable} -bindIP ${ip} -bindPort ${port} -config $servercfgdir\${servercfg} -profile $logdirectory -listScenarios -maxFPS 30 -logStats 10000 -loglevel information")'
    
    # Advanced must be set to "0"
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Edit-armareforgeservercfg
    
    # Install Adjustment
    # Get-armareforgeInstallChanges
    # Set-Location $currentdir

} 

function Get-armareforgeInstallChanges {

    new-item -Path ${servercfgdir} -Name ${servercfg} -ItemType File -Value `
"
{
    `"dedicatedServerId`": `"`",
    `"region`": `"US`",
    `"gameHostBindAddress`": `"${ip}`",
    `"gameHostBindPort`": ${port},
    `"gameHostRegisterBindAddress`": `"`",
    `"gameHostRegisterPort`": ,
    `"adminPassword`": `"$adminpassword`",
    `"game`": {
        `"name`": `"$hostname`",
        `"password`": `"`",
        `"scenarioId`": `"{ECC61978EDCC2B5A}Missions/23_Campaign.conf`",
        `"playerCountLimit`": $maxplayers,
        `"autoJoinable`": false,
        `"visible`": true,
        `"gameProperties`": {
            `"serverMaxViewDistance`": 2500,
            `"serverMinGrassDistance`": 50,
            `"networkViewDistance`": 1000,
            `"disableThirdPerson`": true,
            `"fastValidation`": true,
            `"battlEye`": true,
            `"missionHeader`": {
                `"m_iPlayerCount`": 40,
                `"m_eEditableGameFlags`": 6,
                `"m_eDefaultGameFlags`": 6,
                `"other`": `"values`"
            }
        },
        `"mods`": [
            {
                `"modId`": `"`",
                `"name`": `"`",
                `"version`": `"`"
            },
            {
                `"modId`": `"`",
                `"name`": `"`",
                `"version`": `"`"
            }
        ]
    },
    `"a2sQueryEnabled`": true,
    `"steamQueryPort`": $queryport
"

}

Function Edit-armareforgeservercfg {
    Get-Infomessage "***  Editing Default Server Name $servercfg ***" 'info' 
    $a = Get-Content "$servercfgdir\$servercfg" -raw | ConvertFrom-Json
    $a.gameHostBindAddress = "${ip}"
    $a.region = "US"
    $a.gameHostBindPort = "${port}"
    $a.adminPassword = "${adminpassword}"
    $a.game.playerCountLimit = "${maxplayers}"
    $a.game.name = "${hostname}"
    $a.steamQueryPort = "${queryport}"
   # $a.Port = ${port}
    # $a.QueryPort = ${queryport}
    # $a.Password = "${serverpassword}" 
    # $a.MaxConnectedUsers = ${maxplayers} 
    # $a.SaveName = "${worldname}"
    # $a.Rcon.Enabled = $true 
    # $a.Rcon.Port = ${rconport}
    # $a.Rcon.Password = "${rconpassword}"
    Get-Infomessage "***  setting Default Server Name $servercfg ***" 'info' 
    $a | ConvertTo-Json | set-content "$servercfgdir\$servercfg" -Force
}
