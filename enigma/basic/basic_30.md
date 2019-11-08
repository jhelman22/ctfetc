# [Basic 30](http://challenges.enigmagroup.org/basics/vm/1/)

For our own benefit, we get to see an error message.

Failed to load some file but the real interesting part is here: `main(pages/$page)`

The PHP script is trying to load whatever is in the `$page` variable from the directory `pages/`

So let's go directly there!

We get a file directory with two txt files. Let's check them out.

Nothing useful in there but we do get to see the structure of the page requesting

`index.php?page=contact.txt`

So can we change `page=` to be anything we want? (aka. Local File Inclusion)

If you click the "login" link on the page, you see that the admin panel is protected by an 
htaccess login prompt. And the link is just an `href='admin'` which means that the admin panel 
lives at `admin/index.php`. So let's see if we can see the `.htaccess` file.

`index.php?page=../admin/.htaccess`

This backs us up one directory out of `pages/`, then down to `admin/` and finally read the `.htaccess` file.

Great! We see the `AuthUserFile` is `.htpasswd`

`index.php?page=../admin/.htpasswd`

Got it! Our user/pass combo is: admin:dXWxIS6i6irN6

But it doesn't work... The password must be encrypted but it's not MD5. What is it?

Doesn't really matter using a tool like John the Ripper. So we'll throw the hash into a text file and crack it.

`john mypassword`

We got it!

> admin:dog
