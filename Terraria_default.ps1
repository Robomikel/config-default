Function New-LaunchScriptTerrariaPS {
    # Terraria Dedicated Server
    # APP ID # 105600
    ################## Change Default Variables #################
    #                       Server IP
    # ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Password
    $global:serverpassword  = "$RANDOMPASSWORD"
    #                       World Name  
    $global:galaxyname      = "WorldName"
    #                       World Seed
    $global:seed            = "$global:RANDOMSEED"
    ##############################/\##############################
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "TerrariaServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Appdata\Roaming Directory
    $global:saves           = "Terraria"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "TerrariaServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "BadLads.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "servercfg.txt"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -config $servercfgdir\$servercfg")'

  
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    set-serverterrariaconfig
} 
Function set-serverterrariaconfig{
    if (!(Test-path $servercfgdir\$servercfg)) {
        New-Item $servercfgdir\$servercfg -Force
        Add-Content   $servercfgdir\$servercfg `
       "world=$env:APPDATA\Terraria\Worlds\$galaxyname.wld
       #Creates a new world if none is found. World size is specified by: 1(small), 2(medium), and 3(large).
       autocreate=1
       
       #Sets the world seed when using autocreate
       seed=$seed
       
       #Sets the name of the world when using autocreate
       worldname=$galaxyname
       
       #Sets the difficulty of the world when using autocreate 0(classic), 1(expert), 2(master), 3(journey)
       difficulty=0
       
       #Sets the max number of players allowed on a server.  Value must be between 1 and 255
       maxplayers=$maxplayers
       
       #Set the port number
       port=$port
       
       #Set the server password
       password=$serverpassword"

    }
}