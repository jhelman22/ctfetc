# Empire 1

"Psst, Agent 513, now that you're an employee of Evil Empire Co., try to get their secrets off the company website. https://2019shell1.picoctf.com/problem/4155/ (link) Can you first find the secret code they assigned to you? or http://2019shell1.picoctf.com:4155"

Basic site with a homepage, a register page, and a login page.

Let's register a new user and login.

Ok so we got more stuff going on with this site. We got a todo list, a place to add todos (could be vulnerable), and an employee directory.

Looking at the employee directory we got two usernames: jarrett.booz and danny.tunitis

Those may be useful later. Let's add a test todo and see that it displays it in our list of todos.

It does. So maybe some XSS? Let's try creating a todo with this: `<script>alert(1);</script>`

Nah... just displays it on our side. Our stuff is getting html encoded. There may be a bypass? Let's leave it for now.

What about some SQL injection here instead of XSS? Let's try to break it with a single quote.

Aha! Internal server error.

Being that it is probably an insert statement, we need to be able to add things from other tables to this field.

Let's see if we can use concatenation: `does concat '||'work`

Check our Todos and yes!

So we got to try some random table names till we get it right. Finally this worked.

`user_id: '||(select id from user)||'!`

Now we got to guess what the column name of our secret code is. We finally find it with:

`secret:'||(select secret from user)||'`

"Likes Oreos." What the hell does that mean?

That's somebody else's secret. I need MY SECRET. We know my id is 3 from the employee listing so...

`secret: '||(select secret from user where id=3)||'`

Got it!

> Flag: picoCTF{wh00t_it_a_sql_injectd75ebff4} 
