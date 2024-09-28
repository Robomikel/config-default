Function New-LaunchScriptRustPS { 
        #----------   Rust Server Install Function   -------------------
        # APP ID # 258550
        # Tested 2/22/20
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "28015"
        #                       Rcon Port
        $global:rconport        = "28016"
        #                       Rcon Password
        $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Rcon Web
        $global:rconweb         = "1"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        #                       Maxplayers
        $global:maxplayers      = "32"
        #                       World Seed
        $global:seed            = "$RANDOMSEED"
        #                       World Size
        $global:worldsize       = "3000"
        #                       Save Interval
        $global:saveinterval    = "300"
        #                       Tickrate
        $global:tickrate        = "30"
    
        ##############################/\##############################
        ###################### Do not change below #####################
        #                               System Directory
        $global:systemdir               = "$serverdir\RustDedicated_Data"
        #                               Server Config Directory
        $global:servercfgdir            = "$serverdir\server\my_server_identity\cfg"
        #                               Server Executable
        $global:executable              = "RustDedicated"
        #                               Server Executable Directory
        $global:executabledir           = "$serverdir"
        #                               Gamedig Query
        $global:querytype               = "rust"
        #                               Game Process
        $global:process                 = "RustDedicated"
        #                               Log Directory
        $global:logdirectory            = "$serverdir"
        #                               Server Log
        $global:consolelog              = "Serverlog-*.log"
        #                               Game-Server-Config Directory
        $global:gamedirname             = "Rust"
        #                               Game-Server-Config
        $global:servercfg               = "server.cfg"
        #                               Server Launch Command
        $global:launchParams            = '@("${executable} -batchmode +server.ip ${ip}  +server.port ${port} +server.tickrate ${TICKRATE} +server.hostname `"${hostname}`" +server.maxplayers ${maxplayers} +server.worldsize ${worldsize} +server.saveinterval ${saveinterval} +rcon.web ${rconweb} +rcon.ip 0.0.0.0 +rcon.port ${rconport} +rcon.password ${rconpassword} -logfile ${logdirectory}\Serverlog-$date.log")'
        # Advanced must be set to "0"
        Get-UserInput
        # Download Game-Server-Config
        #Get-Servercfg
        Get-RustServerConfig
}

Function Get-RustServerConfig {
        Get-Infomessage " Creating server.cfg " 'info'
        New-Item $servercfgdir\$servercfg -Force
        Add-Content   $servercfgdir\$servercfg `
"
# bradley.enabled                      If set to false (0) it will disable the APC. Default is (1)
# ai.think                             If set to False, bears and wolfs are only hostile on attack (True)
# ai.move                              If set to False, animals will stop moving (recommended for performance boost) (True)
# ai.sensetime                         It's no use to change this value (1)
# ai.frametime                         no description (5)
# ai.tickrate                          Changes the tickrate of animals (5)
# antihack.enabled                     Enables / disables antihack (True)
# antihack.admincheat                  Are admins allowed to use their admin cheat (True)
# antihack.objectplacement             Use antihack to verify object placement by players (True)
# antihack.modelstate                  Use antihack to verify model state sent by players (True)
# antihack.userlevel                   0 = users, 1 = admins, 2 = developers (2)
# antihack.enforcementlevel            What happens if player is above 'antihack.maxviolation' - 0 = no enforcement, 1 = kick, 2 = ban (1)
# antihack.maxdesync                   Max allowed client desync, lower value = more false positives (1)
# antihack.relaxationrate              The rate at which violation values go back down (0.1)
# antihack.relaxationpause             The time before violation values go back down (10)
# antihack.maxviolation                Violation value above this results in enforcement (100)
# antihack.noclip_protection           0 = disabled, 1 = ray, 2 = sphere, 3 = curve (3)
# antihack.noclip_reject               Whether or not to reject movement when noclip is detected (True)
# antihack.noclip_penalty              Violation penalty to hand out when noclip is detected (0)
# antihack.noclip_stepsize             Movement curve step size, lower value = less false positives (0.1)
# antihack.noclip_maxsteps             Movement curve max steps, lower value = more false positives (5)
# antihack.speedhack_protection        0 = disabled, 1 = enabled (1)
# antihack.speedhack_reject            Whether or not to reject movement when speedhack is detected (False)
# antihack.speedhack_penalty           Violation penalty to hand out when speedhack is detected (50)
# antihack.speedhack_forgiveness       Speed threshold to assume speedhacking, lower value = more false positives (2)
# antihack.speedhack_deltatime         Time interval to calculate speed in, lower value = more false positives (0.2)
# antihack.speedhack_tickets           Required number of speeding tickets to trigger a violation (15)
# antihack.speedhack_history           Speeding ticket history length (20)
# antihack.flyhack_protection          0 = disabled, 1 = simple, 2 = advanced (2)
# antihack.flyhack_reject              Whether or not to reject movement when flyhack is detected (False)
# antihack.flyhack_penalty             Violation penalty to hand out when flyhack is detected (50)
# antihack.flyhack_forgiveness         Distance threshold to assume flyhacking, lower value = more false positives (2)
# antihack.projectile_protection       0 = disabled, 1 = speed, 2 = speed + entity, 3 = speed + entity + LOS (3)
# antihack.projectile_penalty          Violation penalty to hand out when projectile hack is detected (0)
# antihack.projectile_forgiveness      Projectile speed forgiveness in percent, lower value = more false positives (0.5)
# antihack.projectile_padding          Projectile hit distance padding in meters, lower value = more false positives (5)
# antihack.projectile_serverframes     Projectile server frames to include in delay, lower value = more false positives (2)
# antihack.projectile_clientframes     Projectile client frames to include in delay, lower value = more false positives (2)
# antihack.projectile_tickets          Required number of projectile line of sight tickets to trigger a violation (10)
# antihack.melee_protection            0 = disabled, 1 = initiator, 2 = initiator + target, 3 = initiator + target + LOS (3)
# antihack.melee_penalty               Violation penalty to hand out when melee hack is detected (0)
# antihack.melee_forgiveness           Melee distance forgiveness in percent, lower value = more false positives (0.5)
# antihack.melee_padding               Melee hit distance padding in meters, lower value = more false positives (2)
# antihack.melee_serverframes          Melee server frames to include in delay, lower value = more false positives (2)
# antihack.melee_clientframes          Melee client frames to include in delay, lower value = more false positives (2)
# antihack.melee_tickets               Required number of melee line of sight tickets to trigger a violation (2)
# antihack.eye_protection              0 = disabled, 1 = distance, 2 = distance + LOS (2)
# antihack.eye_penalty                 violation penalty to hand out when eye hack is detected (0)
# antihack.debuglevel                  0 = silent, 1 = print max violation, 2 = print every violation (1)
# batching.colliders                   *EXPERIMENTAL* Rust batches colliders to get around the maximum collider limit. To improve server performance you can unbatch (batching.colliders 0) colliders until they reach 250k. (True)
# batching.collider_vertices           no description (10000)
# batching.collider_submeshes          no description (1)
# batching.verbose                     no description (0)
# chat.enabled                         Enable or disable chat displaying (True)
# chat.serverlog                       Enable or disable chat logging (True)
# construct.frameminutes               How many minutes before a placed frame gets destroyed (30)
# craft.instant                        Enable or disable instant crafting (False)
# debug.checktriggers                  Debug triggers (False)
# decay.tick                           Larger amount increases the applied decay damage to entity. (600)
# decay.scale                          1 = normal decay, 0,5 = 50%, 0 = turn decay off (1)
# decay.debug                          Debugmode (False)
# env.time                             Shows in-game time. If value declared, will change the server time (values: 0 - 24)
# env.day                              Displays the day of the month. Pointless to change this value (12)
# env.month                            Displays the month. Pointless to change this value (6)
# env.year                             Displays the year. Pointless to change this value (2024)
# fps.limit                            The maximum number of frames to render per second (256)
# gc.interval                          Changes the interval between garbage collects. (-1)
# heli.lifetimeminutes                 The amount of time the helicopter is allowed to stay in minutes. (15)
# heli.guns                            Enables / disables the helicopters minigun. If set to 0, the helicopter will shoot rockets only. (1)
# heli.bulletdamagescale               Changes the bullet damage of the helicopter. Higher value = more damage (1)
# heli.bulletaccuracy                  Changes the accuracy of the bullets. Higher value = less accuracy (2)
# net.visdebug                         Turns on debug display of network visibility (False)
# physics.droppedmode                  The physics mode that dropped items and corpses should use. good, tempgood or fast. fast + tempgood might cause objects to fall through other objects. (good)
# physics.sendeffects                  Send effects to clients when physics objects collide (True)
# physics.bouncethreshold              no description (2)
# physics.sleepthreshold               no description (0.005)
# physics.solveriterationcount         The default solver iteration count permitted for any rigid bodies (default 7). Must be positive (3)
# physics.steps                        The amount of physics steps per second (16)
# pool.skins                           no description (False)
# sentry.targetall                     Target everyone regardless of authorization (False)
# sentry.hostileduration               How long until something is considered hostile after it attacked (120)
# server.ip                            Sets the IP of the server. Should be stated in the startup parameters
# server.port                          Sets the IP of the server. Should be stated in the startup parameters
# server.maxplayers                    Changes the maximum amount of player slots.
# server.hostname                      Sets the Servername. example: server.hostname `"My Rust Server`"
# server.identity                      Changes path to your server data. (my_server_identity)
# server.level                         Sets the map of the server (Procedural Map) values: Barren, Craggy Island, Hapis, Savas Island
# server.seed                          Sets the the map generation seed.
# server.salt                          Prints the server.salt
# server.worldsize                     Changes the map size (3000). values: 1000 - 6000. 3000 equals 9km². (3000m^2)
# server.saveinterval                  Interval between the server saves the map. (300)
# server.secure                        Enables / disables Valve Anti Cheat security. (True)
# server.tickrate                      Changes the server tickrate. Going higher than 30 is not recommended. (30)
# server.entityrate                    Tickrate. Recommended to leave it at 16. (16)
# server.cycletime                     no description (500)
# server.official                      Only whitelisted server by Facepunch can use this command (False)
# server.globalchat                    If set to false, only people within voice range can read each others messages. (True)
# server.stability                     If set to false, building blocks will have 100% stability no matter how high you build. (True)
# server.radiation                     Disables / enables server radioation (True)
# server.itemdespawn                   Time until an item despawn (180)
# server.pve                           Enables / disables PvE mode (False)
# server.description                   Command used to write a server description. Make \n to make a new line
# server.headerimage                   Sets the serverbanner - picture must be 500x256
# server.logoimage                     Sets the servers logo image - Image is shown in the server browser and rust+ app
# server.url                           Sets the server 'Webpage'
# server.branch                        no description ()
# server.eac                           Enables / disables Easy Anti Cheat (1)
# server.queriespersecond              no description (2000)
# server.ipqueriespermin               no description (30)
# server.meleedamage                   Changes the melee damage in percent - 1 = 100, 0.5 = 50%, 0 = 0% (1)
# server.arrowdamage                   Changes the arrow damage in percent - 1 = 100, 0.5 = 50%, 0 = 0% (1)
# server.bulletdamage                  Changes the bullet damage in percent - 1 = 100, 0.5 = 50%, 0 = 0% (1)
# server.bleedingdamage                Changes the bleeding damage in percent - 1 = 100, 0.5 = 50%, 0 = 0% (1)
# server.meleearmor                    Changes the scale of protection against melee damage from clothing and armor in percent - 1 = 100, 0.5 = 50%, 0 = 0% (1)
# server.arrowarmor                    Changes the scale of protection against arrow damage from clothing and armor in percent - 1 = 100, 0.5 = 50%, 0 = 0% (1)
# server.bulletarmor                   Changes the scale of protection against bullet damage from clothing and armor in percent - 1 = 100, 0.5 = 50%, 0 = 0% (1)
# server.bleedingarmor                 Changes the scale of protection against bleeding damage from clothing and armor in percent - 1 = 100, 0.5 = 50%, 0 = 0% (1)
# server.updatebatch                   How many entity updates should we send per loop. Setting this > 1000 might cause lag when a player first joins your server. (128)
# server.planttick                     Plants tick every x seconds. This is how many seconds between ticks. (60)
# server.planttickscale                Setting this to 2 will make plants grow, fruit and die two times faster than normal. (1)
# server.respawnresetrange             Distance from sleeping bag to reset other sleeping bags/beds. (50)
# server.maxunack                      Max amount of unacknowledged messages before we assume we're congested (4)
# server.maxflood                      Max amount of ticks to receive per second before we assume a client is flooding us (1000)
# server.netcache                      Use network caching (True)
# server.netcachesize                  Informational, the size of the network cache (in bytes) (2214666)
# server.savecachesize                 Informational, the size of the save cache (in bytes) (2264944)
# server.combatlogsize                 The size of the combat log (100)
# server.idlekick                      Number of minutes until idle players are kicked (30)
# server.idlekickmode                  0 = no idle kick, 1 = kick if server full, 2 = always kick (1)
# server.idlekickadmins                1 = admins can get idle kicked (0)
# server.maxreceivetime                no description (20)
# server.compression                   no description (False)
# server.netlog                        no description (False)
# spawn.min_rate                       no description (0,2)
# spawn.max_rate                       no description (2)
# spawn.min_density                    no description (0,2)
# spawn.max_density                    no description (2)
# stability.verbose                    no description (0)
# stability.strikes                    no description (10)
# stability.collapse                   no description (0.05)
# stability.accuracy                   no description (0.001)
# time.fixeddelta                      Fixed delta time in seconds (0.0625)
# time.maxdelta                        The minimum amount of times to tick per frame (0.33)
# vis.damage                           Turns on debug display of damages (False)
# vis.attack                           Turns on debug display of attacks (False)
# vis.protection                       Turns on debug display of protection (False)
# vis.weakspots                        Turns on debug display of weakspots (False)
# vis.triggers                         Show trigger entries (False)
# vis.hitboxes                         Turns on debug display of hitboxes (False)
# vis.lineofsight                      Turns on debug display of line of sight checks (False)
# xmas.enabled                         no description (True)
# xmas.spawnrange                      no description (50)
# xmas.giftsperplayer                  no description (2)
"
}