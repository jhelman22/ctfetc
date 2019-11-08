# Vault Door 3

"This vault uses for-loops and byte arrays. The source code for this vault is here: VaultDoor3.java"

Looking at the source code. First notice, the password has to be 32 characters.

We notice it's loading up a buffer of 32 bytes with different manipulations of our password.

We are very literally going to reverse this thing starting with the last `for` loop.

Using this as our final result: `jU5t_a_sna_3lpm16g84c_u_4_m0r846`

The last loop starts at the end and takes every second character from our password up until index 17.

Which means this is what are password looks like so far:

index:   0 | 1| 2| 3| 4| 5| 6| 7| 8| 9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31
buffer:   j| U| 5| t| _| a| _| s| n| a| _| 3| l| p| m| 1| 6| g| 8| 4| c| _| u| _| 4| _| m| 0| r| 8| 4|6
password:  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | g|  | 4|  | _|  | _|  | _|  | 0|  | 8|  |6

The next loop up starts at index 16(see previous loops) and sets every other index to whatever is at password[46-index]

So for index 16. That's actually character 30 in our password.

index:   0 | 1| 2| 3| 4| 5| 6| 7| 8| 9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31
buffer:   j| U| 5| t| _| a| _| s| n| a| _| 3| l| p| m| 1| 6| g| 8| 4| c| _| u| _| 4| _| m| 0| r| 8| 4|6
password:  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 4| g| r| 4| m| _| 4| _| u| _| c| 0| 8| 8| 6|6

Two more loops to go. The next loop starts at index 8 and sets the next 8 characters of its buffer to whatever is at password[23-index]

index:   0 | 1| 2| 3| 4| 5| 6| 7| 8| 9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31
buffer:   j| U| 5| t| _| a| _| s| n| a| _| 3| l| p| m| 1| 6| g| 8| 4| c| _| u| _| 4| _| m| 0| r| 8| 4|6
password:  |  |  |  |  |  |  |  | 1| m| p| l| 3| _| a| n| 4| g| r| 4| m| _| 4| _| u| _| c| 0| 8| 8| 6|6

And finally the last(or first) loop does nothing but copy the first 8 characters of the password into buffer so our final table looks like this:

index:   0 | 1| 2| 3| 4| 5| 6| 7| 8| 9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31
buffer:   j| U| 5| t| _| a| _| s| n| a| _| 3| l| p| m| 1| 6| g| 8| 4| c| _| u| _| 4| _| m| 0| r| 8| 4|6
password: j| U| 5| t| _| a| _| s| 1| m| p| l| 3| _| a| n| 4| g| r| 4| m| _| 4| _| u| _| c| 0| 8| 8| 6|6

> Flag: picoCTF{jU5t_a_s1mpl3_an4gr4m_4_u_c08866}
