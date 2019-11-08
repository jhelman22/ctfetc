# [Basic 31](http://challenges.enigmagroup.org/basics/vm/2/index2.php)

We just get red text "What are you doing here?". Well i'm trying to hack you...

Let's look at the source. Nothing interesting.

Look at that URL though... `index2.php`?

We are getting redirected from `index.php`. Strange...

Let's go look at the source of that. You can do this just by prepending `view-source` to the url like so:

`view-source:[url]/index.php`

Aha! We see a comment: `911_411.php`

Let's go there!

Boom. We passed!
