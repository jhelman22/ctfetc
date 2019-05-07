# [Help Bity](https://ctflearn.com/problems/454)

This is another challenge where the description has some clues.

Bity and Noty? Sounds a lot like some bitwise manipulation going on here.

At first I tried doing a logical NOT on all the bits (ie. flip all the bits). 
But this just ended up with more gibberish.

Then, convinced I was on the right path, I looked at the description again.

The description tells us that the first four letters are "CTFL".

Compared to the encoded string, those first letters are only off by one on the ascii table.

So then I tried to just flip the least significant bit of each character.

The ruby code below converts the encoded string to a bit string, then chunks it out into 
8 bit strings (ie. how many bits are used for an ASCII character). Then it just loops 
through all the characters and flips the LSB.

```ruby
puts "BUGMd`sozc0o`sx^0r^`vdr1ld|".unpack("B*").first.scan(/.{8}/).map do |byte| 
  byte[0...-1] + (byte[-1] == '0' ? '1' : '0')
end.join
```

Converting the output of this ruby code to ASCII reveals our flag!

> CTFLearn{b1nary_1s_awes0me}
