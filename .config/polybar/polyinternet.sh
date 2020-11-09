#!/bin/bash
iNet=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3`) 
echo "$iNet" | grep error
if [ -z $(echo "$iNet" | grep error) ] then;
	echo "ye"
fi
# > /dev/null && echo "🈯️" || echo "❌"
