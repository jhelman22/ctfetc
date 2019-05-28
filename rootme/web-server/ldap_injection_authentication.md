# [LDAP Injection Authentication](https://www.root-me.org/en/Challenges/Web-Server/LDAP-injection-authentication)

LDAP (Lightweight Directory Access Protocol) is a directory service protocol, useful for 
email directories, telephone directories, usernames and passwords, etc. For all intents and 
purposes, it is another way to organize and store data on a server. And much like database 
storage, it has ways of querying and modifying the data stored which means it can be 
vulnerable to injection.

Learning how LDAP injection work is like learning SQLi. You have to know how the queries are 
constructed and what they do. [This](https://www.blackhat.com/presentations/bh-europe-08/Alonso-Parada/Whitepaper/bh-eu-08-alonso-parada-WP.pdf) is a great guide to learn about LDAP filters 
in the context of injection

Basically our login form is passing a filter that looks like this:

`(&(uid=USER)(userPassword=PASS))`

This is equivalent to SQL: `WHERE uid=USER AND userPassword=PASS`

So knowing the structure of filters what if we can bypass the authentication all together?

One thing to know is "\*" is a wildcard to match anything. So what if our filter looked like 
this?

`(&(uid=*)(|(uid=*)(userPassword=anything)))`

This reads:

Authenticate if uid is any uid AND (uid is any uid OR userPassword is anything)

So this will always return TRUE! So let's try this user/pass combo

user: `*)(|(uid=*`  
pass: `anything)`

And we're in!!

Password is: **SWRwehpkTI3Vu2F9DoTJJ0LBO**
