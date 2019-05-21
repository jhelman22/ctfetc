# [File Upload](

If we just try to upload a random text file, we see that our 
upload is available at `../../hackable/uploads/our_file`

So we probably have a Local File Inclusion vulnerability. If we upload 
a malicious PHP script, we can execute it on the server.

`<?php echo passthru('cat /etc/passwd'); ?>`

And we go to our upload and voila we can execute system commands!

