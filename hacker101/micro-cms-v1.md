# Micro-CMS v1

**Difficulty: Easy**  
**\# of Flags: 4**

On the first page, we see three links:  
1. `page/1`
  - Two links:  
  1. `edit/1`
    - We got a form presumably edit the page. And yes that's how it works. This 
could be vulnerable.
  2. `../`
    - Goes back to the home page
2. `page/2`
  - Same as page one. But we got an image now and some `<button>` that does nothing?
  1. `edit/2`
    - Another form. Vulnerable?
3. `page/create`
  - Just a blank form to create a new page. Adds it to the list of pages. There is a view 
and edit endpoint at the next available index.

If we try to put `<script>` tags directly in the body, the get filtered and turned into 
`<scrubbed>` tags.

The edit page says markdown is supported but not scripts. But obviously html is supported 
otherwise that `<button>` wouldn't have shown up. Let's change that `<button>` to have an 
`onclick` event to test for XSS.

`<button onclick="alert(1);">`

So clicking the button results in an alert popup. And luckily I had my developer tools open 
and I saw where a `flag` attribute was set on the rendered html.

There's one flag! (3 left)
> ^FLAG^8d1148d5b57a967d220bd8cd1b26cd6bcd95608fcaf9f4ed543a80fa43eb5ebd$FLAG$

So we were able to slip in some javascript in the body. What about the title? It is 
displayed on the home page as the contents of the links. Do `<script>` tags get filtered?

They seem to get `html_encoded` on the actual page view page, but are they properly encoded on the home page? Let's go check.

There's another flag! (2 left)
> ^FLAG^12f7908e35a0553c452ee18b241bc434655aeb5dae859ebd16b11420ab712cc8$FLAG$

When creating this page, we notice that the page *index* was not "3" like we would expect since there was only two other pages created. It was "11". Maybe there are pages at indices 3-10 that we aren't seeing?

`/page/3` Not Found  
`/page/4` Not Found
`/page/5` Forbidden

Well that's interesting, let's try to edit that page

`/page/edit/5`

There's another flag! (1 left)
> ^FLAG^cdd4b74208ee3a0697bb16c846af6b657b8ae3934fbb9e137e7d23bce46563cf$FLAG$

After messing around with the edit/create page forms trying to determine if they were 
vulnerable to SQL injection. I couldn't find any indication that they were. After a little 
break, it occurred to me that I forgot to check one thing.

From my experience as a software engineer, I have built web backends and APIs that follow the 
RESTful architecture. In short, the URL structure is typically built to mimic the CRUD (Create, 
Read, Update, Delete) functionality of a database. That's exactly how these URLs are set up. 

There is some *model* called `page` and the show(ie Read) is at `/page/:id` and the edit is at 
`/page/edit/:id` where `id` is the database id of the page.

Now, at first I thought I would get a flag if I tried to delete a page with `/page/delete/:id` 
or `/page/destroy/:id` but those all returned *404 Not Found*. Then I decided to try SQL 
injection on the URL. Whatever is in `:id` is being passed to some query so let's check if it 
accepts injections.

After trying a couple things, this went through:

`/page/edit/' or 1=1--`

There's the last flag!
> ^FLAG^a5796acd36753d7bcb8fcba36bcacc7f658dff990f538751c63e4c61f36b080c$FLAG$ 



