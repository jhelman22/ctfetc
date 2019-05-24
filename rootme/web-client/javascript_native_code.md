# [Javascript Native Code](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Native-code)

If we view the source we see a bunch of crazy characters...

It looks like some esoteric programming language. A quick search for esoteric javascript 
returns "JSFuck". If we copy this into an online interpreter, we see that's exactly what this 
is. But now we got to decode it...

Head over [here](https://enkhee-osiris.github.io/Decoder-JSFuck/)

Copy in the code and click "Decode". Crap it gives us the popup.

Delete the the last `()` which is causing the code to be evaluated. Now you get plain 
javascript.

```javascript
function anonymous(){
a=prompt('Entrez le mot de passe');if(a=='toto123lol'){alert('bravo');}else{alert('fail...');}
}
```

Password is: **toto123lol**
