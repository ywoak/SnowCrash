Write up ->

Reverse the program to understand that the binary wont give the correct flag unless 4242 uid is the one asking it, so we simply created an user flag13 in the group flag 13 and assigned it the correct uid to run the program smoothly so the ft_des func gives us the correct flag
Explained like this its rather simple but it required some outside the box thinking insteand of just hardcore reversing ft_des to madness which is the function that handle the decrypting of the flag


The script would be something like :
scp -P 4242 level13@127.0.0.1:~/level13 .
sudo groupadd flag13 -g 4242
sudo useradd flag13 -u 4242 -g 4242 -d /home/flag13 -s /bin/bash
sudo passwd flag13
su flag13
./level13
