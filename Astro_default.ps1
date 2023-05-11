Function New-LaunchScriptAstroPS {
    # ASTRONEER Dedicated Server
    # APP ID # 728470
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Password
    $global:serverpassword  = " "
    ##############################/\##############################
    #Engine.ini 
    #[URL]
    #Port=7777
    #   7777-7778

    #AstroServerSettings.ini
    #PublicIP=10.10.10.100
    #OwnerName=yoursteamname
    #OwnerGuid=0
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Astro\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "AstroServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Astro\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "AstroServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Astro\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "Astro.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "AstroServerSettings.ini"
    #                       Game-Server-Config
    $global:config2       = "Engine.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -log")'
    #                             AstroServer.exe
  
    # Advanced must be set to "0"
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    # Install Adjustment
    Set-Location $executabledir
    Start-Process cmd "/c start AstroServer-Win64-Shipping.exe"
    Start-sleep -Seconds 30
    Get-StopServer    
    Get-asserverInstallChanges
    Set-Location $currentdir
}

Function Get-asserverInstallChanges {
    if ($servercfg) {
        $serverconfig = (gc $servercfgdir\$servercfg).Replace("ServerName=","ServerName=$hostname").Replace("PublicIP=","PublicIP=$extip").Replace("ServerPassword=$password","ServerPassword=") | Set-Content $servercfgdir\$servercfg -Force
    }
    if (Test-Path $servercfgdir\$config2) {
       # New-Item $servercfgdir\$config2 -Force
        Add-Content   $servercfgdir\$config2 `
        "[URL]
Port=$port"
    }
}