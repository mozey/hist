#!/usr/bin/env bash
set -eu # exit on error or undefined variable
bash -c 'set -o pipefail' # return code of first cmd to fail in a pipeline

# WARNING This script does not preserve timestamps!

HOME=${HOME}

COMBINED="$HOME"/.bash_history_combined
UNIQUE="$HOME"/.bash_history_unique
ZHIST="$HOME"/.zsh_history
TMP="$HOME"/.zsh_history_tmp

# Combine history files
echo "" > "$COMBINED"
for FILE in "$HOME"/.bash_history.*; do
    echo "$FILE"
    cat "$FILE" >> "$COMBINED"
done

# Remove duplicate lines
sort --unique -o "$UNIQUE" "$COMBINED"

# Convert to zsh_history
cp "$ZHIST" "$TMP"
awk '{print ": 0:0;"$0}' "$UNIQUE" > "$ZHIST"
cat "$TMP" >> "$ZHIST"

echo ""
echo "Manually remove tmp files"
echo ""
echo "rm $COMBINED"
echo "rm $UNIQUE"
echo "rm $TMP"
echo ""
echo "And bash_history backups"
echo ""
echo "rm .bash_history.*"

exit 0

