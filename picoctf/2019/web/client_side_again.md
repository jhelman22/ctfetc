# Client Side Again

"Can you break into this super secure portal? https://2019shell1.picoctf.com/problem/32255/ (link) or http://2019shell1.picoctf.com:32255"

Another ugly one input form. Let's check the source.

Some super obfuscated javascript...

```javascript
<script type="text/javascript">
  var _0x5a46=['25df2}','_again_b','this','Password\x20Verified','Incorrect\x20password','getElementById','value','substring','picoCTF{','not_this'];(function(_0x4bd822,_0x2bd6f7){var _0xb4bdb3=function(_0x1d68f6){while(--_0x1d68f6){_0x4bd822['push'](_0x4bd822['shift']());}};_0xb4bdb3(++_0x2bd6f7);}(_0x5a46,0x1b3));var _0x4b5b=function(_0x2d8f05,_0x4b81bb){_0x2d8f05=_0x2d8f05-0x0;var _0x4d74cb=_0x5a46[_0x2d8f05];return _0x4d74cb;};function verify(){checkpass=document[_0x4b5b('0x0')]('pass')[_0x4b5b('0x1')];split=0x4;if(checkpass[_0x4b5b('0x2')](0x0,split*0x2)==_0x4b5b('0x3')){if(checkpass[_0x4b5b('0x2')](0x7,0x9)=='{n'){if(checkpass[_0x4b5b('0x2')](split*0x2,split*0x2*0x2)==_0x4b5b('0x4')){if(checkpass[_0x4b5b('0x2')](0x3,0x6)=='oCT'){if(checkpass[_0x4b5b('0x2')](split*0x3*0x2,split*0x4*0x2)==_0x4b5b('0x5')){if(checkpass['substring'](0x6,0xb)=='F{not'){if(checkpass[_0x4b5b('0x2')](split*0x2*0x2,split*0x3*0x2)==_0x4b5b('0x6')){if(checkpass[_0x4b5b('0x2')](0xc,0x10)==_0x4b5b('0x7')){alert(_0x4b5b('0x8'));}}}}}}}}else{alert(_0x4b5b('0x9'));}}
</script>
```

It starts to make more sense if we "pretty" it up a bit.

```javascript
<script type="text/javascript">
var a=[
  '25df2}','_again_b','this','Password\x20Verified','Incorrect\x20password',
  'getElementById','value','substring','picoCTF{','not_this'
];

(function(b,c){
  var d=function(e){
    while(--e){
      b['push'](b['shift']());
    }
  };
  d(++c);
}(a,0x1b3));

var f=function(g,never_used){
  g=g-0x0;
  var h=a[g];
  return h;
};

function verify(){
  checkpass=document[f('0x0')]('pass')[f('0x1')];
  split=0x4;
  if(checkpass[f('0x2')](0x0,split*0x2)==f('0x3')){
    if(checkpass[f('0x2')](0x7,0x9)=='{n'){
      if(checkpass[f('0x2')](split*0x2,split*0x2*0x2)==f('0x4')){
        if(checkpass[f('0x2')](0x3,0x6)=='oCT'){
          if(checkpass[f('0x2')](split*0x3*0x2,split*0x4*0x2)==f('0x5')){
            if(checkpass['substring'](0x6,0xb)=='F{not'){
              if(checkpass[f('0x2')](split*0x2*0x2,split*0x3*0x2)==f('0x6')){
                if(checkpass[f('0x2')](0xc,0x10)==f('0x7')){
                  alert(f('0x8'));
                }
              }
            }
          }
        }
      }
    }
  }else{
    alert(f('0x9'));
  }
}
</script>
```

All i did was add some proper indentation and changed the wild variable/function/param names to single letters.

The first thing we notice is a function that is called automatically after the `a` array is defined. What does it do?

No need to manually trace through it. Just copy the `a` declaration and that function call into an online javascript runner and 
log out the modified `a` variable. We see it now looks like this:

```javascript
var a = [
"getElementById" ,
"value" ,
"substring" ,
"picoCTF{" ,
"not_this" ,
"25df2}" ,
"_again_b" ,
"this" ,
"Password Verified" ,
"Incorrect password"
] 
```

Great! Now we have the correct order of the array to be used by the `verify()` and `f()` functions.

Looking at `verify()` it calls `checkpass[f('0x2)']` a bunch so let's figure out what that piece is.

`checkpass=document[f('0x0')]('pass')[f('0x1')];`

So this translates to: `checkpass=document['getElementById']('pass')['value']`

We already notice that all function `f()` does it get the value at the hex-value index of the array `a`. Obfuscation is stupid...

So `checkpass[f('0x2')]` just means `checkpass['substring']` which if you haven't figured out yet from earlier is equivalent to calling 
`checkpass.substring()`


`checkpass.substring(0x0,split*0x2)==f('0x3')` => Our pass chars 0-7 must be "picoCTF{"
`checkpass.substring(0x7,0x9)=='{n'` => chars 7-8 must be "{n"
`checkpass.substring(split*0x2,split*0x2*0x2)==f('0x4')` => chars 8-15 must be "not_this"
`checkpass.substring(0x3,0x6)=='oCT')` => chars 3-5 must be "oCT"
`checkpass.substring(split*0x3*0x2,split*0x4*0x2)==f('0x5')` => chars 24-31 must be "25df2}"
`checkpass.substring(0x6,0xb)=='F{not')` => chars 6-10 must be "F{not"
`checkpass.substring(split*0x2*0x2,split*0x3*0x2)==f('0x6')` => chars 16-23 must be "_again_b"
`checkpass.substring(0xc,0x10)==f('0x7')` => chars 12-16 must be "this"

> Flag: picoCTF{not_this_again_b25df2}









