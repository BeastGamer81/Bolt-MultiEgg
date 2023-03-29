#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"

    #Display MOTD
    echo "

    ===================================================================================================================

    $(tput setaf 6)    ##########     ###########   #           #             #             #  #        ###########
    $(tput setaf 6)            #      #               #       #              # #            #     #     #
    $(tput setaf 6)          #        #                 #   #               #   #           #      #    #
    $(tput setaf 6)        #          #########           #                #     #          #      #    ##########
    $(tput setaf 6)      #            #                 #   #             #########         #      #    #
    $(tput setaf 6)    #              #               #       #          #         #        #     #     #
    $(tput setaf 6)   ###########     ###########   #           #       #           #       #  #        ###########

    ====================================================================================================================

    "  
}

function forceStuffs {
  echo "motd=\u00a7fThis server is hosted on \u00a79Zexade.com\u00a7r\n\u00a77You can change this MOTD in server.properties" >> server.properties
}

function launchJavaServer {
  # Using Aikars flags.
  java -Xms1024M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
}
FILE=eula.txt

# Currently this is still in development.

function optimizeJavaServer {
  # Decreasing view distance.
  echo "view-distance=6" >> server.properties

  # Slows down incremental chunk saving during the world save task
  # echo "max-auto-save-chunks-per-tick: 10" >> paper.yml
  
  # Optimize explosions.
  # echo "optimize-explosions: true" >> paper.yml
  
  # Disable overload warnings
  # echo "warn-on-overload: false" >> spigot.yml

  # Prevents players from entering an unloaded chunk (due to lag), which causes more lag.
  # echo "prevent-moving-into-unloaded-chunks: true" >> paper.yml
  
}

# Check if the node IP is matched.
IP=$(curl -s https://checkip.amazonaws.com)
if [ ! "$IP" = 195.201.61.35 ]
then
    display
    echo "$(tput setaf 1)This node is not authorized to use this Multi-Egg. Reason: Invalid IP."
else 

if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
sleep 5
echo "

  $(tput setaf 1)If you found any bug or errors, please submit it to me via dark@bolthost.xyz.

  $(tput setaf 3)Which platform are you gonna use?

  1) Minecraft Java 1.8.8   (PaperMC)    6)  Minecraft Java 1.19.4 (PaperMC)        11)  Discord Python
  2) Minecraft Java 1.12.2  (PaperMC)    7)  BungeeCord
  3) Minecraft Java 1.16.5  (PaperMC)    8)  Bedrock
  4) Minecraft Java 1.17.1  (PaperMC)    9)  Pocketmine MP 
  5) Minecraft Java 1.18.1  (PaperMC)    10) Discord JS

  "
read -r n

case $n in
  1) 
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.8.8 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar

    display
    
    echo "$(tput setaf 1)Invalid docker image. Change it to java 8"
    
    sleep 10
    
    echo -e ""
    
    optimizeJavaServer
    launchJavaServer
  ;;

2) 
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.12.2 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar

    display   

    echo "$(tput setaf 1)Invalid docker image, otherwise it will not work.Change it to java 11"
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  3) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download Minecraft Java 1.16.5 and start it for you."

    sleep 4
    optimizeJavaServer
    launchJavaServer
    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.17.1/builds/411/downloads/paper-1.17.1-411.jar server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 16."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  4)
    sleep 1

    echo "$(tput setaf 3)Ok, I will download Minecraft Java 1.17.1 and start it for you."

    sleep 4

    forceStuffs
    optimizeJavaServer
    launchJavaServer
    curl -O https://api.papermc.io/v2/projects/paper/versions/1.17.1/builds/411/downloads/paper-1.17.1-411.jar server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  5) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download Minecraft Java 1.18.1 and start it for you."

    sleep 4

    forceStuffs
    optimizeJavaServer
    launchJavaServer
    curl -O https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/388/downloads/paper-1.18.2-388.jar server.jar

    display
    
    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 16."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;
  6)
     sleep 1

    echo "$(tput setaf 3)Ok, I will download Minecraft Java 1.18.1 server and start it for you."

    sleep 4

    forceStuffs
    optimizeJavaServer
    launchJavaServer
    curl -O https://api.papermc.io/v2/projects/paper/versions/1.19.4/builds/477/downloads/paper-1.19.4-477.jar server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    ;;
  7)
    echo "$(tput setaf 3)Ok, I will download latest Bungeecord Server and start it for you."

    curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

    display 

    java -Xms512M -Xmx512M -jar BungeeCord.jar
  ;;

  8)
    echo "$(tput setaf 3)Ok, I will download latest Bedrock Server and start it for you."
    
    curl -O https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.72.01.zip && unzip bedrock-server-1.19.72.01.zip $$ mv bedrock-server-1.19.72.01/* * && rm -rf bedrock-server-1.19.72.01
    
    display
    
    ./bedrock_server
  ;;

  9)
    echo "$(tput setaf 3)Ok, I will download latest PocketMine MP Server and start it for you."
    
    curl -O https://github.com/pmmp/PocketMine-MP/releases/download/4.18.1/PocketMine-MP.phar
    
    display
    
    .\/bin\/php7\/bin\/php .\/PocketMine-MP.phar --no-wizard --disable-ansi
  ;;

  10)
     echo "$(tput setaf 3)Ok, I will download latest DiscordJS Server and start it for you."
     
     echo "$(tput setaf 1)You have to change the docker image because of this Server Type, otherwise it will not work. Please go to the Startup tab, and change the docker image to NodeJS."
     
     display
     
     node .
  ;;

  11)
     echo "$(tput setaf 3)Ok, I will download latest DiscordPY Server and start it for you."
     
     echo "$(tput setaf 1)You have to change the docker image because of this Server Type, otherwise it will not work. Please go to the Startup tab, and change the docker image to Python."
     
     display
     
     python app.py
  ;;
  *) 
    echo "Invalid option, exiting..."
    exit
  ;;
esac
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -f BungeeCord.jar ]; then
  display
  java -Xms512M -Xmx512M -jar BungeeCord.jar
else
if [ -d plugins ]; then
  mkdir -p plugins
fi
  display   
  launchJavaServer
fi
fi
fi
