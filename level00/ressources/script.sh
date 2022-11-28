#!/bin/sh

[ -z $1 ] && echo "Usage: ./script.sh [username]" && exit 1
USER=$1
UID=$(cat /etc/passwd | grep "$USER" | cut -d : -f3)
[ -z $UID ] && echo "\033[0;31mDidnt find the uid for user $USER\033[0;00m" || echo "\033[0;32mFound uid \033[0;33m$UID\033[0;32m for user $USER\033[0;00m"
[ -z $UID ] || echo -n "\033[0;34mContent of file belonging to $USER : " && cat < $(find / -uid $UID 2>/dev/null | head -n 1)
echo "\033[0;00m"
