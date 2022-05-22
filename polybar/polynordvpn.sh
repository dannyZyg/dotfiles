#!/bin/sh

STATUS=$(
  command -v nordvpnteams \
  && nordvpnteams status | grep VPN | tr -d ' ' | cut -d ':' -f2 \
  || echo ""
)

if [ "$STATUS" = "Connected" ]; then
    echo "%{F#82E0AA}%{A1:nordvpn d:}旅%{A}%{F-}"
else
    echo "%{F#EE8813}%{A1:nordvpn c:}旅%{A}%{F-}"
fi
