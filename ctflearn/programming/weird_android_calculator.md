# [Weird Android Calculator](https://ctflearn.com/problems/290)

So we actually have an APK file. I do have an android phone so I could install it and poke 
around but I imagine it will be quicker to just decompile this thing and poke around the 
source code.

You can use an online apk decompiler like [this](http://www.javadecompilers.com/apk)

Sure enough there is some interesting code in the `Parser.java` class.

There is a section of the code that takes an array of integers, XORs them with 1337 and then 
outputs them. I bet that's the flag.

So I can just do the same thing with a quick ruby one-liner.

```ruby
[1407, 1397, 1400, 1406, 1346, 1400, 1385, 1394, 1382, 1293, 1367, 1368, 1365, 1344, 1354, 1288, 1354, 1382, 1288, 1354, 1382, 1355, 1293, 1357, 1361, 1290, 1355, 1382, 1290, 1368, 1354, 1344, 1382, 1288, 1354, 1367, 1357, 1382, 1288, 1357, 1348].map{|i| (i ^ 1337).chr}.join
```

There might have been a different way to do this but whatever there's our flag!

> FLAG{APK_4nalys1s_1s_r4th3r_3asy_1snt_1t}
