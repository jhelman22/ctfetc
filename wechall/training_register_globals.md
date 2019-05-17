# [Training: Register Globals](https://www.wechall.net/challenge/training/php/globals/index.php)

This challenge is about the possible vulnerability in PHP if `register_globals` is ON. 
Basically in older versions of PHP every GET,POST and COOKIE was given a variable.

So if a url was `?action=hello`. Then there would automatically be a variable available in 
the script `$action` that contained `hello`.

This is dangerous because if the developer forgets to initialize that variable to something else 
at the beginning of the code. An attacker can set it to whatever he wants.

We can see in the source code that if `$login[0] === 'admin'` we solve the challenge.

What the code is assuming though is that `$login` is being set in the request logic if the request is 
successful. They forgot to initialize it to something harmless at the beginning. So we don't even 
have to worry about a username and password. We can just tag this on to the url:

`?login[]=admin`

And we're in!

Solved.
