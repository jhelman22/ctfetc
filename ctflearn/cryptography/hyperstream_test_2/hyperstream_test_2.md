# [Hyperstream Test \# 2](https://ctflearn.com/problems/443)

At first I saw only two characters so I thought "it's probably binary". But whether the 
A=1 and B=0 or vice versa, it produced gibberish.

So I started to do some research on two character ciphers and found 
[this site](http://practicalcryptography.com/cryptanalysis/text-characterisation/identifying-unknown-ciphers/)

And it mentions if the cipher only has two characters, it's probably Baconian.

Wait... didn't the problem description say that he loved bacon?

Here's the [Baconian algorithm](http://practicalcryptography.com/ciphers/baconian-cipher/)

The gist is that each character in the alphabet is assigned a string of five digits. They 
can be 1s and 0s or in the case of the problem As and Bs.

And we assign them to each letter by just counting up in binary.

So A = 00000 or AAAAA, B = 00001 or AAAAB.

So why didn't my script that changed the string to binary not work? Well, that's because 
binary to ascii is looking for the actual ascii value in binary. For example, the ascii 
value of "A" is decimal 65, not 0 in the case of our cipher.

No worries we can still script this real quick.

I was having trouble getting my script to output anything of value until I saw an 
alternative approach to the algorithm where I=J and U=V. This small change made it 
all clear.

So instead of 26 letters in the alphabet there are only 24. It is up to us to determine 
whether or not the sender meant an "I" or a "J". Same goes for "U" and "V"

Our flag is!

> ILOUEBACONDONTYOU
