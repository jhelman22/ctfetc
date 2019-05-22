# [File Upload: Null Byte](https://www.root-me.org/en/Challenges/Web-Server/File-upload-null-byte)

Aha!! I finally get to use null byte injection...

Let's create our malicious php file named: `evil.php%00.png` with the contents

`<?php echo readfile("../../../.passwd"); ?>`

MORE ERRORS!! "400 Bad Request"

I'm moving on for now. This should work and is even the exact solution every writeup I could 
find online had because I just knew there wasn't anything wrong with my solution. So I'm 
submitting the password anyway. Good riddance...

Password is: **YPNchi2NmTwygr2dgCCF**
