
# OBJECT ORIENTED PROGRAMMING

# The class is the blueprints for which we can use to create many instances. While many languages have a single class system, R
#   has three classes: the S3, S4, and the reference class.

# S3 CLASS

# Lacks a formal definition and can be created simply by adding a class attribute to it
# Most built-in structures are of this type
s <- list(name = "John", age = 21, GPA = 3.5)
class(s) <- "student" # remember that we must always assign the class a name.

# The S3 Class: Lacks formal definition
#               Objects are created by setting the class attribute
#               Attributes are accessed using $
#               Methods belong to generic function
#               Follows copy-on-modify semantics

# S4 CLASS
  
# Have a formally defined structure and are defined using the setClass() function. Instances of the class are created using the
# new() function is used to create instances of the class
setClass("student", slots=list(name="character", age="numeric", GPA="numeric"))

# The S4 Class: Class defined using setClass()
#               Objects are created using new()
#               Attributes are accessed using @
#               Methods belong to generic function
#               Follows copy-on-modify semantics

# REFERENCE CLASS

# Since this was introduced later, this is similar to the object-oriented programming in other languages.
setRefClass("student")

# The Reference Class: Class defined using setRefClass()
#                      Objects are created using generator functions
#                      Attributes are accessed using $
#                      Methods belong to the class
#                      Does not follow copy-on-modify semantics

#-------------------------------------------------------------------------------------------------------------------------------

# S3 CLASS

# A list with its class attribute set to some class name is a S3 object. The components of the list become the variables of the
#   object
s # We look at the above defined s, and we can see that there is an extra attribute for the class

# This is different than most languages like C++ where the formal class definitions have defined attributes and methods

# It is common practice to use a function with the same name as the class to create objects
# The following is an example of a constructor for an instance of the "student" class
student <- function(name,age,gpa)
{
  if(gpa < 0 || gpa > 4) stop("GPA must be between 0 and 4")
  values <- c("name" = name, "age" = age, "GPA" = gpa)
  class(values) <- "student" # We can also set class using attr(values, "class")
  return(values)
    
}
s <- student("Victor", 19, 3.7);s
s <- student("Victor", 19, 5);s # This will generate an error msg
s

# METHODS AND GENERIC FUNCTIONS

# When we simply write the name of a object, it get printed using the print() function. But with all these different types of
#   input, how does the print function know how to print these dissimilar objects.
# print() is a generic function and it actually has a collection of methods. These can be checked using methods(print)
methods(print)

# We see that included in the list is print.data.frame and print.factor. So when the generic print() function is given these 
#   data types, then it will then pass them to the more defined functions. The general methods names are in the form
#   generic_function.data_type()
# If we look for the print.student() function, we will notice that it does not exist, so how does the function know how to print
#   the "student" object? There is a print.default() function that gets called if no other match is found. All generic functions
#   will have a default method.
# Here we can see a list of default methods
methods(class = "default")




































