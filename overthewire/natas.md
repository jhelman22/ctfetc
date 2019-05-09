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













