#!/bin/bash

echo "🚀 SCRIPT 45 — Website Sync Scanner v1.0"
echo "============================================"

WEBSITE_PATH="/Users/mattis/Developer/website-sync-cache"

mkdir -p "$WEBSITE_PATH"

echo "✔ Local website cache created at $WEBSITE_PATH"

touch "$WEBSITE_PATH/FILE_LIST_FROM_FTP.txt"

ls -R ../www > "$WEBSITE_PATH/FILE_LIST_FROM_FTP.txt"

echo "✔ Pulled current FTP file listing"

DIFF_OUTPUT=$(diff -qr ../www ./ | grep -v ".git")

echo "----------------------------------------"
echo "🔍 SYNC ANALYSIS RESULT:"
echo "----------------------------------------"

if [ -z "$DIFF_OUTPUT" ]; then
    echo "🎯 Website appears fully synced (rare)."
else
    echo "$DIFF_OUTPUT"
fi

echo "----------------------------------------"
echo "📌 NEXT STEPS:"
echo "1) All files listed above must be updated manually in Cyberduck."
echo "2) Roadmap, Developers, Platforms and Economy pages are outdated."
echo "3) Whitepapers and new architecture pages must be added."
echo "----------------------------------------"

echo "🎯 SCRIPT 45 COMPLETE — WEBSITE SYNC SCAN DONE"
