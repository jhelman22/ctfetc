# [Audio Edit](https://web.ctflearn.com/audioedit)

We got a site where we can upload an audio file. My first thought is 
that there is a Local File Inclusion vulnerability.

Let's check out the upload form. It says "Upload a valid .mp3 file"

So we can assume they have some checks on the backend to make sure we 
are uploading ".mp3" and not something else like a malicious PHP script.

Let's try just uploading a text file with the extension ".mp3"

We get: "Invalid file format"

So the backend is probably using the php function `mime_content_type()` to 
check what kind of file we uploaded. This function checks for a file signature.

You can see a [list of all file signatures here](https://en.wikipedia.org/wiki/List_of_file_signatures) but basically it checks the first few bytes of a file for the signature.

So in our case an MP3 file must start with the bytes "FF FB" or "ÿû" in ASCII.

So let's change our file to have those characters first and re-upload.

That doesn't work either so maybe it's checking for ID3 tags. In this case, it'll be 
easiest to just download a really small mp3 file and edit that.

Hmmm... if we upload a valid, untampered mp3 file. We get: "File already exists!"

Well we just happened to get really unlucky that the test file we downloaded was already 
uploaded to this app...

When I just added random text inside of our file and reuploaded it worked and we were 
taken to a page where we could listen to the file, edit pitch, etc.

`edit.php?file=hashed_filename.mp3`

So if we can get our file to evaluate as PHP then we will be in business.

So let's try to stuff some evil PHP code in there. 

`<?php echo system('ls'); ?>`

But that's not all. We got to get the browser to execute it as PHP and not MP3.

Let's change the filename to `evil.php%00.mp3`

That's a null byte character and should cause the browser to ignore anything after `.php`

Let's try to reupload it now.

Hmmm... that didn't work. We can't seem to control the file extension by the time it is 
retrieved by `edit.php?file=`

However, I did just notice the "Author" and "Title" on the edit page. Maybe we can do some 
injections in the metadata of the mp3 file. First let's edit the tags and confirm they show up 
when uploaded. And they do! So let's try some injecting.

We can imagine the SQL statement looks something like this:

`INSERT INTO table (..., author, title, ...) VALUES (..., file.title, file.author);`

Where `file.author` and `file.title` are just however it extracts metadata for those two fields.

So we can do subselects in an `INSERT INTO` statement. What if we could get the query to 
look like this?

`INSERT INTO table (...,author,tile,...) VALUES (...,file.title,(SELECT version()));`

Let's try setting our mp3 author metadata to: `(SELECT @@version))-- -`

(NOTE: The extra hyphen is just so our tag editor doesn't strip the necessary whitespace 
after the comment `-- `)

Hmm.. it doesn't actually execute the query. Probably because the developer surrounded 
the extracted metadata in single quotes. Let's end the quotes and concat our version.

`',(SELECT @@version))-- -`

Great! We got a version: `5.5.58-0ubuntu0.14.04.1`

Let's see how many tables there are:

`',(SELECT COUNT(*) FROM information_schema.tables))-- -`

Ok there are 41. That's a lot to iterate through. Luckily there is a handy little 
MySQL function called `GROUP_CONCAT` which will return results as single string.

`',(SELECT GROUP_CONCAT(table_name) FROM information_schema.tables))-- -`

Unfornutately the result is limited to a certain length, so we can only see a partial list 
of about 10. But the ones we do see are all caps which are system tables. The table we are 
interested in is probably all lowercase. So we can use the `ASCII` function to check for 
the first character being greater than or equal to 97 is 'a' knowing that 'A'-'Z' are lower in the ascii 
table.

`',(SELECT GROUP_CONCAT(table_name) FROM information_schema.tables WHERE ASCII(table_name) > 96))-- -`

And we get a single table: `audioedit`

So let's list the columns

`',(SELECT GROUP_CONCAT(column_name) FROM information_schema.columns WHERE table_name='audioedit'))-- -`

Four columns: id, file, author, title

Let's see every title first:

`',(SELECT GROUP_CONCAT(title) FROM audioedit))-- -`

Error? Oh crap you can't select from a table that you are inserting into... Well we can use 
an alias to get around that.

`',(SELECT GROUP_CONCAT(a.title) FROM audioedit as a))-- -`

We see a title: `flag`

So the flag must be the author:

`',(SELECT a.author FROM audioedit as a WHERE a.title='flag'))-- -`

No... the author is just `ABCTF`. Well it's got to be in this record and the only other column 
is the `file` column so lets get that...

`',(SELECT a.file FROM audioedit as a WHERE a.title='flag'))-- -`

Aha! The file is: `supersecretflagf1le.mp3`

So let's change our url to `?file=supersecretflagf1le.mp3`

What the hell? There's nothing here but an awful sounding file. What if we change the 
visualization to sonogram?

There it is!!! Now that's pretty damn cool.

> ABCTF{m3t4_inj3cti00n}
