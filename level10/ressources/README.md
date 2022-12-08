# LEVEL 10

```
level10@SnowCrash:~$ ./level10
./level10 file host
        sends file to host if you have access to it
```
- First we need to disassemble the binary to understand the full flow.
- reading between the line; we easily understand that is a webclient created by the socket(), bind() function
- it also use the connect() function,
- then it open a file and send it content to a server on localhost
- the main this is it check for file perms with the access() function

if we look a the access man page:

```
Avertissement : Utiliser access() pour vérifier si un utilisateur a le droit, par exemple, d'ouvrir un fichier avant d'effectuer réellement l'ouverture avec open(2), risque de créer un trou de sécurité. En effet, l'utilisateur peut exploiter le petit intervalle de temps entre la vérification et l'accès pour modifier le fichier (via un lien symbolique en général). Pour cette raison, l'utilisation de cet appel système devrait être évitée.
```
its vulnerable to TOCTOU race condition so thats what we'll put in place

- We then create a webserver listening at the port the web client is sending data
- Our goal is to let access() validate a good file, then before it goes to open() we replace our filename with a symlink to token so it will be read and sent to the server
- Check the script included in this folder to further understand the logic behind the implementation of said exploit

> woupa2yuojeeaaed06riuj63c - flag10
