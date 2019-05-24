# SQL Injection 1

We got an email search form. Let's try the obvious and list all emails.

`' or 1=1-- `

> Search Error: Invalid email address submitted

There is probably some client side validation to see if the input is of the 
correct format. No problem, fire up Burp and try the request manually.

Nope. The validation must be happening server side.

Let's try: `test' or 1=1-- @test.com`

No dice. If the PHP is using `filter_var()` to validate if our input we have some 
flexibility about what consistutes a valid email address.

Try this: `'  or 1=1-- <fake@fake.com>`

Success!

> f62abebf5658a6a44c5c9babc7865110c62f5ecd9d0a7052db48c4dbee0200e3
