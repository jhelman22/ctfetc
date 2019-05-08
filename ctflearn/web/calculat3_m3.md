# [Calculat3 M3](https://ctflearn.com/problems/150)

So we have a little GUI calculator. Seems nice enough.

There is a javascript file called `calc.js`. Let's see what that does.

Oh no...it's using the javascript `eval()` function to do calculations... That's not secure 
at all. Let's try to get it to `eval` some malicious code.

Ok so we have to go into Dev Tools to edit the html input so that we can modify the value. 
It won't let us just type stuff in, but no big deal. Let's set the `value` for the input.

`value="<script>alert(1);</script>"`

NOTE: I ended up not using Chrome because it has a reflected XSS auditor that catches this.

But on firefox, we get a popup! So it is reflected XSS vulnerable! But how do we get the flag?

Maybe XSS isn't what will get the job done. It seems the ongoing evaluation of the calculations 
is happening client-side (in javascript) but the final submit is going to a POST request.

PHP also has an `eval()` function. I wonder if their using that on the final calculation 
server-side before returning the result. If so, that's even worse for them because I can 
execute any command I want.

`;ls`

This will terminate whatever command they are running and run the `ls` command to list all 
files and directories in whatever folder this site is being served from.

And there's our flag!

> ctf{watch_0ut_f0r_th3_m0ng00s3}
