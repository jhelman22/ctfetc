# Part Two

In this part we are exploring "Cloaknet" which is apparently the anonymous browsing tool 
in this world.

If we go to `http://cloaknet`, we get a login page.

There is a "No account?" link that popsup to tell us to use the demo account: "demo:demo"

Let's do that. So we got a little log and that's about it. Let's poke around the source, 
look at the cookies, all that usual stuff.

Aha! We find a cookie named `userid` which is just some integer. Weak session ids anyone?

Can we change ourselves to another valid user?

Let's brute force some `userid`s and look for any evidence we have successfully changed user.


