# Failure to Restrict URL Access

So we are given the hint that some links are only visible to administrators.

Well if we look at the source we see a hidden div.

`<a href="adminOnly/resultKey.jsp">Administrator Result Page</a>`

We can remove the style "display:none;" and we see the link to click. And we get 
the result key.

> NOrk+ObCG8N0HEn+LyvAeHMgV+or3d2+/0su43LuvdSVrlUHd2lSsAhCoNwDoO9DaMm0sGtpL0KD0yfWrn4KdFkaxkUSAiIBhuWcnl2lpk4=
