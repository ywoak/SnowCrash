# LEVEL 01

```
level01@SnowCrash:~$ cat /etc/passwd
flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash
```
We see there is the flag01 password, but here its encrypted.

With the help of scp (source copy) we can copy /etc/passwd in our local env
```
scp -P 4242 level01@127.0.0.1:/etc/passwd ~/copy_etc_passwd
```

Then we can use `John The Ripper` tool to brutforce low security password
> https://www.openwall.com/john/

John the Ripper is an Open Source password security auditing and password recovery tool that use a list of weak password list to brutforce them
```
./john [file]
Loaded 1 password hash (descrypt, traditional crypt(3) [DES 256/256 AVX2])
```
```
./john --show [file]
?:abcdefg
1 password hash cracked, 0 left
```

#### IT WORKS !!
```
level01@SnowCrash:~$ su flag01
Password:
Don't forget to launch getflag !
flag01@SnowCrash:~$ getflag
Check flag.Here is your token : f2av5il02puano7naaf6adaaf
```