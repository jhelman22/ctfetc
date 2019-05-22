# [PHP Command Injection](https://www.root-me.org/en/Challenges/Web-Server/PHP-Command-injection)

So we have an input box that takes an IP or hostname and passes it to the system `ping` command. 
This is probably identical to the command injection on DVWA. The challenge description said the 
flag was in `index.php` so let's read that file.

`www.google.com;cat index.php`

We terminate the `ping` command with the `;` and run our own command.

The form gets displayed a second time on the page because the browser is rendering the HTML 
in that file but if you view the source, you'll see the raw PHP code that the browser didn't 
know what to do with.

Flag is: **S3rv1ceP1n9Sup3rS3cure**
