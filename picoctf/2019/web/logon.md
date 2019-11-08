# Logon

"The factory is hiding things from all of its users. Can you login as logon and find what they've been looking at? https://2019shell1.picoctf.com/problem/45163/ (link) or http://2019shell1.picoctf.com:45163"

Oh fancy. We get a clean Bootstrap styled login form. Let's check the source.

Nothing too interesting. Let's submit the empty form.

We logged in but no flag. Let's look at the cookies.

We see a cookie called `admin` set to `False`

Let's set it to `True` and refresh!

> Flag: picoCTF{th3_c0nsp1r4cy_l1v3s_6679fcb5}
