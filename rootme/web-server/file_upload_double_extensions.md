# [File Upload: Double Extensions](https://www.root-me.org/en/Challenges/Web-Server/File-upload-double-extensions)

We got a photo gallery app with links to different categories. And an upload feature so we 
can upload our own photo. Since the title of the challenge is "file upload", we are gonna 
focus our efforts here. (And the challenge description tells us we need to upload PHP and 
read the contents of `.passwd` in the root of the application)

Let's first upload a test image file.

Success! And we see that it is stored here:

`./galerie/upload/tfgelkk8n2laoi2e7cqpnc6cv2/image.png`

So this reaks of LFI (Local File Inclusion). Can we upload any type of file? Maybe a malicious 
PHP script that contains this:

`<?php echo readfile(".passwd"); ?>`

We get "Wrong file extension!". So maybe the script is whitelisting certain file extensions.

Well from past experience, that sort of filtering is usually susceptible to null byte injection.

So let's rename our script to `evil.php%00.png`

This should pass the filter but when we go to the file, the browser will execute it as PHP and 
ignore anything after the null byte.

And success! Click the link to our file.

Hmmm... we get a 400 Bad Request error. Ohhh the `.passwd` file is in the **root** of the 
application and our script is getting run from `/galerie/upload/blahblah/`. We need to change 
the path in our `readfile()` function.

`<?php echo readfile("../../../.passwd"); ?>`

Now reupload. More errors. This took some debugging but I finally figured out that the 
null byte (as clever as it was) seemed to be causing the issue. Although I'm still not sure 
why...

Renaming the file to `evil.php.png` made everything work.

Password is: **Gg9LRz-hWSxqqUKd77-_q-6G8**
