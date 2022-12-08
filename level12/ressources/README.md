# LEVEL 12

This one was especially tricky to figure out

The requests for the apache server at the endpoint 4646 was handled by a perl script whose role was to (via 2 regex), apply a toUpper on the first arg, then substitute it with its first word, then check with an egrep wether that word was in a file called /tmp/xd and then evaluate to .. or . depending if the right part of a split on : in /tmp/xd matched a part of the 2nd argument or not

To be able to play with it a bit without sending a curl request everytime i first scp'd it in local and modified it a bit to better understand and have a fine grained control over the flow of different part of the script

The main vulnerability i quickly identified was the execution of code with the backtick in the egrep line
The second vulnerability i noticed was the /usr/bin/env perl shebang instand of the more direct /usr/bin/perl approach

Starting with the second one first i tried adding an entry to the PATH variable with an homemade `perl` file that was calling getflag, since level12 was suid i figured it would work, but it didnt i still dont understand why sadly

Back to the main and first approach, the following has been done with the first 2 regex to caps and sub disabled first, the goal was to exploit this line -> @output = \`egrep "^$xx" /tmp/xd 2>&1\`;

1. We can override the fact that egrep "arg1" by manually closing the first double quote after providing him an arg to grep and a file to do it, then ; and insert our command that would get executed, then ; and feed another grep with an open of " that he would close for us after expanding arg1 inside the double quote
So egrep "$arg1" can become egrep "blabla" /tmp/xd; ls; grep "di" tmp/xd
That works ! We managed to bypass the "$arg" with clever double quote stuff by sending the whole arg in single quote, now we need to reactivate the first 2 regex and figure out a way to bypass them
2. The second regex is annoying, because we cant use space in our command, so i figured out a way to avoid this, by sending $z (the second arg) it will then expand in the `egrep` as the second arguments in which we can write all the space we want, but then we meet another issue, how to pass the second argument with the first regex being active and putting everything in uppercase
3. Next problem, next solution, i decided that an environnement variable would fit perfectly here since we still can put all our code in it, but also it is uppercase by default so the first regex wont matter, and here is where i probably spent 15hours pulling my hair out, because somehow the idea works and it gets expanded correctly into the egrep (i printed the command itself to be sure) but it doesnt actually execute the code that it expanded, unlike before without the regex active where the middle ls part actually ran smoothly, i think it has to do with internal shell code after expanding an env variable but im also still unsure to this date, and it left a bitter taste
4. So at last, after a bit of help from my peer and exploring countless other leads, and a few more hours i finally realised that since the backtick are executing code, we could just inject a subshell expansion with the shell syntax $(), and do whatever command we want inside it, it is very anticlimactic as the other ideas were much more creative, but o well, it is way more efficient and it took a serious time to realise i could just do that
But there is still two cool trick in that method, first is realizing that * bypass the 2 regex, we can do a /\*/ls for /bin/ls for example, second is that since we cant actually getflag /\*/getflag because getflag will get put in caps, we can create a /tmp/BOO executable file, so the caps is no longer an issue

Refer to the script provided in the folder for the actual implementation of this
