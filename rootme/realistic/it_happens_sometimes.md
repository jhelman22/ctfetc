# [It Happens Sometimes](https://www.root-me.org/en/Challenges/Realist/It-happens-sometimes-93)

We use dirbuster to try to find some hidden directories.

We have an `/admin` url that gives us a login prompt. It looks like `.htaccess` authorization. 

Let's try circumventing it with:

`curl -X PUT 'http://challenge01.root-me.org/realiste/ch3/admin'`

Great we get a password!

Password is: **0010110111101001**
