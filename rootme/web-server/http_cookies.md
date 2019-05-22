# [HTTP Cookies](https://www.root-me.org/en/Challenges/Web-Server/HTTP-cookies)

We see a form to "save email addresses", but if we first look at the source, we see 
a comment saying: "SetCookie('ch7','visiteur');"

Ok we'll probably need that later. Let's click "Saved email addresses".

It says you need to be `admin`. Well we see in the url: `?c=visteur`. Let's change that 
to `?c=admin`. We get:

> Problem with cookie

Let's go into the console and see our cookies with `document.cookie`

One cookie: `ch7=visiteur`

Let's change that to admin also with: `document.cookie="ch7=admin"`

And refresh the page. Voila there's our password.

Password is: **ml-SYMPA**
