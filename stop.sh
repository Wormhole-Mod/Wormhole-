#!/bin/bash

echo "💾 Syncing Minecraft server files to GitHub..."

git config --global user.name "Wormhole-Bot"
git config --global user.email "bot@wormhole.internal"

git add Minecraft/world/ Minecraft/config/ Minecraft/server.properties Minecraft/whitelist.json Minecraft/ops.json 2>/dev/null

if git diff-index --quiet HEAD --; then
    echo "✨ No changes to sync."
else
    git commit -m "Auto-sync Minecraft state: $(date)"
    git push https://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@github.com/Wormhole-Mod/Wormhole-.git main
    echo "✅ Successfully pushed changes to GitHub!"
fi

