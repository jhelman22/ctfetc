# [HTTP Improper Redirect](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Improper-redirect)

If we try to access the index we get redirected to the login form. Let's intercept the 
request in Burp and follow the redirect. We see in the response the flag.

Flag is **ExecutionAfterRedirectIsBad**
