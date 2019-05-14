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

## Pre-Level 3

So if we look at the source of this page. The form has some javascript logic to determine 
whether to `submit()` or not.

Bascially our input has to be the `reverse` of `unescape('%68,%61,%73,%6c,%6f')`

Password is: **olsah**

## Pre-Level 4

So we have to "vote 3 times". We click "Vote" and it sasy "Thanks for the vote!"

We can't vote again? Let's see if we can find how they are tracking our vote count.

There's a cookie called `vote`. Let's set it to 3 and refresh.

Uh oh... it says "CHEATER!!". Maybe that wasn't how we solve this?

Oh nevermind. After trying a few things. I had to set `vote='3'` for it to work.

## Pre-Level 5

There's a couple of hints in the title and description that points to this being a XSS challenge.

If you look at what happens when you type something into the input, and click Next. It just leaves it 
as the `value` of the input. We can do some trickery to modify the behavior of the input.

`" onload="javascript:alert("Cross")" class="hello`

And we're given our registration form!
