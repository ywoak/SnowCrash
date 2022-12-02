Write up ->

We have the token encrypted and the level09 file is telling us how it was encrypted:
By playing with the input a bit we figure out that its a form of an ascii array encryption, for each char, the ouput is the char value + the offset of the array position written in ascii when possible and outside ascii boundary in hex whenever its not
Used our script on the scp'd token file, the byte string behavior in python allowed for a quick and clean solution

result is f3iji1ju5yuevaus41q1afiuq + newline char to connect to flag09
