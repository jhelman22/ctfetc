# Open to Admins

"This secure website allows users to access the flag only if they are admin and if the time is exactly 1400. https://2019shell1.picoctf.com/problem/21882/ (link) or http://2019shell1.picoctf.com:21882"

So we have to be "admin" and the "time" has to be 1400.

Can we just set cookies with those names?

`document.cookie="admin=True;time=1400"`

And refresh!

> Flag: picoCTF{0p3n_t0_adm1n5_b6ea8359}
