# [Bandit](http://overthewire.org/wargames/bandit/)

For every level, `ssh bandit[level]@bandit.labs.overthewire.org -p 2220`

## Bandit 0

**user:** *bandit0*  
**pass:** *bandit0*

`ls`  
`cat readme`

Password for *bandit1*: **boJ9jbbUNNfktd78OOpsqOltutMc3MY1**

## Bandit 1

**user:** *bandit1*  
**pass:** *boJ9jbbUNNfktd78OOpsqOltutMc3MY1*

`ls`  
`cat ./-`

Password for *bandit2*: **CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9**

## Bandit 2

**user:** *bandit2*  
**pass:** *CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9*

`ls`  
`cat spaces\ in\ this\ filename`

Password for *bandit3*: **UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK**

## Bandit 3

**user:** *bandit3*  
**pass:** *UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK*

`ls -a inhere/`  
`cat inhere/.hidden`

Password for *bandit4*: **pIwrPrtPN36QITSp3EQaw936yaFoFgAB**

## Bandit 4

**user:** *bandit4*  
**pass:** *pIwrPrtPN36QITSp3EQaw936yaFoFgAB*

`file inhere/*`

There's only one ASCII text file.

`cat inhere/-file07`

Password for *bandit5*: **koReBOKuIDDepwhWk7jZC0RTdopnAYKh**

## Bandit 5

**user:** *bandit5*  
**pass:** *koReBOKuIDDepwhWk7jZC0RTdopnAYKh*

> The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:  
> human-readable  
> 1033 bytes in size  
> not executable

`find inhere/ -size 1033c`  
`cat inhere/maybehere07/.file2`

Password for *bandit6*: **DXjZPULLxYr17uwoI01bNLQbtFemEgo7**

## Bandit 6

**user:** *bandit6*  
**pass:** *DXjZPULLxYr17uwoI01bNLQbtFemEgo7*

> The password for the next level is stored somewhere on the server and has all of the following properties:  
> owned by user bandit7  
> owned by group bandit6  
> 33 bytes in size

`find / -user bandit7 -group bandit6 -size 33c`  
`cat /var/lib/dpkg/info/bandit7.password`

Password for *bandit7*: **HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs**

## Bandit 7

**user:** *bandit7*  
**pass:** *HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs*

`strings data.txt | grep millionth`

Password for *bandit8*: **cvX2JJa4CFALtqS87jk27qwqGhBM9plV**

## Bandit 8

**user:** *bandit8*  
**pass:** *cvX2JJa4CFALtqS87jk27qwqGhBM9plV*

`strings data.txt | sort | uniq -u`

Password for *bandit9*: **UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR**

## Bandit 9

**user:** *bandit9*  
**pass:** *UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR*

`strings data.txt | grep ===`

Password for *bandit10*: **truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk**

## Bandit 10

**user:** *bandit10*  
**pass:** *truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk*

`base64 -d data.txt`

Password for *bandit11*: **IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR**

## Bandit 11

**user:** *bandit11*  
**pass:** *IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR*

`cat data.txt | tr "N-ZA-Mn-za-m" "A-Za-z"`

Password for *bandit12*: **5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu**

## Bandit 12

**user:** *bandit12*  
**pass:** *5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu*

`mkdir /tmp/jakehelman`  
`cp data.txt /tmp/jakehelman`  
`cd /tmp/jakehelman`  
`xxd -r data.txt data`  
`file data`

It is a gzip compressed file.

`mv data data.gz`  
`gzip -d data.gz`  
`file data`

It is now a bzip2 compressed file. This goes on for a quite a while 
constantly decompressing bzip2, gzip, even POSIX tar until finally 
we get an ASCII text file.

Password for *bandit13*: **ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL**

## Bandit 13

**user:** *bandit13*  
**pass:** *8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL*

`ssh -i sshkey.private bandit14@localhost`  
`cat /etc/bandit_pass/bandit14`

Password for *bandit14*: **4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e**

## Bandit 14

**user:** *bandit14*  
**pass:** *4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e*

`cat /etc/bandit_pass/bandit14 | nc localhost 3000`

Password for *bandit15*: **BfMYroe26WYalil77FoDi9qh59eK5xNr**

## Bandit 15

**user:** *bandit15*  
**pass:** *BfMYroe26WYalil77FoDi9qh59eK5xNr*

`cat /etc/bandit_pass/bandit15 | openssl s_client -connect localhost:30001 -ign_eof`

Password for *bandit16*: **cluFn7wTiGryunymYOu4RcffSxQluehd**

## Bandit 16

**user:** *bandit16*
**pass:** *cluFn7wTiGryunymYOu4RcffSxQluehd*

`nmap -p 31000-32000 localhost`  

Four ports are returned.

`nc localhost [port number]`

All but one just echo the response. Let's send the password via ssl to that port.

`cat /etc/bandit_pass/bandit16 | openssl s_client -connect localhost:31790 -ign_eof`

We get back a private ssh key. So we copy that out to a file in our `tmp` folder.

`chmod 600 key`  
`ssh -i key bandit17@localhost`  
`cat /etc/bandit_pass/bandit17`

Password for *bandit17*: **xLYVMN9WE5zQ5vHacb0sZEVqbrp7nBTn**

## Bandit 17

**user:** *bandit17*  
**pass:** *xLYVMN9WE5zQ5vHacb0sZEVqbrp7nBTn*

`diff passwords.old passwords.new`

Password for *bandit18*: **kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd**

## Bandit 18

**user:** *bandit18*  
**pass;** *kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd*

When trying to connect with that user and password the connection 
immediately closes with the phrase "Byebye !". Luckily, we can tack on 
command to the end of our `ssh` command so let's try to see what files are 
in *badit18*'s home directory.

`ssh bandit18@bandit.labs.overthewire.org -p 2220 ls -la`

We see a *readme* file. Let's read that.

`ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme`

Password for *bandit19*: **IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x**

## Bandit 19

**user:** *bandit19*  
**pass:** *IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x*

`ls -la`

We see a *set-uid binary* that executes with *bandit20*'s permissions.

`./bandit20-do`

Apparently it just runs any command we pass it so... we could just get a shell by:

`./bandit20-do sh`

But all we need is the password for *bandit20*. We can `ssh` in after.

`./bandit20-do cat /etc/bandit_pass/bandit20`

Password for *bandit20*: **GbKksEFF4yrVs6il55v6gwY5aVje5f0j**

## Bandit 20

**user:** *bandit20*  
**pass:** *GbKksEFF4yrVs6il55v6gwY5aVje5f0j*

`ls -la`

We see another *set-uid binary*.

`./suconnect`  
> This program will connect to the given port on localhost using TCP. 
> If it receives the correct password from the other side, the next 
> password is transmitted back.

And from the problem description, the correct password is the current password.

So we can just start a `nc` server that responds with the password for `bandit20`, 
set it to run in the background and then connect to it with this binary.

`echo GbKksEFF4yrVs6il55v6gwY5aVje5f0j | nc -lvp 1337&`  
`./suconnect 1337`

Passowrd for *bandit21*: **gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr**

## Bandit 21

**user:** *bandit21*  
**pass:** *gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr*

`ls /etc/cron.d`

There is a cronjob called *cronjob_bandit22*. Let's see what it does.

`cat /etc/cron.d/cronjob_bandit22`

It executes a *bash* script. Let's see what that does.

`cat /usr/bin/cronjob_bandit22.sh`

```
#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
```

So it's just writing out the *bandit22* password file to this *tmp* file.

`cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv`

Password for *bandit22*: **Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI**

## Bandit 22

**user:** *bandit22*
**pass:** *Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI*

Simliar to last level there is a cronjob called `cronjob_bandit23`

`cat /etc/cron.d/cronjob_bandit23`

Again it calls a bash script...

`cat /usr/bin/cronjob_bandit23.sh`

```
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
```

So it's doing some string manipulation to create an obfuscated filename this time. 
But silly of them, we can just replicate those commands to get the file name.

`echo I am user bandit23 | md5sum | cut -d ' ' -f 1`  
`cat /tmp/8ca319486bfbbc3663ea0fbe81326349`

Password for *bandit23*: **jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n**

## Bandit 23

**user:** *bandit23*  
**pass:** *jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n*

Wait for it... another cronjob.

`cat /usr/bin/cronjob_bandit24.sh`

```
#!/bin/bash

myname=$(whoami)

cd /var/spool/$myname
echo "Executing and deleting all scripts in /var/spool/$myname:"
for i in * .*;
do
  if [ "$i" != "." -a "$i" != ".." ];
  then
    echo "Handling $i"
    timeout -s 9 60 ./$i
    rm -f ./$i
  fi
done
```

So it's doing exactly what the problem description said. It's running every 
file in `/var/spool/bandit24` and then deleting them. So maybe we can slip our 
own bash script in there for it to run. We'll work out of *tmp* directory so that 
we can maintain a copy of our script.

```
#!/bin/bash
cat /etc/bandit_pass/bandit24 > /tmp/jakehelman3/bandit24
```

`cp /tmp/jakehelman3/a.sh /var/spool/bandit24`  

After making sure our *tmp* directory had the correct permissions set to allow *bandit24* to 
write a file to it and waiting for the cronjob to run.

`cat /tmp/jakehelman3/bandit24`

Password for *bandit24*: **UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ**

## Bandit 24

**user:** *bandit24*  
**pass:** *UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ*

So we need to brute force this thing...

Let's generate all the pin codes and dump them in a file.

`for i in {0000..9999};do echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ $i";done > pins.txt`

`nc localhost 30002 < nums.txt | grep -v Wrong`

Password for *bandit25*: **uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG**

## Bandit 25

**user:** *bandit25*  
**pass:** *uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG*

So we just try to connect with the private key...

`ssh -i bandit26.key bandit26@localhost`

But the connection just automatically quits... The description for this level tells us 
that *bandit26* is using a shell that is not `/bin/sh`. So let's see what it is...

`cat /etc/passwd|grep bandit26`

So it's using some shell `/usr/bin/showtext`

`cat /usr/bin/showtext`

So it's calling the `more` command. But `more` only stops output if the screen isn't big 
enough to display it all. So let's connect again with a smaller console window.

Ok we're stuck in the `more` command. Great! Now reading the manual page for `more` 
there is a the command `v` to enter a vi editor.

And being familiar with vi, i know that we can execute commands and even drop into a shell 
from within the editor.

But crap, we execute `:shell` and end up in the `more` command. That's because the shell for 
*bandit26* is still the same. So we can type `:set shell=/bin/bash` in vi and then `:shell` 
and we are in a proper bash shell.

`cat /etc/bandit_pass/bandit26`

Password for *bandit26*: **5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z**

## Bandit 26

**user:** *bandit26*  
**pass:** *5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z*

This doesn't really matter because of that crazy shell setup. So once we can get back to our 
*bandit26* bash shell. We `ls` the home directory. There is a *setuid* binary called 
`bandit27-do`.

`./bandit27-do cat /etc/bandit_pass/bandit27`

Password for *bandit27*: **3ba3118a22e93127a4ed485be72ef5ea**

## Bandit 27

**user:** *bandit27*  
**pass:** *3ba3118a22e93127a4ed485be72ef5ea*

`git clone ssh://bandit27-git@localhost/home/bandit27-git/repo`  
`cd repo`  
`cat README`

Password for *bandit27*: **0ef186ac70e04ea33b4c1853d2526fa2**

## Bandit 28

**user:** *bandit28*  
**pass:** *0ef186ac70e04ea33b4c1853d2526fa2*

`git clone ssh://bandit28-git@localhost/home/bandit28-git/repo`  
`cd repo`  
`cat README.md`

We see a *username* and *password* but the *password* is all Xs. Let's check the log of 
commits for this repository.

`git log`

We see the last commit had a message "fix info leak". I bet if we check the changes on that 
commit we'll see the plaintext password.

`git show --full-diff`

Password for *bandit29*: **bbc96594b4e001778eee9975372716b2**

## Bandit 29

**user:** *bandit29*  
**pass:** *bbc96594b4e001778eee9975372716b2*

`git clone ssh://bandit29-git@localhost/home/bandit29-git/repo`  
`cd repo`  
`cat README.md`

We see a little hint "no passwords in production!". So the plaintext password is probably in 
this file on a different branch.

`git branch -a`

We see three branches. Let's checkout the `dev` branch.

`git checkout dev`  
`cat README.md`

Password for *bandit30*: **5b90576bedb2cc04c86a9e924ce42faf**

## Bandit 30

**user:** *bandit30*  
**pass:** *5b90576bedb2cc04c86a9e924ce42faf*

`git clone ssh://bandit30-git@localhost/home/bandit30-git/repo`  
`cd repo`  
`cat README.md`

"just an empty file... muahahaha". So let's check the commit log.

`git log`

Just a single commit. So no help there... Let's look at the branches.

`git branch -a`

Just one branch. So no help there... There are a few ways to include metadata or 
messages in git repositories. One of the ways is with *tags*. In git we can add *tags* 
to branches and actually include messages(ie descriptions) of those tags.

`git tag`

Aha we see a single git tag called secret. Let's check if there is a message attached to that 
tag.

`git show secret`

Password for *bandit31*: **47e603bb428404d265f59c42920d81e5**

## Bandit 31

**user:** *bandit31*  
**pass:** *47e603bb428404d265f59c42920d81e5*

`git clone ssh://bandit31-git@localhost/home/bandit31-git/repo`  
`cd repo`  
`cat README.md`

Ok so this is just checking to see if we know how to push a file to the remote repo.

`echo May I come in? > key.txt`  
`git add key.txt`

Uh oh... that file is in our `.gitignore` which basically means it won't be pushed up to 
the remote repository. We can force it to though.

`git add -f key.txt`  
`git commit -a -m "adding file"`  
`git push`

Password for *bandit32*: **56a9bf19c63d650ce78e6ec0354ee45e**

## Bandit 32

**user:** *bandit32*  
**pass:** *56a9bf19c63d650ce78e6ec0354ee45e*

"WELCOME TO UPPERCASE SHELL"...

All of our commands are getting capitalized so they don't work... We do get a little hint. 
Every failed command says `sh: 1: blah: not found`.  So we are executing in a bourne-shell. 
If we read the man page (`man sh`) we see a that `sh` handles command line arguments like 
most programs, assigning the command to index 0 (`argv[0]` for those familiar with C syntax) 
and the arguments passed to it from index 1 to n. And if we recall with shell scripts, 
the `$` operator gets the value of a variable. So if we just call:

`$0`

It should execute `/bin/sh`. And it does. We get a clean shell.

`cat /etc/bandit_pass/bandit33`

Password for *bandit33*: **c9c3199ddf4121b10cf581a98d51caee**

## Bandit 33

**user:** *bandit33*
**pass:** *c9c3199ddf4121b10cf581a98d51caee*

And at this moment, no level 34 exists yet... So we completed Bandit!












