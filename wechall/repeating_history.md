# [Repeating History]()

So we got to explore the github repository for the challenges to find the solutions.

So first we find where the files for this challenge are:

`gwf3/www/challenge/subversive`

We look at `repeating/what_do_you_want_here.php`

> <h1>Oh right... the solution to part one is '<?php /*InDaxIn*/ ?>' without the PHP comments and singlequotes.</h1>

So that's part one. Where's part two?

We look at `history/install.php` and see:

`$solution = '2bda2998d9b0ee197da142a0447f6725';`

That looks like an MD5 hash. Let's try to crack it!

It is the word: "wrong"

And sure enough that's the wrong solution...

But since the title is "repeating history" and we are in a git repo. Let's take a look at 
the history of that file.

Aha! There is a version of that file with:

`$solution = 'NothingHereMoveAlong'`

So our solution is **InDaxInNothingHereMoveAlong**
