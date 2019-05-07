# [Lazy Game Challenge](https://ctflearn.com/problems/691)

**Difficulty: Easy**

Apparently there is some betting game and we need to somehow beat it to win $1,000,000.

`nc thekidofarcrania.com 10001`

So after playing the game for awhile, I started to think about how something simple like 
a number guessing game is implemented. We are particularly interested in how our balance 
gets updated at the end of the game.

```
if you guess wrong ten times
  current_balance = current_balance - bet
else
  current_balance = current_balance + bet
```

Or something like that. So the code does have some logic that doesn't allow me to bet beyond 
my current balance. But what about a negative bet? If my pseudocode is correct and there is 
nothing checking to make sure I make a positive bet, I could lose the game and then my 
negative bet would be subtracted from my current balance. And going back to elementary school, 
what happens when we subtract a negative number? Yep two negatives make a positive!

So let's bet *-1000000* and guess *11* each time to make sure we lose.

And yessir! There's the flag!

> CTFlearn{d9029a08c55b936cbc9a30_i_wish_real_betting_games_were_like_this!}
