Write up ->

When arriving on ~ we see nothing, and find / -uid 2014/3014 gives us nothing so the only thing thats usually not in a clean system that was out of the ordinary was the /bin/getflag itself and when we analyse it statically with file/strings/ltrace/strace we understand that this is the right path to follow

Started using ghidra to disassemble and decompile a binary, which is much more efficient than a human doing it by hand especially when the control flow of the program is hard to follow with multiple jumps and loop and seemingly hard to understand loop conditions

When disassembling and decompiling we noticed that the function first defends itself against 
1. ptrace (so to avoid patching in gdb, which is ultimately useless because we can still patch the return of ptrace before the check next instruction to bypass it, but more on that later)
2. LD_PRELOAD attack, which is the first thing i tried doing on the binary, inject a malicious library into the LD_PRELOAD env var

And then the general flow of the program is, get the ruid of the of user executing the binary, and then ft_des the crypted flag for the appropriate level, the interesting part was
1. It uses the same ft_des func as level13
2. The crypted flag was written in strings in the program

So one solution is recompiling the decompiled c version of the disassembled binary of ft_des, getting the encrypted string from uid flag14 and calling the ft_des func from a main with the said string/token/flag and we dont have to reverse ft_des 100% to understand it, just running it was fine
Ill admit it wasnt the safest of method tho in case it was a virus but we're inside a vm so its still relatively safe

We could probably do it without the ghidra decompiler and just copy the objdump in .asm file and assemble it directly with nasm, but im unsure about it and its uneeded since external software is allowed and the ghidra decompiler is really powerful

One important note is that a simpler method realised afterhand is to patch the binary in mid execution with gdb to manually control the branching of the program to give us the flag (we also could have done the same for level 13 by executing the binary step by step and modifying the getuid return to be true on 4242), so when the binary defend itself against ptrace we just set the ptrace return to 0/1 instead of -1, then we set our uid to the uid of flag14 and enter ft_des with the correct string and it is returned to us
Again this might not be the safest of method since its no longer STATIC analysis but patching and running an unknown binary, but anyway we didnt do it and we're still in a vm

One last important note is that the binary had root privilegies, so if we decide to bypass the check on the LD_PRELOAD with patching we can perhaps perform a privEsc but i didnt try that
