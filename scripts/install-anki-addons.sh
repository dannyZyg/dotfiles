#!/bin/bash

if [[ "$OSTYPE" == "linux"* ]]; then
	ANKI_ADDONS_DIR="$HOME/.local/share/Anki2/addons21"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	ANKI_ADDONS_DIR="$HOME/Library/Application Support/Anki2/addons21"
fi

MIGAKU_DICT_ADDON="278530045"
MIGAKU_BROWSER_EXT="$HOME/packages/ImmerseWithMigaku"
AUDIO_ZIP="$HOME/Sync/japanese/accentAudio.zip"

if [[ -d "$ANKI_ADDONS_DIR/$MIGAKU_DICT_ADDON" ]]; then

	if [[ ! -f "$AUDIO_ZIP" ]]; then
		echo "Make sure the audio zip file exists at $AUDIO_ZIP"
	elif [[ -d "$ANKI_ADDONS_DIR/$MIGAKU_DICT_ADDON/user_files/accentAudio" ]]; then
		echo "No action needed: $ANKI_ADDONS_DIR/$MIGAKU_DICT_ADDON/user_files/accentAudio already exists."
	else
		echo "Unzipping audio to migaku dictionary addon..."
		unar $AUDIO_ZIP -o "$ANKI_ADDONS_DIR/$MIGAKU_DICT_ADDON/user_files/" -quiet
	fi
else
	echo "Make sure that the Migaku Browser Extension is installed first at $MIGAKU_BROWSER_EXT."
fi

if [[ -d "$MIGAKU_BROWSER_EXT" ]]; then

	if [[ ! -f "$AUDIO_ZIP" ]]; then
		echo "Make sure the audio zip file exists at $AUDIO_ZIP"
	elif [[ -d "$MIGAKU_BROWSER_EXT/accentAudio" ]]; then
		echo "No action needed: $MIGAKU_BROWSER_EXT/accentAudio already exists."
	else
		echo "Unzipping audio to migaku browser ext..."
		unar $AUDIO_ZIP -o $MIGAKU_BROWSER_EXT -quiet
	fi
else
	echo "Make sure that the Migaku Browser Extension is installed first at $MIGAKU_BROWSER_EXT."
fi
