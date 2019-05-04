# [Bandit](http://overthewire.org/wargames/bandit/)

For every level, `ssh bandit[level]@bandit.labs.overthewire.org -p 2220`

## Bandit 0

**user:** *bandit0*  
**pass:** *bandit0*

`ls`  
`cat readme`

Password for bandit1: **boJ9jbbUNNfktd78OOpsqOltutMc3MY1**

## Bandit 1

**user:** *bandit1*  
**pass:** *boJ9jbbUNNfktd78OOpsqOltutMc3MY1*

`ls`  
`cat ./-`

Password for bandit2: **CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9**

## Bandit 2

**user:** *bandit2*  
**pass:** *CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9*

`ls`  
`cat spaces\ in\ this\ filename`

Password for bandit3: **UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK**

## Bandit 3

**user:** *bandit3*  
**pass:** *UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK*

`ls -a inhere/`  
`cat inhere/.hidden`

Password for bandit4: **pIwrPrtPN36QITSp3EQaw936yaFoFgAB**

## Bandit 4

**user:** *bandit4*  
**pass:** *pIwrPrtPN36QITSp3EQaw936yaFoFgAB*

`file inhere/*`

There's only one ASCII text file.

`cat inhere/-file07`

Password for bandit5: **koReBOKuIDDepwhWk7jZC0RTdopnAYKh**

## Bandit 5

**user:** *bandit5*  
**pass:** *koReBOKuIDDepwhWk7jZC0RTdopnAYKh*

> The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:  
> human-readable  
> 1033 bytes in size  
> not executable

`find inhere/ -size 1033c`  
`cat inhere/maybehere07/.file2`

Password for bandit6: **DXjZPULLxYr17uwoI01bNLQbtFemEgo7**

## Bandit 6

**user:** *bandit6*  
**pass:** *DXjZPULLxYr17uwoI01bNLQbtFemEgo7*

> The password for the next level is stored somewhere on the server and has all of the following properties:  
> owned by user bandit7  
> owned by group bandit6  
> 33 bytes in size

`find / -user bandit7 -group bandit6 -size 33c`  
`cat /var/lib/dpkg/info/bandit7.password`

Password for bandit7: **HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs**

## Bandit 7

**user:** *bandit7*  
**pass:** *HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs*

`strings data.txt | grep millionth`

Password for bandit8: **cvX2JJa4CFALtqS87jk27qwqGhBM9plV**

## Bandit 8

**user:** *bandit8*  
**pass:** *cvX2JJa4CFALtqS87jk27qwqGhBM9plV*

`strings data.txt | sort | uniq -u`

Password for bandit9: **UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR**

## Bandit 9

**user:** *bandit9*  
**pass:** *UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR*

`strings data.txt | grep ===`

Password for bandit10: **truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk**

## Bandit 10

**user:** *bandit10*  
**pass:** *truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk*

`base64 -d data.txt`

Password for bandit11: **IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR**

## Bandit 11

**user:** *bandit11*  
**pass:** *IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR*

`cat data.txt | tr "N-ZA-Mn-za-m" "A-Za-z"`

Password for bandit12: **5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu**

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

Password for bandit13: **ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL**

## Bandit 13

**user:** *bandit13*  
**pass:** *8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL*

`ssh -i sshkey.private bandit14@localhost`  
`cat /etc/bandit_pass/bandit14`

Password for bandit14: **4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e**

## Bandit 14

**user:** *bandit14*  
**pass:** *4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e*

`cat /etc/bandit_pass/bandit14 | nc localhost 3000`

Password for bandit15: **BfMYroe26WYalil77FoDi9qh59eK5xNr**

## Bandit 15

**user:** *bandit15*  
**pass:** *BfMYroe26WYalil77FoDi9qh59eK5xNr*

`cat /etc/bandit_pass/bandit15 | openssl s_client -connect localhost:30001 -ign_eof`

Password for bandit16: **cluFn7wTiGryunymYOu4RcffSxQluehd**

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

Password for bandit17: **xLYVMN9WE5zQ5vHacb0sZEVqbrp7nBTn**

## Bandit 17

**user:** *bandit17*  
**pass:** *xLYVMN9WE5zQ5vHacb0sZEVqbrp7nBTn*

`diff passwords.old passwords.new`

Password for bandit18: **kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd**

## Bandit 18

**user:** *bandit18*
**pass;** *kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd*

























