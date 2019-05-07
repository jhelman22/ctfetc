# [Basic Injection](https://ctflearn.com/problems/88)

**Difficulty: Easy**

So we got a basic page with a form. It's got a single text input.

Looking at the source for the page, there is a comment:

> Try some names like Hiroki, Noah, Luke

So let's try that...

So "Luke" seems to be the only input that returns something.

Let's test for SQL injection.

`Luke' or 1=1-- `

And just like that we dumped all of the results.

There's the flag!

> th4t_is_why_you_n33d_to_sanitiz3_inputs
