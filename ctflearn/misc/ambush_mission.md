# [Ambush Mission](https://ctflearn.com/problems/274)

So we got an image. Nothing turns up with EXIF. So going off past experience with 
steganography challenges, sometimes playing the color levels can reveal hidden text.

After using GIMP's Auto Equalize feature, I saw this Base64 string.

> ==QTh9lMx8Fd08VZt9FdFNTb

I knew it was Base64 because of the double equals sign. But trying to decode it turned up 
gibberish. So I wanted to confirm that I was right and looked up Base64.

It turns out that the double equals is at the *end* of a Base64 string. So this thing is 
backwards.

> bTNFdF9tZV80dF8xMl9hTQ==

Decoding this reveals our flag!

> m3Et_me_4t_12_aM
