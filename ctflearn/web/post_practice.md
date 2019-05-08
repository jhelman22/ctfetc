# [Post Practice](https://ctflearn.com/problems/114)

So if we go to the link it says we need to POST some data.

Let's `curl` this address and see what it returns.

`curl http://165.227.106.113/post.php`

Ok we have a username and password in a comment and we need to POST this data. Let's 
modify our `curl` request.

`curl -d 'username=admin&password=71urlkufpsdnlkadsf' -X POST http://165.227.106.113/post.php`

And there's our flag!

> flag{p0st_d4t4_4ll_d4y}
