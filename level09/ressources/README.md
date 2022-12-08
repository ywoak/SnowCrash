# LEVEL 09

- We have the token encrypted and the level09 file is telling us how it was encrypted:
- By playing with the input a bit we figure out that its a form of an ascii array encryption, 

```
level09@SnowCrash:~$ ./level09 aaaaaaaaaaaaaaaa
abcdefghijklmnop
```

- for each char, the ouput is the char value + the offset of the array position written in ascii
- to decrypt the token we have to reverse the token in the way le level09 program do it
- Used our script on the scp'd token file, and then turn the byte string to an ascii string to get the result

result is f3iji1ju5yuevaus41q1afiuq + newline char to connect to flag09
