# [Backup File](https://www.root-me.org/en/Challenges/Web-Server/Backup-file)

We get a login page. The challenge name has the hint. What if the developer forgot to 
remove the backup file of `index.php`. `~` is a common suffix indicating a backup file. 
So let's go to the URL: `/index.php~`

And looks like we get a download of that file. Open it in a text editor and we see 
the password.

Password is: **OCCY9AcNm1tj**
