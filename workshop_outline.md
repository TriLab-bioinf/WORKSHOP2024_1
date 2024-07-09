# Introduction to Linux and the Linux terminal

First, some definitions:

*What is Linux?*

Linux is a free and open-source operating system (OS) that manages a computer's hardware and resources, like memory, storage, and CPU. It's similar to other operating systems like Windows, macOS, and iOS.

*What is a Shell?*

A shell is a program that takes commands from the keyboard and gives them to the operating system to perform. Most common Linux shells are *bash*, *csh* and *zsh*. In Biowulf you will be using *bash* by default, but 

*What is a Terminal?*

A Terminal is a program that opens a window and lets you interact with the shell. 

*Linux directory structure*

Linux directories are organized as a tree, where the root of the tree is named "/". Most branches of the tree require special permissions for you to be able to read their contents, to modify/create/delete a file or to execute a script or command stored in them. By default, you are assigned a working directory named "/home/$USER", where $USER represents your NIH user name. Within your home directory, you have all the permissions required to create, modify or execute any file or program that is stored in it. 


![](https://linuxhandbook.com/content/images/2020/06/linux-directory-structure.png)

*Figure 1. Reference: [The Linux Handbook](https://linuxhandbook.com/linux-directory-structure/)*

So the full path to the directory "share" from Fig. 1 above would be: "/usr/share/" which actually represents the path from root -> usr -> share.

## a.	How to open a terminal in Windows and MacOSX

*MacOSX:*
In Finder, go to Applications > Utilities > Terminal.app

*WINDOWS:*
XXXXXXXXXXXXXXXXXXXX 
**(Yuejun, could you please add the steps to open a Terminal in Windows and login into Biowulf? )**

## b. Login into Biowulf and download the workshop's guide

Biowulf is a cluster ro grid of High Performance Computing workstations/computers. Each workstation is called a "node". When you login into the Biowulf cluster, you always login to a special node/computer called the login node and whose name is "biowulf.nih.gov".

In the terminal, type the following command to login into Biowulf. 
```
ssh $USER@biowulf.nih.gov
```
Type your NIH password and press "return".

Once in Biowulf, run the "echo" Linux command to print out a message into the terminal (Lines starting with the "#' symbol are comments and therefore, they will be ignored by the shell):
```
# Print Hello World!
echo Hello World!
```

Now type the same command but using all upper cases:
```
# Print Hello World!
ECHO Hello World!
```
What happened with the command above?

Now type the command "hostname" to find out the name of the node you are logged in:
```
# This should print "biowulf.nih.gov"
hostname
```

## c.	How to list the content of the current directory (ls), navigate along a directory tree (cd), create a folder (mkdir) or find out what is the current working directory (pwd).

Find out the name of your current working directory with the command "pwd" (print working directory) like so:
```
pwd
```
Let's find out the content of your current directory with the "ls" command:
```
ls
```

Let's find out the content of the root directory "/":
```
# ls + <SPACE> + /
ls /
```
The behaviour of Linux commands can be modified by adding one or more parameters to the command. Parameters are usually defined by the "-" symbol followed by a letter (e.g. -h) or "--" followed by a word (e.g. --help). For example, try the following variations of the "ls" command to display the content of the /usr/ firectory:

```
ls -l /usr/
ls -a /usr/
ls -l -t /usr/
ls -l -r -t /usr/
ls -lrt /usr/
ls -lrth /usr/
```
Can you see any differences?

When running the command "ls -l" you see the contents of a directory in a table-like format similar to this:
![](https://github.com/TriLab-bioinf/WORKSHOP2024_1/blob/main/figures/ls_output.png)

Starting from the left, the columns display the following information:

1. File/directory permissions.
2. Number of folders inside a given directory
3. Owner of the file/directory
4. Group of the owner of the file/directory
5. File/directory size bites
6. Month of file/directory creation/modification
7. Day number of file/directory creation/modification
8. Year of file/directory creation/modification
9. File/directory name

   
**A note about file/directoyr permissions:**
In Linux, permissions are set by a string of 10 characters that define the permissions to read (r), write (w) and execute (x) a file or directory for the owner, the group and all the other users of the system.

![](https://github.com/TriLab-bioinf/WORKSHOP2024_1/blob/main/figures/Permissions_figure.png)

File/directoy permissions can be modified with the Linux command "chmod" using the +/- signs to grant or revoque permissions and the characters "a", "u", "g" and "o" to indicate "all users", "the owner", "the group", "other users":
```
# Original permission of file_1: - rw- r-- r--

# Grant (+) read and write permissions for all users (- rw- rw- rw-):
chmod a+rw file_1

# Remove (-) read permission for "other users" (- rw- r-- ---):
chmod o-r file_1

# Make file_1 executable for the owner and the group (- rwx r-x r--):
chmod u+x file_1
chmod g+x file_1


```

You can find out more about Linux permissions [here](https://www.linuxfoundation.org/blog/blog/classic-sysadmin-understanding-linux-file-permissions).


You can jump to another directory within the file system with the "cd" (change dir) command like so:
```
ch /usr
```

You can go back to your previous directory with the "-" parameter of the "cd" comand:
```
cd -

# Print new working directory
pwd
```

When working with directories there are three special directory names: 

"**.**" => is synonym of the current directory

"**..**" => is synonym of the directory immediately upstream (closer to the root) of the current directory

"**~**" => is synonym of your home directory (/home/$USER/)

For example, try the following:
```
# Go to your home directory /home/$USER/
cd ~

# While in your /home/$USER/ directory, list the content of the /home/ directory
ls ..

# While in your /home/$USER/ directory, list the content of the root directory (/)
ls ../..
```
To create a new directory within your home directory
```
# Create folder_1
mkdir folder_1

# Check that the new folder folder_1 is there
ls

# Go to folder_1
cd ./folder_1
```
Note the "./folder_1" notation used above meaning "current_directory -> folder_1"

## d. How to create a text file with the "nano" editor
Go to the ~/folder_1 directory and run the following command:
```
nano my_first_file.txt
```
You will see a new screen with the Terminal that looks like this:
![](https://github.com/TriLab-bioinf/WORKSHOP2024_1/blob/main/figures/nano.png)

Type the following text:
```
This is my first file
Hello World!
Bye
```
Save the file by typing ctrl-o and exit the file woth ctrl-x

## e. Visualize the content of text files with "more", "less", "cat", "head" or "tail" and find out the number of lines, words and characters they contain with "wc" (word count).
```
# Using more
more my_first_file.txt

# Using less
less my_first_file.txt

# Using cat
cat my_first_file.txt

# Print out the top 2 lines of a file with head
head -2 my_first_file.txt

# Print the last line of a file with tail
tail -1 my_first_file.txt

# Get some stats about the content of the my_first_file.txt file
wc my_first_file.txt  
```
The last command above "wc my_first_file.txt" should have printed out the following:
```
       3       8      39 my_first_file.txt
```
Where "3" is the number of lines, "8" the number of words and "39" is the number of characters, including the end-of-line character that is invisible.   

## f. Copy a file (cp), rename/move a file (mv) or delete or remove a file (rm)
Let's copy "my_first_file.txt" to another file called "my_second_file.txt"
```
cp my_first_file.txt my_second_file.txt
```
Rename my_second_file.txt as my_new_file
```
mv my_second_file.txt my_new_file
```
Delete or remove my_new_file (WARNING: be careful because is is not possible to recove any deleted file with the "rm" command.
```
rm my_new_file
```

## g. Redirecting the output of a command to a file with ">" and ">>"
We can save the output of a command into a file with the special character ">" like this:
```
ls / > my_output_file

# Print out the content of my_output_file
cat my_output_file
```
You can also append the output of a command to another file with the ">>" command like so:
```
cat my_first_file.txt >> my_output_file

# Print out the content of my_output_file
cat my_output_file
```

## h. Local and environmental variables

*What is a Linux variable*

A Linux variable is a character string that can holds numeric or character values (e.g. 'Hello', 12, 'Hello World'). They are defined with an '=' sign like this:
```
I_am_a_variable=12
VARIABLE2='Hello World'
VAriablE2=/I/am/a/single/string

```
To use the value stored in a value you call the variable with the prefix '$'; For instance:
```
# The command below prints out 'Hello World'
echo $VARIABLE2

# The command below prints out '/I/am/a/single/string'
echo $VAriablE2
```
***Note in the example above that Linux sees upper and lower cases as completely different characters and therefore, variable $VARIABLE2 is a different variable than $VAriablE2***

*What is a Linux Environmental variable*

Environmental variables are special cases of the regular variables as defined above, whose values are still viewable (usable) by child processes run from the same terminal. In general, environmental variables hold values that are dynamicaly used by the Operating System. For instance, $USER holds your NIH user name and $SHELL holds the name of the default Linux shell used by your system (e.g. bash).

Environmental variables can be defined with the "export" command this way:
```
export ENV_VARIABLE_1='Hello World'
```
You can see a list of all the environmental variables and their values present in your system with the command "env" or "printenv":
```
env

printenv
```
## i. Starting an interactive session in Biowulf
When you login into Biowulf, you are actually loging in into a special login computer or "node" named "biowulf.nih.gov" that has a small amount of memory and CPUs and therefore, it cannot run any programs. In fact, NIH doesn't allow you to run any processes in the login node. 

To run any jobs within Biowulf, you first need to start an interactive session with another computer node within Biowulf by running the "sinteractive" command:
```
# Start an interactive session within Biowulf
sinteractive

# Find out the name of the new interactive node 
hostname
```

Now let's print out the values of one of the local and environmental variables we defined in point "h" above:
```
# This is a local variable
echo $I_am_a_variable

# This is an environmental variable defined with "export"
echo $ENV_VARIABLE_1
```
What happened with the values of *$I_am_a_variable* and *$ENV_VARIABLE_1*?

When you create an account in Biowulf, you are assigned two working directories. Run the command "checkquota" in your Terminal to get info about all the working directories you have access to:
```
checkquota
```
The output should look similar to this:
```
Mount                        Used      Quota  Percent    Files    Limit  Percent
/data:                     2.8 TB     4.2 TB   66.97%  1058503 32000000    3.31%
/data(Hintonlab):          1.7 TB     2.0 TB   84.80%    46486 32000000    0.15%
/home:                     3.7 GB    16.0 GB   23.06%    38457      n/a    0.00%
```
The "/home:" corresponds to your /home/$USER/ directory and the "/data:" correspsponds to your /data/$USER/ directory. If you look at the "Quota" column (actual amount of disk space available) you will see that your /data/$USER/ folder has way more space available than your home directory. The idea for this is that you should always work on your /data/$USER/ directory. Your home directory is reserved for saving configuration files for customizing your system (e.g. how the Terminal looks like, customizing the values of some useful environmental variables or Linux commands, etc.). 

## j. Downloading the WORKSHOP2024_1 guide from the GitHub website into your /data/ directory

Run the following commands in the interactive server:
```
cd /data/$USER/
git clone https://github.com/TriLab-bioinf/WORKSHOP2024_1.git
ls -l
```
You should see a new directory called *WORKSHOP2024_1*.

Now go into WORKSHOP2024_1 and find out the entire content of the directory with the "tree" command:
```
cd WORKSHOP2024_1

tree 
```  

## k. Compressing and decompressing files with "gzip" and "gunzip" commands.

Create a new directory within WORKSHOP2024_1 named "working_dir":
```
cd WORKSHOP2024_1
mkdir working_dir
ls -l

```
Now copy all the files present in the /data/$USER/WORKSHOP2024_1/data/ directory into the working_dir folder:
```
cp /data/$USER/WORKSHOP2024_1/data/* /data/$USER/WORKSHOP2024_1/working_dir/

# Find out how big are the files just copied
ls -lh
``` 

Now let's compress all the fasta files in the working_dir folder so they get smaller with "gzip":
```
# The "*" below works as a wildcard character in Linux and in this case it represents "any string" followed by ".fasta"
gzip *.fasta

# Check the name of the compressed (gzipped) fasta files. They now have the  suffix ".gz" 
ls -l
```
Now, let's decompress short_seq.fasta.gz with the "gunzip" command:
```
gunzip short_seq.fasta.gz
```

## l. More advanced Linux commands for searching patterns (grep), sorting content (sort) and counting instances of strings

Look at te first 10 lines of the short_seq.fasta file with "head":
```
head short_seq.fasta
```
The output should look like this:
```
>Seq_1
ATGGATCCTGTCCAGCTTTGGAACGCCATTAAAGAAGAGCTACGCGAGTCCATCTCAACT
>Seq_2
GGCTTCTCCTTTGCTAATTACGTCGATACGTTGACGCCTTTACAAGTTTTAGAGAACAAA
>Seq_3
AACAATACGGTCACCTTACATTTATCGACCAACCATGAACAAGTGGCTGACGAATGGCTA
>Seq_4
AACCCAAGTAGTTCTTACTATCTCGCTTTCATGCAAGCAGCTATGACAGCAACGATGAAG
>Seq_5
CTGTATGGTCAACCAACGTTTATCGTCCCCTCGGTGACTTATATCTCACCACAACCAACT
``` 
Let's assume that we want to extract all the fasta headers of short_seq.fasta and store them into a file called fasta_headers. We know that fasta headers start with the ">" character, so we can extract all lines starting with ">" using the grep command:
```
# grep syntax = grep PATTERN target_file
grep ">" short_seq.fasta > fasta_headers

# See the content of fatsa_headers with "cat", "more" or "less"
cat fasta_headers
```
How you can find out how many headers are in the fasta_headers file?

To answer the question above , you can also use the parameter "-c" (count) in grep like so:
```
grep -c '>' fasta_headers
``` 

Use grep to find out how many sequences start or end with "AA". Grep can make use of two special characters to match the begining (^) or the end ($) of a line: 
```
# Match the start of the line
grep  '^AA' short_seq.fasta

# Count how many matches at the begining of the line
grep -c '^AA' short_seq.fasta

# Match AA at the end of the line
grep 'AA$' short_seq.fasta

# Count how many AA matches at the end of the line
grep -c 'AA$' short_seq.fasta 

```

Let's find out the name of the sequences starting with a 'AA' motif
```
grep -B 1 '^AA' short_seq.fasta

# A cleaner alternative
grep --no-group-separator -B 1 '^AA' short_seq.fasta
```

Now let's find out the name of the sequences NOT starting with the 'AA' motif using grep's "-v" parameter:
```
grep -v -B 1 '^AA' short_seq.fasta

``` 

Extract and count all the instances of the sequence motif 'AANNCC' using the wildcard character '.'  
```
grep -o 'AA..CC' short_seq.fasta > my_motif 

wc -l my_motif 
```
Now let's find out how many instances of each variant of the AANNCC motif are present with "sort" and "uniq -c" 
```
# First we will sort the motifs stored in the my_motif file
sort my_motif > my_motif.sorted
cat my_motif.sorted

# Count the amount of each motif
uniq -c my_motif.sorted > my_motif.counts
cat my_motif.counts
```

## m. Concatenating commands with the pipe character "|".

In Linux it is possible to concatenate two or more commands with the character "|" so the output of the command on the left of the pipe can be used as input and modified by the command on the right of the pipe. Using this feature, we could have been run the previous exercise to count the number of instances of each possible AANNCC motif in the following way:
```
grep -o 'AA..CC. short_seq.fasta | sort | uniq -c 
```   

## n. Extracting specific columns (fields) from files with a table-like format, such as a csv file or a tabulated file with the command "cut".

The file blastn_output.bn is a tabulated output from a sequence similarity search with BLASTN. Let's take a look at the file with "head" 
```
head blastn_output.bn
```

Fetch the columns corresponding to the query acc.ver, subject acc.ver, % identity and evalue, which correspond to columns (fields) 1,2,3 and 16 with "cut". 
```
# Option 1
cut -f 1,2,3,16 blastn_output.bn 


# Option 2
cut -f 1-3,16 blastn_output.bn

# Option 3
cut -s -f 1-3,16 blastn_output.bn
```

## o. Searching, Loading and running software installed in Biowulf.
In Biowulf you can find most of the bioinformatics programs commonly used for sequence analysis. To investigate if a program of interet is already installed in Biowulf, you use the command "module avail NAME_OF_SOFTWARE":
```
module avail blast
```  

Then to load a specific program you can use "module load NAME_OF_SOFTWARE":
```
# Specify the entire module name + version to load a specific software version
module load blast/2.14.0+

# Specify just the  software name to load the default version
module load blast
``` 

Is it possible to upload two or more programs at the same time like this:
```
module load blast bwa samtools/1.12
```

Sometimes it is necessary to "unload" a loaded program due to compatibility issues. You can do so with "module unload NAME_OF_SOFTWARE":
```
module unload samtools
```

## p. Writing a Linux script.
A Linux script is simply a text file with a number of commands to be run. Let's create a new file named script_1.sh with the "nano" editor and enter the following commands:  
```
echo This is my first script
echo
echo Hello World!
echo
```

Let's write a more sofisticated script to extract sequences from the short_seq.fasta containing a potential start condon (ATG) and save the results in the file atg_motif.fasta.
```
# Open a new file
nano motif_finder.sh
```

In nano, type the following (you can copy and paste into nano)
```
# Create variables
INPUT_FILE="short_seq.fasta"
MY_MOTIF="ATG"
OUTPUT_FILE="atg_motif.fasta"

grep --no-group-separator -B 1 $MY_MOTIF $INPUT_FILE > $OUTPUT_FILE  

echo Done!
``` 
Save the file with ctrl-x and run it with the following command:
```
sh motif_finder.sh
``` 

Scripts can incorporate information from the command line to be processed at running time. This can be useful to add information about input and output files among other things. For instance, we can improve the script above by allowing the user to enter the motif and input files from the command line, instead of being hardcoded in the script. This makes the script more flexible and therefore, more useful:
```
nano motif_finder_v2.sh  
```

Within nano, type or copy-paste the following:
```
# To run the program type:
# sh motif_finder.sh input_file_name motif
# E.g. sh motif_finder.sh short_seq.fasta AA..CC

# Create variables
INPUT_FILE=$1
MY_MOTIF=$2
OUTPUT_FILE="atg_motif.fasta"

grep --no-group-separator -B 1 $MY_MOTIF $INPUT_FILE > $OUTPUT_FILE  

echo Done!

```

## q. Runnin a Linux script in the grid with sbatch.
  
b.	File permissions, how to change permissions (chmod).














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
ll. Loops wit for; do; done
mm. Conditionals with if; then; fi 
