Write Up ->

When analysing the binary we see that it call strstr to check wether arg1 is called token
So we can create a symlink for token to bypass the strstr call

ln -s ~/token /tmp/symlink
./level08 /tmp/symlink

token found for flag08 :
quif5eloekouj29ke0vouxean
