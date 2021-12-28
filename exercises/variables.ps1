
######## Variables

Objective: Understand the concept of variables - what are they used for; basic usage; etc.
            Understand the concept of objects and variable types.


## Setting up the lab:
create a file named "Variable.ps1" in which you will put 
all the exercise code.

##### Intro

## Questions:
1. What is a variable?
2. What is it used for?

####
## Exercise 1: Define a variable

define 2 variables with the names and values: 
Name - your name
Proffession - "Powershell expert"
Salary - your real salary

## Exercise 2: Use a variable 

a. Write code that will print "Hello, my name is <Name> and I'm a <Proffesion>, and I make <Salary> shekels a month"
b. Change the value of the variable "Name" to "Barbara" and print again.
c. Now write code that will print exactly this: "My name is $Name". How do you do that?

##### Variables types

## Questions:
1. What type of data can you store in a variable? Name 3 types.
2. What does it mean that Powershell variables are "loosely typed"? What does it allow you to do?

## Exercise 3: Find out the type of a variable
For each line, check the type of the variable (Use Get-Type())
"""
$A = 1
$B = "1"
$C = 1, 2, 3
$D = 1, "2", 3
$E = Get-ChildItem  # Is that an array? array of what?
"""

## Exercise 4: Change the type of a variable
Check the type of the variable A after this line:
"""
$A = 1
"""
And after this line
"""
$A = "1"
"""
Is that a problem?
How do you make it so that the second line will raise an error? (Hint: cast operator/type attribute)

###### Variable members
You need to know that everything in Powershell is an object, i.e., it contains 
properties and methods.

## Questions:
Read a little about Object Oriented Programming. Especially understand the concpet of 
objects and classes.
1. What are objects and classes?
2. Explain the concpet of "methods" and "properties"

## Exercise 5: observe the members of an object
Run:
"""
Get-ChildItme | Get-Member
"""
What type is this? List 2 methods and 2 properties of this type.

## Exercise 6: Access properties
Run:
"""
$File = $(Get-ChildItem)[0]
"""

Now, with the $File variable in hand, write code lines that print:
1. "The file <file name> is in the directory <directory of the file>"
2. "The size of this file is <size>"