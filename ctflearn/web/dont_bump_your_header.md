# [Don't Bump your header](https://ctflearn.com/problems/109)

So we go to the link and it says something along the lines of your user agent is not correct.

Ok but what user agent is it expecting? Let's check the source just in case.

Great there's a comment. Let's trying setting our user agent to this (I just use Chrome 
Dev Tools)

`Sup3rS3cr3tAg3nt`

Ok now we get a message saying we didn't come from `awesomesauce.com`. This is called our 
referrer. Let's change our Referer header. For this I can just copy the request to cURL from 
Chrome Dev Tools. Add the Referer header and make the request.

`curl 'http://165.227.106.113/header.php' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Sup3rS3cr3tAg3nt' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.9' -H 'Referer: awesomesauce.com' --compressed`

And there's our flag!

> flag{did_this_m3ss_with_y0ur_h34d}
