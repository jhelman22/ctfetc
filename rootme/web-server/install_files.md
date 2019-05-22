# [Install Files](https://www.root-me.org/en/Challenges/Web-Server/Install-files)

A blank page? Well if we look at the source we see a comment: `/web-serveur/ch6/phpbb`

So we go there and still blank but more html.

phpBB is open source forum software that has been riddled with all kinds of vulnerabilities 
in the past. Using the challenge title as a hint. Let's see if the developer forgot to 
delete the `/install` folder

`/phpbb/install`

We get a file browser with a single file `install.php`. Let's read that.

And there's our password!

Password is: **karambar**
