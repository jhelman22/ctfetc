# [Microcorruption](https://microcorruption.com)

## New Orleans

Looking at the disassembled `main` function, we see a call to `create_password`. 
If we set a breakpoint there, we can step through that function. It just writes a 
string to the memory address in *r15* (which is 2400). If we look at the memory dump at 
address 2400 as we step through the `create_password` function. We see the password being 
written into memory.

Password: **l{f4hTQ**

## Sydney


