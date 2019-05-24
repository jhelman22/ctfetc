# [Command Injection](http://localhost/vulnerabilities/exec/)

So we have an input box where we can enter a hostname to `ping`.  
If we enter "www.google.com", we see output of what looks like the 
actual `ping` console command.

So our input may be being passed directly to the `ping` command in a 
PHP `passthru` without any sanitation.

Can we terminate the ping command and run another command?

Let's try: `www.google.com;cat /etc/passwd`

And yep we get the contents of the `/etc/passwd` after the output of the 
`ping` command. So this is vulnerable to command injection!

Proof is good enough for now. We may use this for privelege escalation later.
