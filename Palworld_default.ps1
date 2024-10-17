Function New-LaunchScriptPalworldPS {
    # Palworld Dedicated Server
    # APP ID # 2394010
    #
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "8211"
    #                       Query Port
    # $global:queryport       = "27017"
    #                       Rcon Port
    $global:rconport        = "25575"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
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
    $global:servercfgdir    = "$serverdir\Pal\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "PalServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "PalServer-Win64-Shipping-Cmd"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Pal\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "Palserver.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "PalWorldSettings.ini"
    #                       Server Launch Command
    #                         '@("${executable} -port=$port -players=$maxplayers -publicip=$extip -publicport=xxxx -publiclobby -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS -logformat=text")'
    $global:launchParams    = '@("${executable} -port=$port -players=$maxplayers -publicip=$extip -publicport=$port -publiclobby -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS -logformat=text")'

    Get-UserInput
    Get-Infomessage "***  starting Server before Setting $servercfg Please Wait ***" 'info'
    Set-Location $executabledir
    Start-process cmd -Args @("/c ${executable}") -NoNewWindow
    while (!(Get-Process $process -ea SilentlyContinue )) {
        Wait-process -Name $process -Timeout 45 >$null 2>&1
    }
    Get-Infomessage "***  stopping Server before Setting $servercfg Please Wait ***" 'info'
    Get-StopServer
    Try {
        # Copy-Item $serverdir\DefaultPalWorldSettings.ini $servercfgdir\$servercfg -Force
        # Write-log "info: Copy-Item $serverdir\DefaultPalWorldSettings.ini $servercfgdir\$servercfg -Force"
        $palwordini = Get-Content $serverdir\DefaultPalWorldSettings.ini
        New-Item -ItemType File -Path $servercfgdir\$servercfg -Force
        Set-Content -Path $servercfgdir\$servercfg -Value $palwordini
        Write-log "info: New-Item $servercfgdir\$servercfg "
    }
    Catch {
        Write-log "Warning: $($_.Exception.Message)"
    }
    (Get-Content -Path $serverdir\DefaultPalWorldSettings.ini -Raw) -replace ( 'ServerName=".+r"',"ServerName=`"$hostname`"") -replace ( 'AdminPassword=""',"AdminPassword=`"$rconpassword`"") -replace ( 'ServerPassword=""',"ServerPassword=`"$serverpassword`"") -replace ( 'ServerPlayerMaxNum=32',"ServerPlayerMaxNum=$maxplayers") -replace ( 'RCONEnabled=False',"RCONEnabled=$true") -replace ( 'RCONPort=.+75',"RCONPort=$rconport")  -replace ( 'PublicPort=.+11',"PublicPort=$port") | Set-Content -Path $servercfgdir\$servercfg -Force
}
