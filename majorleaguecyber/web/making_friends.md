# [Making Friends](https://training.majorleaguecyber.org/challenges#Making%20Friends)

The problem description lets us know that this site is vulnerable to SQL injection.

There seems to be one endpoint here: `add_friend.php`. Let's just add a normal friend.

So all we get is a flash message that says "We are now friends".

So we imagine this is and `INSERT` statement passing our inputs directly as values into 
some table called `friends`. It probably looks like this:

`INSERT INTO friends (name, description) VALUES ($_POST["name"], $_POST["desc"]);`

So let's see if we can do some injection.

Let's just try using `'` as both inputs. 

Ok... I guess since we caused an error we get the flag.

> flag{g3uss_w3_n0t_fri3nds}
