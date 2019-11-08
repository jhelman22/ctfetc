# Irish Name Repo 1

"There is a website running at https://2019shell1.picoctf.com/problem/27383/ (link) or http://2019shell1.picoctf.com:27383. Do you think you can log us in? Try to see if you can login!"

Get a paginated website with pictures and names of Irish people? Let's view source.

We see a folder called `/irish` where pictures are stored. Let's check there real quick.

No luck...

Let's explore the menu. So we see a "Support" and "Admin Login" link. Let's look at "Support"

Nothing interesting...

On to the login page. Maybe so SQLi going on? Let's try to cause an error by putting a single quote for the user.

No error message but something definitely broke. So let's try to bypass the login with `' or 1=1-- ` as the user.

That worked! We are logged in.

> Flag: picoCTF{s0m3_SQL_1fe77718}
