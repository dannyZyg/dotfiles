#!/bin/sh

STATUS=$(nordvpnteams status | grep VPN | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
    echo "%{F#82E0AA}%{A1:nordvpn d:}VPN Connected%{A}%{F-}"
else
    echo "%{F#EE8813}%{A1:nordvpn c:}no VPN%{A}%{F-}"
fi
