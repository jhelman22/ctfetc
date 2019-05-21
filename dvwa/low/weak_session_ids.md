# [Weak Session IDs](localhost/vulnerabilities/weak_id/)

I at first thought that these tasks would be about changing our session ids so 
that the application thought we were another user but it seems that we just have 
to figure out the "pattern"

On low security this is simple. The session ids are just an auto-incremented id.

So if this was a real application, we could just cycle through integers until we 
were recognized as the user we want to impersonate.
