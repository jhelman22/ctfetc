# [Training: Warchall - The Beginning](https://www.wechall.net/challenge/warchall/begins/index.php)

Login with `ssh -p 19198 zumo@warchall.net`

## Level 0

`cat /home/level/0/README.txt`

Solution to *level0*: **bitwarrior**

## Level 1

Just some deep directories lead us to the solution.

`cat /home/level/1/blue/pill/hats/gray/solution/is/SOLUTION.txt`

Solution to *level1*: **LameStartup**

## Level 2

Hidden directories and files...

`cat /home/level/2/.porb/.solution`

Solution to *level2*: **HiddenIsConfig**

## Level 3

`cat /home/level/3/.bash_history`

Solution to *level3*: **RepeatingHistory**

## Level 4

`file level/4/README.txt`

> Regular file with no read permission

`chmod +r level/4/README.txt`  
`cat level/4/README.txt`

Solution to *level4*: **AndIknowchown**

## Level 5

`cat level/5/README.txt`

> Protect your /home/user/zumo/level directory from other users. Then wait 5 minutes.

`chmod go-rx level`

Now waiting...

`cmod +r level/5/solution.txt`  
`cat level/5/solution.txt`

Solution to *level5*: **OhRightThePerms**
