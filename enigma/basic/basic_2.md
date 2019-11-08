# [Basic 2](http://challenges.enigmagroup.org/basics/pre/2/)

Another login page with an error message displayed at the top for our benefit

"fopen: could not open file '/www/htdocs/challenges/basics/pre/2/dontlookinhere/password.txt';"

So from the error message we can see the sub-directory `/dontlookinhere`

So obviously we go and look

It's a file directory with a single file `password.inc`

Which contains our user/pass combo

> admin:rosebud101z
