# [PHP Register Globals](https://www.root-me.org/en/Challenges/Web-Server/PHP-register-globals)

Another hint in the title of the challenge. The short of it is that if `register_globals=1` on 
a PHP site, you can modify GLOBAL variables in GET requests. Obviously this is is unsafe.

`_SESSION['logged']` is the global to tell whether you are logged in or not. So if register 
globals is on, we can do this:

`/?_SESSION['logged']=1`

And yep we got the password!

Password is: **NoTQYipcRKkgrqG**
