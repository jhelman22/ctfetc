# [Basic 32](http://challenges.enigmagroup.org/basics/vm/3/)

We get a basic site with three nav links and a URL that updates the content based on 
the GET parameter `page`. So maybe we can change that variable to get access to something 
we shouldn't have access to.

We could try to guess some common file names/paths/etc. Or use a scanner to do it.

We could also just test for Remote File Inclusion by passing a url to the `page` parameter.

`index.php?page=http://www.google.com`

We passed? I guess that was all we had to do was prove there was an RFI vulnerability.
