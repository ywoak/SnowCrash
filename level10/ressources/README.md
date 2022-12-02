Write up ->

First we reverse to understand the binary, its a web client who uses the unprotected access() in C, its vulnerable to TOCTOU race condition so thats what we'll put in place

We then create a webserver listening at the port the web client is sending data

Our goal is to let access() validate a good file, then before it goes to open() we replace our filename with a symlink to token so it will be read and sent to the server

Check the script included in this folder to further understand the logic behind the implementation of said exploit

woupa2yuojeeaaed06riuj63c - flag10
