# H1 Thermostat

**Difficulty: Easy**  
**\# of Flags: 2**

So this challenge is an Android APK file. So I downloaded it on my phone just to run it and 
see what it looks like.

It's a pretty neat GUI of a thermostat. Not much else to say. Time to figure out how we can 
modify it's behavior. I can probably decompile this thing.

Using [JavaDecompilers.com](http://www.javadecompilers.com), we just decompiled the whole 
application and found both flags sitting in a class called `PayloadRequest.java`

From the looks of it, we probably were supposed to pull the flags from some communication 
the app was doing with the server. But oh well, a flag is a flag..

> ^FLAG^7122a52302e8ddfdad0c62a8a06c1f1d96db704e8e02a4003eeced64106f9bff$FLAG$

> ^FLAG^df88ab3e0c58f76daa71c15483f13b19b66287c813f702d101d880eebe3f30c7$FLAG$
