# [HTTP Post](https://www.root-me.org/en/Challenges/Web-Server/HTTP-POST)

We get "game" with a single button "Give a try!". When we click the button, it just 
generates a random score that will always be less than the high score.

If we look at the source, we can see our score is being generated:

`document.getElementsByName('score')[0].value = Math.floor(Math.random() * 1000001)`

And then that is being included in the POST request. So there are actually two ways to 
complete this. The intended way, given the name of the challenge, was to modify the POST 
request so that you send a higher score.

Or, since the score is generated client-side via javascript. We can just modify the javascript 
before clicking the button. Or even simpler, remove the javascript and set the value 
of the hidden score field manually. Either way works!

Flage is: **H7tp_h4s_N0_s3Cr37S_F0r_y0U**
