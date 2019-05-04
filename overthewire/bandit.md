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





















