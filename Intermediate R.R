
# Inherently in R TRUE is coded as 1 and FALSE is coded as 0 so we have that T > F, T == 1 and F == 0 all evaluate to TRUE
T > F
T == 1
F == 0

# Strings are compared in alphabetical order so letters later in the alphabet are greater than those earlier
# Capitals are greater than lower case letters
"apple" < "zebra"
"apple" < "Apple"

# TRUE can be written as TRUE, T, or 1. FALSE can be written as FALSE, F, 0
# Since TRUE is 1 and FALSE is 0, we can use sum() on a logical vector to find the total number of TRUe entries

#------------------------------------------------------------------------------------------------------------------------------

#IF ELSE STATEMENT

x <- 3
if(x > 0)
{
  cat("Positive:",x)
} else if(x < 0)
{
  cat("Negative:",x)
}else
{
  print("Zero: 0")
}

# We have that else if and else must be on the same line as the end parenthesis of the previous block

# We can also write statements with only ifelse (not else if) in an alternate way (for one-line code)
if(x > 0) print("Positive") else print("Not Positive")

# This allows us to do conditional variable assignments as follows:
y <- if(x > 0) x else -1

#------------------------------------------------------------------------------------------------------------------------------

# ifelse() FUNCTION

# The syntax is ifelse(logical_vector, x ,y) where x is the result if true, and y is the result if false. This only takes in 
#   logical vectors and returns a vector of same length with each element being replaced with x or y depending on if the 
#   corresponding value is TRUE or FALSE
ifelse(c(F,T,T),"this is true", "this is false")

# It can be mentioned here that single values are treated as vectors of length 1 in r
# This means that T and F are also vectors if length 1 since they are coded as 1 and 0 respectively

#------------------------------------------------------------------------------------------------------------------------------

# FOR LOOPS

for(val in seq(1,11,by = 2))
{
  print(val)
}

# This will loop over all values in the input vector with val (or whatever this is called) as each value

#------------------------------------------------------------------------------------------------------------------------------

# WHILE LOOP

x <- 5
while(x < 10)
{ print(x)
  x <- x + 1
}
print(x)

# Keeps looping until the condition returns FALSE, in which case it will exit

#------------------------------------------------------------------------------------------------------------------------------

# BREAK & REPEAT FUNCTION

# Using the "break" keyword inside a loop (for, while, repeat) will exit the loop and continue to the next block of code
x <- 0
repeat
{
  x <- x + 1
  print(x)
  if(x >=5)
  {
    break
  }
}

# The repeat loop will keep repeating the block of code inside until a break statement is reached

# NEXT

# The "next" keyword is used inside a for loop and will skip to the next iteration of the loop if it is encountered

#------------------------------------------------------------------------------------------------------------------------------

# The print() function prints its arguement and returns it. So y <- print(x) will assign the value of x to y
#   Using twp different prints will result in the two outputs on different lines. print() also prints out variables
# To print out different data types and stick them together, we use cat(arg_1, arg_2, ...) which converts its argurments to 
#   strings and then puts them together with a space in the middle and then prints it. We can use \n to go to a new line
cat("banana", "\nbread")

#------------------------------------------------------------------------------------------------------------------------------

# FUNCTIONS

positive <- function()
{
  print("hello")
}

# the function keyword is used to create a function. A function is an object with a name.
# It can exclude braces if the code inside is a single line. An equivalent way to write the above statement is
positive <- function() print("hello")

# We can specify parameters of the function by adding them in the brackets separated by commas. Parameters are dynamically
#   typed so we must always make sure that our inputs are valid
adder <- function(x,y)
{
  print(x + y)
}
adder(1,2)
# adder("2",1) # This code will result in an error (uncomment to see what happens)

# We can set default values for functions by using "=" when specifying function arguements. This is what the function value 
#   will take if a parameter is not specified. The user can override this default value by entering their own value when
#   calling the function
exponenter <- function(x, y = 2)
{
  print(x^y)
}
exponenter(2)
exponenter(2,4)

# We can return values from a function using return(expression)
modulus2 <- function(x)
{
  return(x%%2)
}

# If the return statement is not used in a function, the function will return the last evaluated statement.
modulus2 <- function(x)
{
  x%%2
}
modulus2(32314)

# Using the return statement will automatically exit the function, code after the return() statement will not run
# return() can only return a single thing, so if we want to return multiple things, it is useful to use a data structure (list)

#------------------------------------------------------------------------------------------------------------------------------

# THE R ENVIRONMENT

# When first starting up r, the top level  environment is called the Global Environment. This is called R_GlobalEnv or can also
#   be referred to as .GlobalEnv
# The ls() function will list out all the objects in the current environment
# The environment() function will get the current environment
ls()
environment()

# Like other languages, variables and function have scope of their current block. Nested blocks have access to all variables 
#   that are on levels about it.
# As long as variables and functions are initialized into the environemnt, they can be used at any time. But we should always
#   code them in order since when we are initializing the entire code for the first time, it will be read in order
# Local variables only exist for the duration of the function. After which they are freed
# When there are two variables with the same name, the one narrower in scope will be changed/used
# In functions, when trying to assign to a global variable using "<-", it will create another local variable with the same name
#   instead. To assign global variables, we use "<<-"
globalVar <- 0
assign0 <- function()
{
  globalVar <- 5
  print(globalVar)
}
assign0()
print(globalVar)
# We see from the above example that this indeed does not reassign the global variable
assign0Global <- function()
{
  globalVar <<- 5
  print(globalVar)
}
assign0Global()
print(globalVar)
# This code has actually reassigned the global variable
# The "<<-" operator will go to the parent environment(if nested) and try looking for a variable to assign. If none is found,
#   it will keep trying until it has reached the global environment. There it will create a variable if still no variables 
#   match the one we are trying to assign

#-----------------------------------------------------------------------------------------------------------------------------

# Recursion is supported in R (Don't forget base case)
myFactorial <- function(x)
{
  if(x == 1)
  {
    return(1)
  }
  return(x * myFactorial(x - 1))
}
print(myFactorial(5))

#-----------------------------------------------------------------------------------------------------------------------------

#INFIX OPERATORS

# Most of the operators in R (+, - , *, /, <, >, ...etc) are binary operators with two arguements. In the background of R,
#   they are actually calling a function. For example, a + b is actually calling a function `+`(a,b). These built-in functions
#   have the `` as the special symbol to denote these functions
3 + 4
`+`(3,4)

# We can define these types of infix operators by using the % in the name of the function (this function must be surrounded by
#   the `` operator)
`%divisible%` <- function(x,y)
{
  if(x %% y == 0)
  {
    return(T)
  }else
  {
    return(F)
  }
}
23 %divisible% 12
24 %divisible% 12
#-----------------------------------------------------------------------------------------------------------------------------

#SWITCH FUNCTION

# switch(expression, list) this function will first evaluate the expression for a numeric answer and then select that element
#   from the list.Remember that the list is 1-indexed.
switch(4,1,2,3,4,5,6,7,8,9,10,11)

# The expression can also return a string (if the list is named) and the function will return the value in the list with the
#   same name as the expression
switch("banana", "apple" = "red", "banana" = "yellow")











