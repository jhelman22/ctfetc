# [Part 2](https://google-gruyere.appspot.com/part2)

## File Upload XSS

> Can you upload a file that allows you to execute arbitrary script on the google-gruyere.appspot.com domain?

Well, we saw in the introduction that we can upload any file we want. So we can upload an 
HTML file that looks like this

```
<html><body onload="javascript:alert(1)"></body></html>
```

Navigate to it and boom we have our alert box.

## Reflected XSS

> Find a reflected XSS attack. What we want is a URL that when clicked on will execute a script.

Well we can set our homepage in our profile to: `<script>alert(1);</script>`

And when anybody clicks on our homepage, they get an alert box.

## Stored XSS

> Now find a stored XSS. What we want to do is put a script in a place where Gruyere will serve it back to another user.

We can create our own "snippets" and get some javascript in there. Playing around, 
we can get javascript in the `href` of a link:

`<a href="javascript: alert(1)">Click here!</a>`

We can also get a popup without the user clicking.

`<a onmouseover="javascript: alert(1)">Hover here to see more!</a>`

## Stored XSS via HTML attribute

> You can also do XSS by injecting a value into an HTML attribute. Inject a script by setting the color value in a profile.

This is where paying attention to have things get rendered in html.

`green' onmouseover='alert(1)`

## Stored XSS via AJAX

> Find an XSS attack that uses a bug in Gruyere's AJAX code.


