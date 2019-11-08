# [Basic 22](http://challenges.enigmagroup.org/basics/sql/2/)

We get a main page with four links. Let's try the links and see the URL structure.

Sure enough we have a GET parameter called `id`

That could be vulnerable to SQLi but there is also a login page.

One of those probably is vulnerable since this is a vulnerable challenge...

We'll start with the login page.

Nothing obvious worked. Let's try the GET parameter

`?id=3-1` returns the the second page so here's the vulnerability.

Perhaps we can exfiltrate some data.

`?id=1 union select null-- `

Error: Wrong number of columns.

`?id=1 union select null,null,null-- `

That worked so we know it's returning three columns. Try something obvious?

`?id=4 union select 1,username,password from users-- `

It displays the username and password for the administrator because article id 4
doesn't exist and apparently administrator is the first user (possibly only) in the
users table.

It's obviously an MD5 hash of a password though so let's crack it.

And we got it!

> bl1nd
