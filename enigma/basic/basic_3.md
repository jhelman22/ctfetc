# [Basic 3](http://challenges.enigmagroup.org/basics/pre/3/)

Another login page, no errors or hints obvious. Looking at the source.

Nothing obvious at first. Let's try to submit blank form.

"A username and password must be given"

Let's take a look at the console/cookies. Nothing interesting...

The tip says "Robots".

So we look at `/robots.txt`

And see a `Disallow: /f0rk/`

So we go there directly. We get a file directory with a single file `config.inc`

And we see our user/pass combo...

> admin:f0rkblork
