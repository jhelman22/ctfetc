# [Javascript Obfuscation 1](https://www.root-me.org/en/Challenges/Web-Client/Javascript-Obfuscation-1)

We look at the source and see the pass has been `escaped()`

We can just take this pass over to jsfiddle and:

```javascript
pass = '%63%70%61%73%62%69%65%6e%64%75%72%70%61%73%73%77%6f%72%64';
console.log(unescape(pass));
```

Password is: **cpasbiendurpassword**
