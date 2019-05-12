# [Pre Levels](https://www.securitytraps.pl/?d=pre)

So like Hack The Box, there are some qualifying levels before they even let you register.

## Pre-Level 1

We find the password in a comment in the source and since it's a "read only" input, we just change 
the HTML in dev tools and submit.

Password is: **alamakota**

## Pre-Level 2

The challenge is called "Base header" and it says they sent us an encoded password.

So let's take a look at the response headers. Sure enough there is a Base64 encode header called 
"Pass". Let's decode it.

Password is: **kotmapsa**
