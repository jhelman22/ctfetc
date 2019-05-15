# [Training: PHP LFI](https://www.wechall.net/challenge/training/php/lfi/up/index.php)

So we see the source. We got to somehow get the script to load `../soution.php` but the 
script is appending `.html` to any file we include...

So if we query `?file=../solution.php` it will try to include `../solution.php.html` which is 
not what we want.

To get the script to ignore the `html` extension we can use null byte injection.

`?file=../solution.php%00` where `%00` is a null byte.

That should've worked but the below ended up working instead.

`?file=../../solution.php%00`

Solved
