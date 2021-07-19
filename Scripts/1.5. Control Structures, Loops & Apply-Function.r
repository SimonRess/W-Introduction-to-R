#--------------------------------------------------------#  
#### 1.5. Control Structures, Loops & Apply-Function #####
#--------------------------------------------------------#  
  #R has the standard control structures you would expect. expr can be multiple (compound) statements by enclosing them in braces { }. 
  #It is more efficient to use built-in functions rather than control structures whenever possible.
  
  #if-else
    num1 <- 10
    num2 <- 4
    if(num1 < num2) print(paste("First number is", abs(num1-num2), "smaller than the second number")) 
      else print(paste("First number is", num1-num2, "greater than the second number"))
  
  #ifelse
    #Syntax ifelse(test,yes,no)
    age <- c(3, 45, 20, 7, 11, 18, 13, 22, 9)
    ifelse(age<18, "underage", "of legal age")


  #switch
    centre <- function(x, type) {
      switch(type,
            mean = mean(x),
            median = median(x),
            trimmed = mean(x, trim = .1))
    }
    centre(age, "mean")
  
  
#Loops
  #for-loop
    #R Program to find the multiplicationtable (from 1 to 10) 
      num <- 7
      for(i in 1:10) { #use for loop to iterate 10 times
        print(paste(num,'x', i, '=', num*i))
      }
  
  #while-loop
    while (cond) expr


#Apply-Functions
  #The apply() function can be feed with many functions to perform redundant application on a collection of object (data frame, list, vector, etc.). 
  #The purpose of apply() is primarily to avoid explicit uses of loop constructs (is a substitute to the loop). They can be used for an input list, 
  #matrix or array and apply a function. Any function can be passed into apply().

  #apply() function
    #apply() takes Data frame or matrix as an input and gives output in vector, list or array. apply() Function is primarily used to avoid explicit 
    #uses of loop constructs. It is the most basic of all collections can be used over a matrice.
    m1 <- matrix(C<-(1:10),nrow=5, ncol=6)
      m1
    a_m1 <- apply(m1, 2, sum) # apply the sum()-function to the matrix and return the sum of each column (specified by the <2>)
      a_m1

  #lapply() function
    #lapply() function is useful for performing operations on list objects and returns a list object of same length of original set. lappy() 
    #returns a list of the similar length as input list object, each element of which is the result of applying FUN to the corresponding element of   
    #list. lapply() takes list, vector or data frame as input and gives output in list.
    movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
    movies_lower <-lapply(movies, tolower) # change the string value of a matrix to lower case with tolower()-function
      str(movies_lower) #output is a "list"
    movies_lower <-unlist(lapply(movies,tolower)) #convert the list into a vector by unlist()
      str(movies_lower)

  #sapply() function
    #sapply() function takes list, vector or data frame as input and gives output in vector or matrix. It is useful for operations on list objects and 
    #returns a list object of same length of original set. sapply() function does the same job as lapply() function but returns a vector.
    dt <- cars
    lmn_cars <- lapply(dt, min)
      lmn_cars
    smn_cars <- sapply(dt, min)
      smn_cars

  #Overview of apply()-functions
    #Function     Arguments               Objective                                          Input                         Output
    #apply        apply(x, MARGIN, FUN)   Apply a function to the rows or columns or both    Data frame or matrix          vector, list, array
    #lapply       lapply(X, FUN)          Apply a function to all the elements of the input  List, vector or data frame    list
    #sapply       sappy(X FUN)            Apply a function to all the elements of the input  List, vector or data frame    vector or matrix
    
  
  #tapply() function
    #tapply() computes a measure (mean, median, min, max, etc..) or a function for each factor variable in a vector. It is a very useful function that 
    #lets you create a subset of a vector and then apply some functions to each of the subset.
    #Part of the job of a data scientist or researchers is to compute summaries of variables. For instance, measure the average or group data 
    #based on a characteristic. Most of the data are grouped by ID, city, countries, and so on. Summarizing over group reveals more 
    #interesting patterns.
    data(iris)
    tapply(iris$Sepal.Width, iris$Species, median) #get the median value of the sepal width of each species


