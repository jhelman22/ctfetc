# dont-use-client-side

"Can you break into this super secure portal? https://2019shell1.picoctf.com/problem/21888/ (link) or http://2019shell1.picoctf.com:21888"

A crazy colored form with a single input. Let's check the source.

We see a plain-jane javascript

```javascript
<script type="text/javascript">
  function verify() {
    checkpass = document.getElementById("pass").value;
    split = 4;
    if (checkpass.substring(0, split) == 'pico') {
      if (checkpass.substring(split*6, split*7) == '6a8e') {
        if (checkpass.substring(split, split*2) == 'CTF{') {
         if (checkpass.substring(split*4, split*5) == 'ts_p') {
          if (checkpass.substring(split*3, split*4) == 'lien') {
            if (checkpass.substring(split*5, split*6) == 'lz_5') {
              if (checkpass.substring(split*2, split*3) == 'no_c') {
                if (checkpass.substring(split*7, split*8) == 'b}') {
                  alert("Password Verified")
                  }
                }
              }
      
            }
          }
        }
      }
    }
    else {
      alert("Incorrect password");
    }
    
  }
</script>
```

So this is some obfuscation but at first glance, we can see it is our flag (its just out of order).

So untracing the `substring()` functions we can go one-by-one:

`substring(0,split)` is the first four characters (0-3) of our pass must be "pico" (obviously)

`substring(split*6,split*7)` means chars 24-27 must be "6a8e"

`substring(split,split*2)` means chars 4-7 of our pass must be "CTF{"

`substring(split*4,split*5)` means chars 16-19 of our pass must be "ts_p"

`substring(split*3,split*4)` means chars 12-15 of our pass must be "lien"

`substring(split*5,split*6)` means chars 20-23 of our pass must be "lz_5"

`substring(split*2,split*3)` means chars 8-11 of our pass must be "no_c"

`substring(split*7,split*8)` means chars 28-31 of our pass must be "b}"

> Flag: picoCTF{no_clients_plz_56a8eb}


