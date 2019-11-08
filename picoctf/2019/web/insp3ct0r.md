# Insp3ct0r

"Kishor Balan tipped us off that the following code may need inspection: https://2019shell1.picoctf.com/problem/28717/ (link) or http://2019shell1.picoctf.com:28717"

We access the link and get a bland looking site with two tabs with dynamic content. Let's view the source.

We see a comment: `<!-- Html is neat. Anyways have 1/3 of the flag: picoCTF{tru3_d3 -->`

So if we see the text of the "How" tab, he mentions 3 technologies: HTML, CSS, and Javascript.

We found 1/3 of the flag in the HTML source so I bet the second third is in the stylesheets.

So we look into the `mycss.css` stylesheet and see what we expected:

`/* You need CSS to make pretty pages. Here's part 2/3 of the flag: t3ct1ve_0r_ju5t */`

Now the final third should be in the javascript file `myjs.js`

`/* Javascript sure is neat. Anyways part 3/3 of the flag: _lucky?2717d7be} */`

> Flag: picoCTF{tru3_d3t3ct1ve_0r_ju5t_lucky?2717d7be}
