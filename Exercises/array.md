
########## Arrays ###########
Objective: Understand arrays, basic usage, etc.

This worksheet will follow the "about_Arrays" page:
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_arrays?view=powershell-7.2


Required knowledge:
- basic  Powershell syntax
- variables and objects

Also recommended to read about sub-expressions to know how to access 
members of variables within another expressions. 



#### Intro - Creating arrays

## Questions:
1. What is an array?
2. What is it used for?

## Exercises:
1. Create an array named "Numbers" with the values: 1, 4, 33, 9, 10
2. Create an array named "NumbersSmall" with only the value 2
   - how do you know its an array? (Remember GetType?)
3. Create an array named "MySerie" with the numbers 2 - 20 (without writing each number individually)

## Questions:
1. What is the type of an array? 
2. Can you have different types of elements in the same array?
3. Why would we want to restrict this behaviour?

## Exercises:
1.  Use GetType() on one of the array objects you created ($Numbers for example).
    - what do you see? what type is it?
    - What is the type of the elements in the array?
2. Create an array named "Mixed" with the values: 1, 2, "Moshe". Is that possible?
3. Get the type of this array. Is it the same of the array "Numbers"?
4. How do you create an array that will not allow the assignment of 1, 2, "Moshe" ?
    - create an array that only takes strings
    - create an array that only takes integers


#### Array sub-expression operator
Read about the array sub-expression operator

## Questions:
1. What is array sub-expression operator? What does it do?
2. What is the syntax of an array sub-expression operator?

## Exercises
1. Create an array that contains only the number 1 using array sub-expression.
2. Create an empty array, without elements at all.
3. Create a directory with only one file in it.
    - run:
         $OneFile=Get-ChildItem
      what type is $OneFile?
    - How do you fix the above line so it will be an array?

#### Accessing and using arrays

## Exercises:
1. On the Powershell terminal, create an array with elements 1 - 10. Now output them
    - Output all the numbers to the screen
    - Now output only the number "3". (i.e. access the 3rd element of the array)
    - Now output all the range (2 - 8)

2. Run Get-ChildItem and take the output into a variable (name it Files). 
    - What type is that variable?
    - Access the second element of the array and print it to the screen
    - Now print only the name of that second element
    - Take that second element into a variable. What type is that variable?
3. Consider the $MySerie array from above.
    - Create a new array named $MySerieFiltered with only the values 2 - 6 (in one line)
    - Now assign to the same name ($MySerieFiltered) only the values 1, 5, 9
    - Now assign only the values 1, 3, 5-7, 10


#### Properties and methods of arrays

## Exercies:
1. Get the size of the "Files" array from the last exercise, into the variable named NumFiles
    - Do it in another way

# ForEach
2. Write code that will Iterate over the same array and for each element print: "File: <filename>"
    - Hint: Read about automatic variables. What is $_ ?
3. Write code that will iterate over the same array and print only the 'LastAccessTime' of each element
    - Hint: There are several signatures of the ForEach method. One of them is 'ForEach(string propertyName)'
4. Recall the "MySerie" array. Using ForEach, create a new array (MySerieSquares) with all the squares of this array.

# Where
5. Take the array of numbers from 1 - 10 (named $MySerie), and print only the numbers that divide
    by 3. (Read about using operators)
6. Take this array:
        $Friends = "Dan", "Yonatan", "Nevuchadnezer", "Ben"
    and print only the names that are longer from 5 characters.
7. Nevuhadnezer is not good for the jews, use the Where method to create a new array without him
    in our WhatsApp group.


#### Manipulating an array

Questions:
1. What operations can you do on an array?
2. Can you delete an element from an array? What can you do instead?

Exercises:
1. Take the Names array from above, and replace "Yonatan" with "David".
2. Now add "Haman" to the list, so what if he is evil...
3.

##### Related: ForEach-Object and Where-Object cmdlets
This is a bit out of order, as we will cover cmdlets in a later module, 
but since it is related, we will look at these cmdlets here also.

Get yourself familiar with the Where-Object and ForEach-Object cmdlets. 

Question:
1. Can you start a line of code with Where-Object or ForEach-Object? Why not?

Exercises:
1. Consider the following array:
        $Friends = "Dan", "Yonatan", "John", "Avi", "Yehoshua"
    - Use ForEach-Object to iterate over the array and print for each name "Hello <name>"
    - Do the same thing with $Friends.ForEach
2. For the same array, iterate over the list, and for "John" print: "Goi!"
    - Do it with both Where-Object and ForEach-Object

Bonus: What is the difference between ForEach-Object and $Array.ForEach? 
        Check the type you get from each command, are they the same?
        What happens when you have only 1 element? What types do you receive then?


Bonus: Multi-dimensional arrays - read and exercise.








