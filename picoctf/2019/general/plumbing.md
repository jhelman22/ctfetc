# Plumbing

"Sometimes you need to handle process data outside of a file. Can you find a way to keep the output from this program and search for the flag? Connect to 2019shell1.picoctf.com 63345."

If you just `nc 2019shell1.picoctf.com 63345`

You'll see a bunch of text being returned and we don't want to scroll through to find the flag so we can pipe the output to `grep`

`nc 2019shell1.picoctf.com 63345 | grep picoCTF`

> Flag: picoCTF{digital_plumb3r_4e7a5813}
