# Poor Data Validation

So the client side is preventing us from submitting a negative number, but what if 
we modify the request before it hits the server?

Fire up Burp, intercept the request and change `userdata` to a negative number.

Success!

> temlfX8fZiHUA1w9Cz8D/ohhePQEd+QJvgZheUMYUECINTK1Q4oQFYGzfj1TYxc4ATAFRxb3dValo89/1yLQmzxoJZMd7LgJ4a197aQCD0cdNj3rEjXuiIteEsMDnY8i+Tvgr4BpJIPYRzQ8hflw1Q==
