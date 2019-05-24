# [File Inclusion](http://localhost/vulnerabilities/fi/?page=include.php)

So we have three links that when clicking them show us that we 
have a GET parameter called `page` that is just taking a file name and 
displaying it.

Textbook file inclusion vulnerability.

Try `?page=/etc/passwd`

As you can see at the top of the page we have read the contents of `passwd`.

Proof is enough for now.
