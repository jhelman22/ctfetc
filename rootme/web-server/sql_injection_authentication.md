# [SQL Injection Authentication](https://www.root-me.org/en/Challenges/Web-Server/SQL-injection-authentication)

We get a login form. We already know it's SQLi vulnerable but let's try a random user/pass like 
`admin:admin`

Ok we get an error: "no such user/password"

So let's assume the SQL query looks like this:

`SELECT * FROM users WHERE username=$_POST['username'] AND password=$_POST['password'];`

So maybe we can bypass the login entirely and get authenticated by the first user in the db 
by passing these credentials:

username: `anybody`  
password: `' or 1=1-- `

And yep we get logged in as `user1`.

But what if we just want to be `admin` without knowing his password?

username: `admin'-- `  
password: `doesntmatter`

OK we are admin! And we see our information. Don't worry about the password being all dots 
you can just look at the source to see the `value` of that input.

Password is: **t0_W34k!$**
