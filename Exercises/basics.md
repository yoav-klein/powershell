 

### chapter 1 - file system operations 

  

objective: 

---------- 

learn to use cmdlets related to file system operations 

  

cmdlets: 

-------- 

- Get-ChildItem 

- Set-Location 

- New-Item 

- mkdir 

- Remove-Item 

- Copy-Item 

- Move-Item 

- Get-Location 

  

Exercise (create/remove files, directories, list files/directories): 

--------- 

1. Create a new file "file.cpp" 

2. Delete it 

3. Create a directory named "my_dir". 

4. Do it in another way 

5. create the following files in this directory "file.cpp", "dir" 

6. create a directory in this directory named "file" 

7. list all the files and directories in this directory (what command do you use?) 

8. How do you know if an item given in the output is a file or a directory? 

Mode a for a file 

Mode d fro Directory 

  

Questions: 

--------- 

1. What are aliases? What aliases helped you with the above exercise? 

2. How do you know if a certain command is an alias or the command itself?   

3. For each cmdlet listed above, write if is an alias, and if so, to what it points? 

- Get-ChildItem  

- Set-Location 

- New-Item 

- mkdir 

Aliases - New-Item 

- Remove-Item 

- Copy-Item 

- Move-Item 

- Get-Location 

4. What are cmdlets?  

  

Exercise (copy files, move files): 

--------- 

1. create a new directory named "dest" in the root directory (powershell) 

2. copy the file project/test/test.h to the "dest" directory 

3. create another directory in "dest" named "source" 

4. copy the contents of the "project/source" directory to the "dest/source" directory 

    - make sure that all the nested files are copied as well 

5. remove the "dest/source" directory. 

6. now copy the "project/source" directory to the "dest" directory 