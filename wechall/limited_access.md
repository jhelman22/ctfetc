# [Limited Access](https://www.wechall.net/challenge/wannabe7331/limited_access/index.php)

So he tried to secure his site with `.htaccess`. We get to see the contents of his `.htaccess` 
and we see he is only limiting GET requests. So let's POST!


`curl 'https://www.wechall.net/challenge/wannabe7331/limited_access/protected/protected.php' -X POST -H 'Cookie: WC=11XXXXXX-XXXXX-XXXXXXXXXXXXXXXX'`

Solved.
