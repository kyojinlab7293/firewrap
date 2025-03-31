#!/bin/bash

APP=$(zenity --entry --title="Select App" --text="Enter app name (e.g. libreoffice, gimp, vlc):")
[ -z "$APP" ] && exit

TAGS=$(zenity --list --title="Assign Tags to $APP" --checklist \
  --column="Use" --column="Tag" \
  TRUE  NoInternet \
  TRUE  NoSnooping \
  FALSE IsolatedHome \
  FALSE NoClipboard \
  --separator=":" \
  --height=300 --width=400)

[ -z "$TAGS" ] && exit

PROFILE_FILE="$HOME/.config/firejail/$APP.profile"
echo "# Auto-generated Firejail profile for $APP" > "$PROFILE_FILE"

IFS=":" read -ra TAGS_ARRAY <<< "$TAGS"
for tag in "${TAGS_ARRAY[@]}"; do
  echo "include ~/.config/app-sandbox/tags/${tag}.conf" >> "$PROFILE_FILE"
done

zenity --info --text="Firejail profile for '$APP' saved to:\n$PROFILE_FILE"
