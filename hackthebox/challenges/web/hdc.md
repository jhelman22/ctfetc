# [HDC](https://www.hackthebox.eu/home/challenges/Web)

So we start up the challenge and we get a login page for some crappy site. Let's poke around 
the source and see what we can find.

First thing I see is that the form submit button is not submitting a POST request but instead 
has an `onclick` attribute calling a javascript method `doProcess()`. Let's see if we can find 
that method.

Dead end. That method is in `myscripts.js` and all it does is call `submit()` on the form. 
Strange and unnecessary. Oh well... moving on.

**INCOMPLETE**
