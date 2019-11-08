# JaWT Scratchpad

"Check the admin scratchpad! https://2019shell1.picoctf.com/problem/12283/ or http://2019shell1.picoctf.com:12283"

So this site is proudly powered by JWT aka. JSON Web Tokens which are a way to authenticate a user, very much like 
session cookies.

Sometimes they are too simple in their implementation though. 

We "log in" as a random name, in my case, "jake".

If we look at our cookies, we have a new one called `jwt`. This is our token.

We can take it over to a site like [this](https://www.jsonwebtoken.io/) to break it into its pieces.

We take our token: `eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiamFrZSJ9.U_XpuRXnXep1p_WCppT_sJcrBISD63gyKT_K0sN4oXc`

And it gives us the header and payload.

header:

```
{
 "typ": "JWT",
 "alg": "HS256"
}
```

payload:

```
{
 "user": "jake",
 "jti": "23a6a6ab-ed74-4a9d-add5-1eb11939d2b1",
 "iat": 1573169696,
 "exp": 1573173296
}
```

As you can see our login name is just passed as field in our payload. What if we changed that to "admin" and generated a new token and 
swapped it in for ours?

We can modify the payload right there on the site but one little problem. We need the SECRET!

Luckily you can crack the secret using John the ripper and a wordlist.

The secret key: `ilovepico`

Now we just have to create our own JWT with `{"user": "admin"}` and sign it with the secret key we found.

I used `ruby-jwt` to do the encoding.

```ruby
require 'jwt'

payload = { user: "admin" }

JWT.encode(payload, "ilovepico", "HS256")
```

Swap in our new admin token in our cookie and refresh! Boom!

> Flag: picoCTF{jawt_was_just_what_you_thought_9de8e25511a8841ab9ade0aa092be116}



