#!/bin/sh
# Simple script to output pulseaudio source

DEVICE=$( pulsemixer --list-sinks | grep -i default | awk '{ print $5 }' | sed 's/,//g' )

echo "$DEVICE"

