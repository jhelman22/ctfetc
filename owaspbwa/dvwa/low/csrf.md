# [CSRF](http://localhost/vulnerabilities/csrf/)

So we know this action of changing one's password is vulnerable to 
Cross Site Request Forgery. Meaning that if we can get a user to 
execute the GET request while they are logged in, we can get them to 
change their password to whatever we want.

The idea would be to send a user to a webpage we created that would execute 
the GET request to change their password without them knowing. We could obviously 
just send them to the link but it would redirect them to the page that tells them 
they just changed their password. That's no good because they'll be suspicious and 
just change it again.

We could try to make an asynchronous request in Javascript but you are going to run 
into CORS error (ie. can't make requests across origins).

A great workaround is to bring up the page in a hidden `<iframe>`. Take the malicious page below:

```html
<html>
  <h1>SOME RANDOM HTML FOR YOUR GULLIBLE USER!</h1>
  <iframe src="http://localhost/vulnerabilities/csrf/?password_new=evil&password_conf=evil&Change=Change#" style="display:none;"></iframe>
</html>
```

We host this page somewhere and send the link to our user (who is already logged into the application).

They visit this link and see whatever we want, a blog, a picture, whatever. What they don't see is 
the hidden iframe that changed their password to `evil`. When they try to log back into the app later they 
won't be able to. But we can log in!
