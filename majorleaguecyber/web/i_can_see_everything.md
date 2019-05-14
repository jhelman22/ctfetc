# [I Can See Everything](https://training.majorleaguecyber.org/challenges#I%20Can%20See%20Everything)

Now it looks like we are actually going to exfiltrate information with SQL injection.

We got a search box that filters "friends". Playing around with the search functionality 
we see that it filters the list by "name". So the query probably looks like this:

`SELECT * FROM friends WHERE name=$_GET["search"];`

So if they aren't sanitizing our search we can return all friends with just `' or 1=1-- `

And yep there's our flag.

> flag{1_c4n_s3e_y0ur_ev3ry_m0v3}
