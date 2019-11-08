# Irish Name Repo 2

"There is a website running at https://2019shell1.picoctf.com/problem/58043/ (link). Someone has bypassed the login before, and now it's being strengthened. Try to see if you can still login! or http://2019shell1.picoctf.com:58043"

Same site as the last Irish Name challenge. Let's poke around the login again.

Trying our trusty bypass with `' or 1=1-- ` as the user we get "SQLi detected"

So they probably have a blacklist of things we can try. Probably just "or".

We know there is an admin user from our look at the "Support" page.

Let's try to log in as admin without a password. `admin'-- ` as the user.

This will comment out the password check part of the query.

And it works! We logged in as admin.

> Flag: picoCTF{m0R3_SQL_plz_c9c1c726}
