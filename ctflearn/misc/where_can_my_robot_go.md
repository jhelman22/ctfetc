# [Where can my robot go?](https://ctflearn.com/problems/107)

**Difficulty: Easy**

> Hint 1: Where do robots find what pages are on a website?

Well that's simple... *robots.txt*

> Hint 2: What does disallow tell a robot?

Tells it not to crawl/index that page.

> Hint 3: The flag is not 70r3hnanldfspufdsoifnlds

Hmmm... so we probably got to look at some *robots.txt* file but what website? Honestly, I had 
no idea they meant `ctflearn.com/robots.txt` until I googled the 70r3.. string from hint 3.

Then we just went to `https://ctflearn.com/70r3hnanldfspufdsoifnlds.html`

And there's the flag!

> CTFlearn{r0b0ts_4r3_th3_futur3}
