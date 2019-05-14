# [Finding the Memes](https://training.majorleaguecyber.org/challenges#Finding%20the%20Memes)

So now we got to find the table name the challenge is using.

So if we use one of the suggested searches (ex "aqua pupper") we see that we are returned 
a table of memes with "name" and "link". So the query probably looks like this:

`SELECT name,link FROM table_name WHERE name=$_GET["search"];`

We need to figure out the table_name...

We can use `UNION` to grab information from `information_schema`. But first we need to find 
out how many columns the query is returning.

`aqua pupper' ORDER BY 1-- `

And we keep incrementing the `ORDER BY` index until we get an error.

We find out that there are 3 columns being returned. So let's return an row of all NULLs.

`aqua pupper' UNION SELECT null,null,null-- `

You can see it in the html generated that we have an empty table row. So now, we have to figure 
out what types the columns are. We can make an educated guess that the first column is an 
autoincrementing id (integer), the second is the name (string), the third is the link (string). 
But we can test this assumption with:

`aqua pupper' UNION SELECT 1,'a','a'-- `

And we were right! We have a new row with our injected values.

Now we can query the `information_schema.tables` table to give us all the table names in the 
database.

`aqua pupper' UNION SELECT 1,TABLE_NAME,'a' FROM information_schema.tables-- `

And there's our flag!

> flag{w3lc0me_t0_th3_m3m3side}
