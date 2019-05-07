# [QR Code](https://ctflearn.com/problems/228)

**Difficulty: Easy**

So we're given a QR code. Let's decode this thing online.

`https://zxing.org/w/decode.jspx`

> c3ludCB2ZiA6IGEwX29icWxfczBldHJnX2RlX3BicXI=

Ok that looks like a Base64 string so let's decode that

> synt vf : a0_obql_s0etrg_de_pbqr

Ok I tried to submit just that but no luck... this is jibberish but it looks like a flag. Maybe 
it needs to be decoded one more time. What do you know?! It's ROT13.

> flag is : n0_body_f0rget_qr_code

And there's the flag!

> n0_body_f0rget_qr_code

