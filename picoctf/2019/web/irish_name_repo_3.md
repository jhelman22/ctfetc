# Irish Name Repo 3

"There is a secure website running at https://2019shell1.picoctf.com/problem/49838/ (link) or http://2019shell1.picoctf.com:49838. Try to see if you can login as admin!"

Same freaking Irish people site. Login problems again?

The login is just asking for a password now...

Our little bypass, `' or 1=1-- ` errors out with a blank page.

But looking at the request there is a hidden parameter being passed called `debug`

What if we change that to `debug=1`.

Aha we get the actual error message!

```
password: ' or 1=1-- 
SQL query: SELECT * FROM admin where password = '' be 1=1-- '
```

It converted our "or" to "be". That just looks shifted doesn't it. The move from "o" to "b" is the exact same distance as "r" to "e".

Let's try to figure out which way it shifts with `' ps 1=1-- `

"ps" became "cf" just like i suspected. It's shifting them back by 13 letters. The old ROT13.

So if we do this: `' be 1=1-- `

We are logged in!

> Flag: picoCTF{3v3n_m0r3_SQL_a9766759}
