# [NoSQL Injection Authentication](https://www.root-me.org/en/Challenges/Web-Server/NoSQL-injection-authentication)

Unlike relational databases, NoSQL typically stores data in JSON format with objects with key/value pairs.

So we can try some of [these nifty JSON comparison operators](https://www.ibm.com/support/knowledgecenter/en/SSEPGG_11.1.0/com.ibm.swg.im.dbclient.json.doc/doc/r0061296.html)

If we try the url: `?login[$ne]=anything&pass[$ne]=anything`

In plain English, log us in where `login` does not equal `anything` and `pass` does not equal 
anything

And sure enough we get logged in as `test`!

But there is some hidden username, obviously not `test`. So let's try something else.

`?login[$lt]=test&pass[$ne]=anything`

This looks for user less than (alphabetically less than) `test`.

And we get logged in as `admin`. Let's try greater than.

`?login[$gt]=test&pass[$ne]=anything`

"Bad username or bad password"

Ok so let's try less than `admin`

`?login[$lt]=admin&pass[$ne]=anything`

"Bad username or bad password"

So obviously the username we are looking for is between `admin` and `test` alphabetically.

Let's combine operators...

`?login[$gt]=admin&login[$lt]=test&pass[$ne]=anything`

Got it! There's our flag!

Flag is: **nosqli_no_secret_4_you**
