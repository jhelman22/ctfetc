# [Inj3ction Time](https://ctflearn.com/problems/149)

So from the name and description of this problem, there's gonna be somewhere we can 
do some SQL injection on this site.

We should first take notice of what is returned. There are three fields: Name, Breed, Color.

We pass in database IDs and it spits out the resulting row.

`https://web.ctflearn.com/web8/?id=2`

So first we try the query `1+1` to see if this input is vulnerable. It should return ID 2 or
"Doodle,Poodle,Pink".

And it does. So let's try to dump everything from this table.

Let's try the query `1 or 1=1 --` which should return everything.

Great we got all 3 dogs in the table.

We got to find more interesting tables than dogs. Let's try to UNION with another table.

First we got to find out how many columns is being returned by the dog table query.

I got lucky on my first time b/c like we pointed out there were three fields: Name, Breed, 
and Color. And then I assumed they were also returning the ID. So that's four.

So the query `1 union select null,null,null,null --` should return the first dog and an "empty" 
dog. And it does! Great!

We can assume all the columns besides the first (ie. ID) are strings. So we can use those 
columns to extract some good information. But what SQL database are we working with?

Try the query `1 union select null,@@version,null,null --`. If this returns correctly we got 
ourselves either a Microsoft or a MySQL database.

And we do! So now we know since it's not an Oracle database that it stores information about 
the tables in `information_schema.tables`. Let's see what tables we got.

Try the query `1 union select null,table_name,null,null from information_schema.tables --`

Ok we got a bunch of tables including a suspicious one called `w0w_y0u_f0und_m3`

Let's see what columns that table has. I couldn't get a WHERE statement to go through so I 
just dumped every column from every table. Luckily, there aren't that many tables.

`1 union select null,table_name,column_name,null from information_schema.columns --`

And the table `w0w_y0u_f0und_m3` only has one column `f0und_m3`.

So let's dump that table.

`1 union select null,f0und_m3,null,null from w0w_y0u_f0und_m3 --`

And there's our flag!

> abctf{uni0n_1s_4_gr34t_c0mm4nd}


