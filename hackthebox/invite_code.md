# [Invite Code](https://www.hackthebox.eu/invite)

So to even get started playing these challenges you have to "hack your way in!"

So we got an input form asking for an invite code. Let's make a dummy request and see what is 
getting passed to and received from the server.

We see the POST. Nothing much interesting there. Maybe this `_token` parameter.

We also see a few javascript files. Let's take a look at some of them.

OK first one I opened was called `inviteapi.min.js`.

It does some sort of "packing" or encoding, but what caught my eye was a pipe separated list of 
javascript variables and functions. Like `makeInviteCode`

So we try `makeInviteCode()` in the console. It makes a web request and gives us back `data` with 
an `enctype` of "ROT13".

`echo "Va beqre gb trarengr gur vaivgr pbqr, znxr n CBFG erdhrfg gb /ncv/vaivgr/trarengr"|tr 'N-ZA-Mn-za-m' 'A-Za-z'`

> In order to generate the invite code, make a POST request to /api/invite/generate

Ok, let's try a POST request without any params.

`curl -X POST https://www.hackthebox.eu/api/invite/generate`

Ok we get some `data` back

> "data":{"code":"WlVNVUEtWFVKREctV09XTFMtSVFBSk0tWlBRTE8=","format":"encoded"}

It says its encode and the trailing "=" makes me believe its Base64. So let's decode it.

> ZUMUA-XUJDG-WOWLS-IQAJM-ZPQLO

And we're in! Time to register and start playing!
