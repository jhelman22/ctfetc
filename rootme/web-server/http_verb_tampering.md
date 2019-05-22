# [HTTP Verb Tampering](https://www.root-me.org/en/Challenges/Web-Server/HTTP-verb-tampering)

If we click the link we get an `.htaccess` authentication form. If you do some research 
on how `.htaccess` is configured based on the different request methods (ex. GET, POST, etc)

So obviously `GET` is blocked by the login form. But using the challenge title as a hint what 
if we try another method like `PUT`

`curl -X PUT 'http://challenge01.root-me.org/web-serveur/ch8/`

And we got our password!

Password is: **a23e$dme96d3saez$$prap**
