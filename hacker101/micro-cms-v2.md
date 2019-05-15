# Micro CMS v2

**Difficulty: Moderate**  
**\# of Flags: 3**

So we got the same `/page/:id` setup as the v1 where we can see these pages.

Let's see if we can just try other ids to find unlisted pages.

We get "Forbidden" on `/page/3` so there's probably a flag there... Let's keep poking around.

We see that we cannot edit or create a new page without logging in.

If we just try a random user/pass combo, we get "Unknown user". So we can definitely brute 
force to enumerate usernames. But let's try a little SQL injection.

Let's try `admin' or 1=1-- ` as the user. Aha! We get "Unknown password". So we bypassed the 
username check. Let's try the same string to bypass the password check. Dang... no luck!

Well if we try `admin' or 1=1` for the user and `admin' or 1=1-- ` for the pass we get an 
error message!

We see the query that is failing...

`SELECT password FROM admins WHERE username=\'%s\'`

So it's loading the password from the admins table for the username we provide and comparing 
it directly against the password we provide

** IN PROGRESS **
