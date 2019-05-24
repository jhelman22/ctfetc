# Part One

We go to our Wraithmail inbox and see an email "Trace Job"

We have to find the name and address of the hacker behind the sql injection 
attack request listed in the email.

The only possibly useful information we have is the `Referer` header. It's a 
url of a mail message in Wraithmail:

`http://wraithbox:80/htmlisland.jsp?messageid=2849902671918618960`

So we try to go there and it lets us so obviously there is no authentication on 
wraithmail as long as you know the messageid. Not sure that's pertinent for right now 
but something worth noting.

We see the email where the attack URL was hidden in a link sent to "hkoch" from "**rwilson**"

So maybe "rwilson" is our attacker, if we try to click their email link we get a message 
saying they have chosen to not make their profile publicly available.

Hmm... We just send that address an email, just in case they reply and their name and address 
is in the signature of their email or something.

Then we see this link for "Login History" in Wraithmail. Let's look.

It looks like someone successfully logged into our account.

`IP Address: 43.161.90.58`

It's not a real IP so not much use. Let's go back to the malicious email.

We see the link is to `http://utrack/`. Let's go there.

We get an under construction login page. "For Technicians only!"

Hmmm... Nothing really to see here.

The original email said that most users would use Tor so that theire IP wouldn't be much use.

So remembering the intro to the game, let's go to `http://cloaknet`

This is the "cloaking solution" for discrete users. I don't have an account though so I 
use the demo account "demo:demo".

We see a log of someone going to Wraithmail with the IP: `137.40.29.72` on the same day my 
account was hacked. I bet this is the real IP address.

If we run `whois 137.40.29.72`, we get:

> Matsushita Electric Industrial Co, Ltd
> 1072 East Meadwo Circle
> Palo Alto
> CA
> 94303

Which is actually the company "Panasonic"? Am I digging to deep and outside the game?

Probably... Let's go back to the wraithmail login history. We see the url is:

`history.jsp?id=algo`

Let's change the id to `?id=rwilson`

We get header validation failed. Let's try intercepting the request with Burp and changing 
it there instead.

Aha! We get another IP of someone who logged into "rwilson": `70.86.70.33`

I'm not sure what more is left to do. Let's recap.

We got the hacker's username: **rwilson** and what we assumed is their real IP: **70.86.70.33**
