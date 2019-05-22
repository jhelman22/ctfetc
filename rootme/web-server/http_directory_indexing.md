# [HTTP Directory Indexing](https://www.root-me.org/en/Challenges/Web-Server/HTTP-directory-indexing)

We get an empty page. If we look at the source we see a comment with:

`include(admin/pass.html)`

Let's go there! We got "rick rolled"? Ok... Pretty sure that's not what that joke means but 
moving on.

Let's see if we just see all of `/admin`

And yep we get a file browser and a `/backup` folder with `admin.txt`

Password is: **LINUX**
