Function New-LaunchScriptZSGOPS {
    # ZSGO Dedicated Server
    # APP ID # 2536350
    #
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "26900"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Server Password
    $global:serverpassword  = " "
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\ZSGO\Content\DedicatedServer"
    #                       Server Executable
    $global:executable      = "ZSGOServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\ZSGO\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "ZSGOServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\ZSGO\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "ZSGO.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "ServerConfig.json"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -port=$port -queryport=$queryport -multihome=$ip")'

    Get-UserInput
    if((Test-Path $servercfgdir\$servercfg)){
        Get-Infomessage "Checking $servercfg" 'info'
        $jsonFile = "$servercfgdir\$servercfg"
        $jsonData = Get-Content -Raw $jsonFile | ConvertFrom-Json

        Get-Infomessage "edit $hostname  $servercfg" 'info'
        $jsonData.ServerName = "$hostname"

        Get-Infomessage "edit $serverpassword  $servercfg" 'info'
        $jsonData.ServerPassword = "$serverpassword"

        Get-Infomessage "edit $maxplayers  $servercfg" 'info'
        $jsonData.MaxPlayers = "$maxplayers"
        # Example: Remove a property
        # $jsonData.PSObject.Properties.Remove("propertyNameToRemove")
        Get-Infomessage "creating $servercfg" 'info'
        $jsonData | ConvertTo-Json -Depth 10 | Set-Content "$servercfgdir\$servercfg"

    }

}

