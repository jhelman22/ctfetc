# [Directory Traversal](https://www.root-me.org/en/Challenges/Web-Server/Directory-traversal)

We got to find the hidden section of the photo gallery. If we click on any of the category 
links we see the url as `?galerie=category`

Let's try the url `?galerie=../`

Ok we get two things listed: "galerie" and "ch15.php"

So we can move up another directory with `?galerie=../../`

That puts us out of range of this challenge so we get an error. Let's see if we can list 
all the files and directories in `galerie` with `?galerie=./`

Aha we see a hidden directory: `86hwnX2r/`. Let's go there: `?galerie=86hwnX2r`

We get two images and a `password.txt` file. `?galerie=86hwnX2r/password.txt`

That gives us an error but what if we just go to `/galerie/86hwnX2r/password.txt`

Password is: **kcb$!Bx@v4Gs9Ez**
