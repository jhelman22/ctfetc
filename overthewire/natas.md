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
















