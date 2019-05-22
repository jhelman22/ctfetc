# [CRLF](https://www.root-me.org/en/Challenges/Web-Server/CRLF)

So we got a login form with some log output on the screen. If we type in a random 
user and pass. We see that the log is updated with:

> user failed to authenticate.

Like previous challenges, the title is a hint. CRLF=Carriage Return Line Feed.

The URL encoding for CRLF is `%0D%0A`

What if we hit the URL:

`?username=admin authenticated.%0D%0Azumo&password=`

We successfully added two lines to the log.

> admin authenticated.
> zumo failed to authenticate.

And they gave us the password for our troubles

Password is: **rFSP&G0p&5uAg1%**
