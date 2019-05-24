# Broken Session Management

We have to trick the server into thinking we have completed the lesson when we click on the 
"Complete This Lesson" button.

Since session ids are stored in cookies, we look there.

We see a cookie: "lessonComplete=lessonNotComplete"

Let's change that:

`document.cookie="lessonComplete=lessonComplete"`

And click the button again. Success!

> rh+45B0iD5jMORpJ4pth7olDcRDWG2LkAQLrBmewQjLFJaKPMWclbnR1/rpc9Jsd3Z3tttvLA5uHQhQrexnApjB0jtLhqZAO4EqE3QS396Y=
