# [Basic 23](http://challenges.enigmagroup.org/basics/sql/3/)

Same thing as Basic 22, we got dynamic pages based off the GET parameter `id` which
seems to be vulnerable because `?id=2-1` displays the first page.

And we have a login page.

But if we try our `?id=1 union select null,null,null-- `

We get a "Warning - Hack attempted"

So they are probably doing some string filtering and checking for things like
`union select`

But if they are using a blacklist, they may miss things like capitalization, etc.

Trying a couple of things, I finally got a successful query using `UNION ALL`

So with `?id=5 union all select 1,username,password from users-- `

We got the user/hash combo

`administrator:6cfdca6f9633968c72a2a6e0fe2756ca`

We crack the hash and get our password!

> administrator:asdfgh
