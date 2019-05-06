# Petshop Pro

**Difficulty: Easy**  
**\# of Flags: 3**

Ok so on the homepage, we have a couple links  
1. `cart`
  - This is the cart page with a table of products in your cart. And a form to 
`checkout`. Potential for manipulation. Possibly checkout with bad items?
  - Clicking `checkout` just prints a summary page of your order. No other actions here.
2. `static/kitten.jpg` and `static/puppy.jpg`
  - This `static` folder is worth checking out. But it redirects to `127.0.0.1/static`? Strange.
3. `add/0` and `add/1`
  - These look like RESTful links with database IDs. Possible SQLi?

So let's check some low hanging fruit. Specifically, SQLi on the `add` links. Nothing obvious 
working here. Let's move on.

I did notice on the `cart` page. That the selected items in your cart are just being included 
in the form in a hidden field. So we should be able to manipulate item attributes before 
POSTing to the `checkout` page. Can we get these items for free? Let's intercep the request 
with Burp and change the price to 0.

Why yes we can! There's a flag! (2 more to go)
> ^FLAG^dbcbdcddf7bec10477cbe641a73f91797ec3e221ee2bb7c819bc804d095890ec$FLAG$

Let's poke around some common paths to see what we can find. If I hadn't turned up anything 
after a few attempts or if I thought there was more to be found I would have used a tool like 
*dirbuster*.

Aha a login page at `/login`. SQLi maybe?
