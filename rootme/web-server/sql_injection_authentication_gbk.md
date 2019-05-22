# [SQL Injection Authentication GBK](https://www.root-me.org/en/Challenges/Web-Server/SQL-injection-authentication-GBK)

We get another login form. It's all in French but i get the gist.

Our usual tricks don't seem to work. Once again the title of the challenge has a huge 
hint. [Read this](https://hydrasky.com/network-security/sql-injection-bypass-php-addslashs-function/)

So we assume that the server is using `addslashes()` to escape our injection string.

So `admin'` becomes `admin%5c%27` where `%5c` is a backslash. But oddly enough, we can 
trick the server using a GBK multibyte character. `%bf%5c` is a valid GBK character: `?`

So if we can trick the query to use this as our username:

`?' or 1=1-- `

Then we will be authenticated. So our injection needs to look like this:

login: `%bf' or 1=1-- `

This is easiest to do in Burp. So the query params should look like this:

`login=%bf%27+or+1%3d1--+&password=doesntmatter`

Make sure you follow redirects in Burp b/c this isn't a real login page and the flag is 
only shown for a split second before redirecting.

Password is: **iMDaFlag1337!**
