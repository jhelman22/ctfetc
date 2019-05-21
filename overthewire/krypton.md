# [Krypton](http://overthewire.org/wargames/krypton/)

For all levels `ssh krypton[level]@krypton.labs.overthewire.org -p 2222`

## Kyrpton 0

The password for *krypton1* is provided in the description as a base64 encoded string.

> S1JZUFRPTklTR1JFQVQ=

If we just copy this into a Base64 decoder we get the password.

Password for *krypton1*: **KRYPTONISGREAT**

## Krypton 1

**user:** *krypton1*  
**pass:** *KRYPTONISGREAT*

`cd /krypton/krypton1`  
`cat README`

It tells us that the password for *krypton2* is in the file `krypton2` and that it is 
encrypted using ROT13 which just does a mono-alphabetic substitution cipher where the 
alphabet is literally "rotated" 13 characters. So, A encodes to N, C encodes to P, etc.

`cat krypton2 | tr 'N-ZA-Mn-za-m' 'A-Za-z'`

Password for *krypton2*: **ROTTEN**

## Krypton 2

**user:** *krypton2*  
**pass:** *ROTTEN*

`cd /krypton/krypton2`  
`cat README`

So we got a Caesar cipher which is just like the previous level but we don't know how 
many letters to rotate. ROT13 is a specific version of the Caesar where the alphabet is 
rotated 13 letters. Now we don't know and have to figure it out. Fortunately, we have a 
binary called `encrypt` that will encrypt any text file we give it. Obviously if we just encrypt 
the letter "A" we will know how many letters this cipher shifts. Let's do it!

`cd $(mktemp -d)`  
`ln -s /krypton/krypton2/keyfile.dat`  
`chmod 777 .`  
`echo A > a.txt`  
`/krypton/krypton2/encrypt a.txt`  
`cat a.txt`

And we see "A" has been encrypted to "M". That's a shift of 12 characters. So we are 
dealing with a ROT12. We can just tweak our `tr` command from the last level and bam!

`cat /krypton/krypton2/krypton3 | tr 'M-ZA-Lm-za-l' 'A-Za-z'`

Password for *krypton3*: **CAESARISEASY**

## Krypton 3

**user:** *krypton3*  
**pass:** *CAESARISEASY*

`cd /krypton/krypton3`  
`cat README`

So in this one, we know it's another alphabetic substition cipher but we don't have the 
luxury of having the cipher mechanism. Luckily for us though, we have three different text 
files that have been encrypted using the cipher. For those familiar with solving cryptogram 
puzzles. Here we go! I like to use an online tool to help with letter frequencies, etc.

[Cryptogram Solving Tool](http://scottbryce.com/cryptograms/)

Using the contents of `found1` is enough to do a frequency analysis and crack this. Below are 
the substitutions.

> ABCDEFGHIJKLMNOPQRSTUVWXYZ
> QAZWSXEDCRFVTGBYHNUJMIKOLP

So we just put that through our `tr` call and voila!

`cat krypton4 | tr 'QAZWSXEDCRFVTGBYHNUJMIKOLP' 'A-Z'`

Password for *krypton4*: **BRUTE**

## Krypton 4

**user:** *krypton4*  
**pass:** *BRUTE*

`cd /krypton/krypton4`  
`cat README`

So we have a Vigenere Cipher and they have told us that the key length is 6. That 
helps a ton! We should just need to look at the cipher texts in six character blocks 
and be able to figure out the key. So we need to script this out to count character 
occurrences for each position in our six character blocks.

`cd $(mktemp -d)`  
`vi counter.rb`

```ruby
f1 = File.read("/krypton/krypton4/found1")
f2 = File.read("/krypton/krypton4/found2")

counts = 6.times.map{{}}
[f1,f2].each do |ciphertext|
  ciphertext.gsub(" ","").scan(/.{6}/).each do |block|
    block.chars.each_with_index do |c,i|
      counts[i][c] = counts[i][c] ? counts[i][c] + 1 : 1
    end
  end
end
puts counts.map.with_index{|c,i| "#{i}: #{Hash[c.sort_by{|k,v| -v}]}"}.join("\n\n")
```

Now we have the letter frequencies for each position in our six character block.

We see for each position the highest frequency characters are:

> 0: J
> 1: V
> 2: I or X
> 3: O
> 4: I
> 5: C

We know that in English, the letter 'e' is the most common.

So if position 0, 'e' gets replaced with 'j'. Then we know the key starts with the letter 'f'.

e = 4, j = 9 so key[0] = 9 - 4 = 5 = f

We do this math with all the most frequent characters and we get a final key of `FREKEY`

So we can copy the contents of `krypton5` into a Vigenere decoder online (or script your own) using 
`FREKEY` as the key and we get our password.

Password for *krypton5*: **CLEARTEXT**

## Krypton 5

**user:** *krypton5*  
**pass:** *CLEARTEXT*
