Write up ->

First we reverse the binary to understand the general control flow of the program

1. Setuid/gid (! important, thats what allow us to execute higher level command on our code injection)
2. got content from env var LOGNAME
3. Then sent it to asprintf with %s to write it to str
4. Then printed it with system /bin/echo str
5. We needed str to evaluate to getflag since system was launching it

so we simply do a code injection via the environnement variable :

export LOGNAME=\`getflag\`
./level07
