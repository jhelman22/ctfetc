# [Hextroadinary](https://ctflearn.com/problems/158)

We are given two hex values:

> 0xc4115 0x4cf8

Apparently she did something with these two values to generate a secret code.

So I immediately thought of bitwise operations. AND, OR, XOR

I went over [here](http://jdejong.net/tools/bitwisecalculator.php)

And cycled through each operation with the two values...Hmmm XOR seems interesting...

If you XOR the two values together you get the hex value `0x0C0DED`

Hex that reads like plain text? Seems like a flag to me and yes it was!

> 0xC0DED
