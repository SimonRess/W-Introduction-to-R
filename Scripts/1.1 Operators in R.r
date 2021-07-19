#---------------------------------------#
# Chapter 1: Data Input & Management ####
#---------------------------------------#

#------------------------#
## 1.1 Operators in R ####
#------------------------#

  #remove all objects from the environment
    rm(list = ls())


  #---------------------------------#
  ### 1.1.1 Arithmetic Operators ####
  #---------------------------------#

    #Perform calculations:
      #These operators are used to carry out mathematical operations like addition and multiplication.
    
      3 + 4 # Addition by " + "
          3+4 # doesn't matter whether there is a space or not between the numbers and the arithmetic symbol
          
      3 - 4 # Subtraction by " - "
      
      3 * 4 # Multiplication by " * "
      
      3 / 4 # Multiplication by " * "
      
      3 ^ 4 # Power by " ^ "
      
      5 %% 2 # Modulus (returns the remainder after one number is divided by another) by " %% "
      
      5 %/% 2 # Integer division (how often does the divisor fit completely into the dividend) "%/%"

      
  #---------------------------------#
  ### 1.1.2 Relational Operators ####
  #---------------------------------#
      
    # Relational operators are used to compare between values
    # Output is a Boolean value (TRUE / FALSE)  

      #Less than: <	
        10 < 3
      #Greater than: >
        5*2 > 4
    	#Less than or equal to: <=
        20/2 <= 10
      #Greater than or equal to: >=
        15-5 >= 11
    	#Equal to: ==
        10 == 1
    	#Not equal to: !=
        10 != 9
  
        
  #------------------------------#
  ### 1.1.3 Logical Operators ####
  #------------------------------#
        
    # Logical operators are used to carry out Boolean operations like AND, OR & NOT.
    # Output is a Boolean value (TRUE / FALSE)  

    # They can be used to connect results from Relational operations (above).
    # Inherent question: It checks if inputs are TRUE
    	
    	#Element-wise logical AND: &
        5 > 1 & 5 < 4
    	  #Logical AND: && (works similarly, prefered in programming)

    	#Element-wise logical OR: |
        5 > 1 | 5 < 4
    	  #Logical OR: || (works similarly, prefered in programming)

      #Logical NOT: ! (turn around boolean values)
        !(5==5)
      
  
  #---------------------------------#
  ### 1.1.4 Assignment Operators ####
  #---------------------------------#
    #These operators are used to assign values to objects (variables, datasets, functions, ...)
  
    #Leftwards assignment <-, <<-, =	
      Value <- 5*4
        Value
      Sentence <- "Hello World"
        Sentence
    #Rightwards assignment ->, ->>	(Rarely used)
        
      #The operators <- and = can be used, almost interchangeably, to assign to variable in the same environment
      #The <<- operator is used for assigning to variables in the parent environments (more like global assignments)  
    
        
  #---------------------------------#
  ### 1.1.4 Operation on Vectors ####
  #---------------------------------#
          
    #The above mentioned operators work on vectors. The variables used above were in fact single element vectors.
    #We can use the function c() (as in concatenate) to make vectors in R.
    
      x <- c(2,8,3)
        x
      y <- c(6,4,1)
        y
      z <- x+y
        z
      x>y
