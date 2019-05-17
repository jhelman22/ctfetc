# [Training: Programming 1](https://www.wechall.net/challenge/training/programming1/index.php)

I guess you could use programming but some simple curl magic will do the trick!

`curl "https://www.wechall.net/challenge/training/programming1/index.php?answer=$(curl 'https://www.wechall.net/challenge/training/programming1/index.php?action=request' -H 'Cookie: WC=115xxxxx-xxxxx-xxxxxxxxxxxxxxxx')" -H 'Cookie: WC=115xxxxx-xxxxx-xxxxxxxxxxxxxxxx'`

Solved. No password needed.
