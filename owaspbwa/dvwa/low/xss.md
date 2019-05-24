# XSS

## [DOM XSS](http://localhost/vulnerabilities/xss_d/)

If we take a look at the source, the javascript takes whatever is 
in `$_GET['default']` and puts it directly into the DOM without sanitation.

So we can pass a malicious script:

`?default=<script>alert(1);</script>`

This, as expected, creates a javascript alert box.

This can be used for something more malicious and sent in some sort of 
phishing attack.

## [Reflected XSS](http://localhost/vulnerabilities/xss_r/)

So if we type our name into the input box and look at the source, we see 
that whatever comes through `$_GET['name']` is put directly into HTML.

So like the DOM XSS attack, we can inject some javascript directly into the page.

`?name=<script>alert(1);</script>`

## [Stored XSS](http://localhost/vulnerabilities/xss_s/)

So we have a guestbook form where our name input and message input gets persisted 
in the database and then pulled and displayed on the screen.

Let's check if they do any sanitation of our inputs.

The name field seems like there is some sanitation. The hmtl input is limited by characters 
which isn't a big deal because we manually modify the POST request but even so 
it doesn't seem like we can inject any javascript at first glance.

The message field however is vulnerable. Just type any message with `<script>alert(1)</script>` 
appended and we got stored xss.
