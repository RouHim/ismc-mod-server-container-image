#!/usr/bin/env sh

# Config dir
export SERVER_CONFIG_DIR="$SERVER_DIR/Insurgency/Saved/Config/LinuxServer"
export SERVER_TXT_DIR="$SERVER_DIR/Insurgency/Config/Server"

mkdir -p "$SERVER_DIR/Insurgency/Saved/Config/LinuxServer"
mkdir -p "$SERVER_DIR/Insurgency/Config/Server"

# Check Game.ini, Engine.ini and GameUserSettings.ini exist
if [ ! -f "$SERVER_CONFIG_DIR/Game.ini" ]; then
    echo "Game.ini not found, copying from template"
    cp "$USER_HOME/templates/Game.ini" "$SERVER_CONFIG_DIR/Game.ini"
else
    echo "Game.ini already exists"
fi

if [ ! -f "$SERVER_CONFIG_DIR/Engine.ini" ]; then
    echo "Engine.ini not found, copying from template"
    cp "$USER_HOME/templates/Engine.ini" "$SERVER_CONFIG_DIR/Engine.ini"
else
    echo "Engine.ini already exists"
fi

if [ ! -f "$SERVER_CONFIG_DIR/GameUserSettings.ini" ]; then
    echo "GameUserSettings.ini not found, copying from template"
    cp "$USER_HOME/templates/GameUserSettings.ini" "$SERVER_CONFIG_DIR/GameUserSettings.ini"
else
    echo "GameUserSettings.ini already exists"
fi

# Apply the env to ini mapping
"$USER_HOME"/envini "$USER_HOME"/envini_mapping.ini

# Write motd
echo "$MESSAGE_OF_THE_DAY" > "$SERVER_TXT_DIR/Motd.txt"

# Write Mods.txt
# We need to split by ',' and write each line to the file
echo "$MODS" | tr ',' '\n' > "$SERVER_TXT_DIR/Mods.txt"