# [TAKING LS](https://ctflearn.com/problems/103)

**Difficulty: Easy**

Another pretty easy one with a hint in the name of it.

We download the zip file, extract it and look inside. But make sure to look for hidden stuff.

`cd The\ Flag/`  
`ls -a`

There's a PDF file that is password protected. But also...

Yep, there's a hidden directory `.ThePassword`

`cd .ThePassword`  
`cat ThePassword.txt`

And there the's password i'm sure for the PDF.

> Im The Flag

Now open the PDF with that password and there's the flag!

> ABCTF{T3Rm1n4l_is_C00l}

