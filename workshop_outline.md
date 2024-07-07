**The use of the Linux terminal. Potential date 07/12/2024 at 12pm – 2pm**

Topics to teach (not in order):

a.	How to open a terminal in Windows and OSX
    OSX:
    In Finder, go to Applications > Utilities > Terminal.app
```
ssh $USER@biowulf.nih.gov
```

    WINDOWS:
```
ssh $USER@biowulf.nih.gov
```

Once in biowulf, run the following command to login into an interactive server within biowulf:
```
sinteractive
```    

b.	File permissions, how to change permissions (chmod).


c.	How to see the content of a text file (more, less, vim, gvim?, others?)
d.	How to see the first lines (head) or last lines (tail) of a file
e.	How to see the content of a directory, navigate along a directory tree and create a folder (ls, ls -l, cd, mkdir) or find out the current working directory (pwd).

```
>ls
>ls -l
>ls -a
>ls -l -t
>ls -l -r -t
>ls -lrt
>ls -lrth
```

    # For a directory structure like this "/home/user/one/two/three" where we are in the folder "one":

```
>pwd
/home/usr/one
>cd /home/usr/one/two
>pwd
/home/usr/one/two
>cd ../..
>pwd
/home/usr
>cd -
>pwd
/home/usr/one/two
```

f.	How to create a text file (vim, cat, touch)
g.	How to rename/move/copy/delete a file (mv, cp, rm).
h.	How to create a file shortcut (ln -s).
i.	How to print a message (echo).
j.	How to redirect the output of a command to a file (“>”).
k.	How to find help for linux commands (man) and scripts/programs (-h --help -help).
l.	How to execute a linux command (importance of upper/lowercase distinction, parameters). 
        Example “command --my_parameter -m --MY_PARAM value -M value file”
m.	File name extensions (.sh .py .pl .r)
n.	Hidden files (.name)
o.	How to (un)compress a file (gzip, bzip, zip)
p.	How to (un)compress an entire directory (tar)
q.	How to print out a particular column from a table in a text file (cut).
r.	How to retrieve a file from the web (wget, curl).
s.	How to create customized linux commands (alias)
t.	How to define a variable
u.	How to define an environmental variable (export).
v.	How to stablish a secure connection to a server (ssh).
w.	How to concatenate linux commands (“|”).
x.	How to search specific text in a group of files (grep).
y.	How to replace a text in a text file (sed).
z.	How to sort a file base on a specified field or column (sort).
aa.	How to count characters, words or lines in a text file (wc).
bb.	How to count number of instances of keys/words in a file (uniq -c).
cc. How to find out what program we are using (which).
dd. What directories is Linux looking for commands/programs? The PATH environmental variable.
ee. How to use programs installed in Biowulf?
ff. Use of conda for installing software?
gg. Redirecting the error output to a file 
hh. Writing a Linux script
ii. Running a Linux batch script in biowulf using sbatch or swarm
jj. Current directory and previous directory (".", "..").
kk. Find files/directories and execute commands on them (find).   
