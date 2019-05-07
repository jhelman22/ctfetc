# [BINWALK](https://ctflearn.com/problems/108)

**Difficulty: Easy**

Ok so I chased my tail on this one for a little bit...

We get a *.jpeg* file but the problem description says there is a file within the file.

So, we're talking some steganography trickery here.

By looking at the raw contents, I could see at least two *PNG* tags so I knew this was at 
least an image inside of an image.

I tried splitting the file manually and only ended up with corrupted data.

Finally, while researching some steganography techniques, I saw a reference to a tool called 
`binwalk`. This obviously stood out because it's the name of the challenge.

Sure enough running this:

`binwalk PurpleThing.jpeg`

Showed me that there were two PNGs and a zlib compressed file in this one file.

`binwalk -D=".*" PurpleThing.jpeg`

Extracted all the files. And sure enough the second PNG was a picture with our flag!

> ABCTF{b1nw4lk_is_us3ful}
