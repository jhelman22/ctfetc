# [What could this be?](https://ctflearn.com/problems/268)

So we download this gibberish looking text file. But having at one point been interested 
in esoteric programming languages, this actually looks a lot like Brainfuck.

After looking at the Wikipedia page though, our text file has characters that aren't used 
by Brainfuck, namely the *!*.

So I was sure this was some sort of derivative. And sure enough at the bottom of the wiki page 
there was a link to JSFuck, which is a derivative that generates Javascript code.

We can execute our code online [here](http://www.jsfuck.com/)

It brings up an alert modal with our flag!

> flag{5uch_j4v4_5crip7_much_w0w}
