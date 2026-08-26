#!/bin/bash

echo "💾 Syncing Minecraft server files to GitHub..."

git config --global user.name "Wormhole-Bot"
git config --global user.email "bot@wormhole.internal"

git add Minecraft/world/ Minecraft/config/ Minecraft/server.properties Minecraft/whitelist.json Minecraft/ops.json 2>/dev/null

if git diff-index --quiet HEAD --; then
    echo "✨ No changes to sync."
else
    git commit -m "Auto-sync Minecraft state: $(date)"
    git push https://<YOUR_GITHUB_TOKEN>@github.com/Wormhole-Mod/Wormhole-.git main
    echo "✅ Successfully pushed changes to GitHub!"
fi

