# Vault Door 4

"This vault uses ASCII encoding for the password. The source code for this vault is here: VaultDoor4.java"

Looking at the source code, the password is just encoded using a couple of different bases.

It looks like the first 8 are in decimal.

The second 8 in hex.

The third 8 in octal.

And the last 8 just in plain ascii.

So just take each set of characters over to converter.

106,85,53,116,95,52,95,98 => "jU5t_4_b"

0x55,0x6e,0x43,0x68,0x5f,0x30,0x66,0x5f => "UnCh_0f_"

0142,0131,0164,063,0163,0137,070,060 => "bYt3s_80"

'f','8','e','1','e','0','4','7' => "f8e1e047"

> Flag: picoCTF{jU5t_4_bUnCh_0f_bYt3s_80f8e1e047}
