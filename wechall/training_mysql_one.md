# [Training: MySQL 1](https://www.wechall.net/challenge/training/mysql/auth_bypass1/index.php)

Basic SQL injection. By looking at the source code, if we want to be admin we can just tell 
the query that we are admin and ignore checking for the password with:

`admin'-- `

This executes the `where username='admin'-- and password=...`. We commented out the rest of the 
query so we are in without a password.

Solved.
