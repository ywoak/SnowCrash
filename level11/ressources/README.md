Write up ->

We read the level11.lua to understand that it create a webserver listening on PORT 5151
When sending a request with nc localhost 5151 we're given a password prompt

In the file we notice the script uses Popen which blindly execute shell code kinda like system, and it is SetUID so we can argforecho; `getflag` > /tmp/flag to execute getflag with parent rights
