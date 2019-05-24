# [File Upload Zip](https://www.root-me.org/en/Challenges/Web-Server/File-upload-ZIP)

A quick search on Google returns all kinds of vulnerabilities in zip uploads.

I tried directory traversal within file names to no avail.

And then I came across [this](https://josipfranjkovic.blogspot.com/2014/12/reading-local-files-from-facebooks.html)

So i created a symlink

`ln -s ../../../index.php link`

Then I zipped up that symlink and preserved the symlinks

`zip --symlinks evil.zip link`

And uploaded our `evil.zip`. When I click on our `link` file. It is a symbolic link to 
`../../../index.php` and I can read the source!

Flag is: **N3v3r_7rU5T_u5Er_1npU7**
