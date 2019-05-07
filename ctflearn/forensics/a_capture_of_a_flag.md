# [A Capture of a Flag](https://ctflearn.com/problems/356)

So we download the `pcap` file, which is a packet capture file and look at in Wireshark.

We find one interesting GET request to `www.hazzy.co.uk`

If we go there in the browser we got a directory with some interesting files. Particularly 
at `/TXT/ctf_learn_watermark.txt`.

I have downloaded it and see that it is encoded with UTF16 Little Endian.

I tried converting it to UTF-8 but that didn't help.

I am stuck at this point. I'm 90% sure I'm in the right place and I'm just missing something 
obvious. Leaving this incomplete for now...

> NOT FOUND
