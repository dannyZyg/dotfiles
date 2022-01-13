#!/bin/bash

if [[ "$OSTYPE" == "linux"* ]]; then
	ANKI_ADDONS_DIR="$HOME/.local/share/Anki2/addons21"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	ANKI_ADDONS_DIR=
fi

MIGAKU_DICT_ADDON="278530045"
AUDIO_ZIP="$HOME/sync/japanese/accentAudio.zip"

if [[ (-d "$ANKI_ADDONS_DIR/$MIGAKU_DICT_ADDON")]]; then
	if [[ -f "$AUDIO_ZIP" ]]; then
		echo "Unzipping audio..."
		unzip $AUDIO_ZIP -d "$ANKI_ADDONS_DIR/$MIGAKU_DICT_ADDON/user_files/"
	else
		echo "Make sure the audio zip file exists at $AUDIO_ZIP"
	fi
else
	echo "Make sure that the Migaku Dictionary Addon is installed first."
fi
