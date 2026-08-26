#!/bin/bash

if [ ! -d ".git" ]; then
    echo "🔄 Cloning repository..."
    git clone https://<YOUR_GITHUB_TOKEN>@github.com/Wormhole-Mod/Wormhole-.git .
else
    echo "🔄 Pulling latest changes from GitHub..."
    git pull origin main
fi

echo "🔥 Starting Minecraft Server from Minecraft folder..."
cd Minecraft

java -Xms6G -Xmx6G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 \
-XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch \
-XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=16M \
-XX:G1ReservePercent=15 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 \
-XX:InitiatingHeapOccupancyPercent=15 -jar server.jar nogui
