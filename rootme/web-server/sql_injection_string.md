# [SQL Injection: String](https://www.root-me.org/en/Challenges/Web-Server/SQL-injection-string)

So we start exploring this news article site. We see that the different news articles are 
loaded via GET requests with url: `?action=news&news_id=1`

We mess around with the `news_id` parameter testing for SQLi and don't find anything 
immediately obvious.

We find a "search" page. Let's search for something we know is in one of the articles: `vuln`

It returns us that single article. What if we search for: `vuln' or 1=1-- `?

It returns all the articles! So that is injectable. We can probably get all we need from there 
but let's just check out the login form just to be thorough. Nothing immediately apparent 
there so we're going to try to extract some info by injecting the "search" page.

We try to find out how many columns are being returned by the query with:

`vuln' order by 1-- `

And we increment the index until we get an error, which we get at "3". So the query is 
returning 2 columns.

Let's determine what type of columns with:

`vuln' union select 'a',null-- `

That worked so the first column is a string.

`vuln' union select 'a','a'-- `

That worked too so both columns are strings. That'll be helpful in the next steps even though 
we really only needed one.

Let's get the table names. We saw earlier from the errors that this is an SQLite database. So 
the way we get table names and schema information is different from MySQL and we don't need 
the space after the `--` for comments to be valid. [See here](https://github.com/unicornsasfuel/sqlite_sqli_cheat_sheet)

`' union select name,null from sqlite_master where type='table'--`

Two tables: "news" and "users"

The goal of the challenge is to get the admin password so obviously we are interested in the 
"users" table. Let's get the columns.

`' union select sql,null from sqlite_master where name='users'--`

Three columns: "username", "password" and "year"

Let's just list all usernames and passwords for fun.

`' union select username,password from users--`

And there's the admin password!

Password is: **c4K04dtIaJsuWdi**


