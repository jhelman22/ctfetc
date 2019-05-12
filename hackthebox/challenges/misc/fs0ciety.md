# [fs0ciety](https://www.hackthebox.eu/home/challenges/Misc)

So we have a password protected ZIP file. We can probably crack it with John the Ripper.

**NOTE:** Don't make the same mistake I did. The zip you download from the site is NOT the zip 
you are supposed to crack. It's password is "hackthebox" as stated by the download button. The 
actual zip for the challenge is inside that one.

`zip2john fsociety.zip > zip.hashes`  
`john zip.hashes`

That was quick! Our zip file password is `justdoit`

`cat sshcreds_datacenter.txt`

The contents look like Base64 with the trailing "=". So let's decode it.

Aha! We get binary. Let's convert that to ASCII.

And there's our flag!

> if_y0u_c@n_$m3ll_wh@t_th3_r0ck_is_c00king
