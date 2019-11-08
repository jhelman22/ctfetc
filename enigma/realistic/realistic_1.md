# [Realistic 1](http://challenges.enigmagroup.org/realistics/1)

So we have to hack this guys site "psychomarine". We got an nmap scan to look at and a website.

The nmap scan is interesting. We see a slightly obvious port: 1337

We go to `enigmagroup.org:1337` and we get a login page.

Great! But we need a login.

Let's check out this guy's site.

When we navigate around we see a GET parameter called `page`

Can we change it a la Local File Inclusion: `?page=admin`

"You are on the right track...this exploit is simulated"

Ok so we know it's local file inclusion and probably some directory traversal but its probably 
something specific. Say a `/etc/passwd` file?

`?page=../../../../etc/passwd`

Aha we got it.

`root:4d1Yq6PXGzYm6:0:0:root:/root:/bin/bash`

Let's crack it with john the ripper.

The `root` password is `31337`. Clever...

We go back to `enigmagroup.org:1337` type in our new user/pass combo.

And mission complete!
