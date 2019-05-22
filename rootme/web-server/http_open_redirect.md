# [HTTP Open Redirect](https://www.root-me.org/en/Challenges/Web-Server/HTTP-Open-redirect)

> Find a way to make a redirection to a domain other than those showed on the web page.

We got a page with three links and if we look at the source code, they are just GET 
requests with the parameters `url` and `h` which is a hash. So can we just modify one of 
the existing links and change the url?

`?url=https://google.com&h=a023cfbf5f1c39bdf8407f28b60cd134`

Nope we get "Incorrect hash!"

So let's see if we can figure out how `h` should be set. It looks like an MD5 hash. So 
maybe it is just the url in MD5 hash form. And yes it is...

So we can take `https://google.com` and generate its MD5 hash which is `99999ebcfdb78df077ad2727fd00969f`

`?url=https://google.com&h=99999ebcfdb78df077ad2727fd00969f`

And we get the flag but crap it redirects us real quick before we can copy it. Well we can 
just prepend `view-source:` before the url so that we have time to copy.

Flag is **e6f8a530811d5a479812d7b82fc1a5c5**
