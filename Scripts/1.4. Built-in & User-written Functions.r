#----------------------------------------------#  
## 1.4. Built-in & User-written Functions  #####
#----------------------------------------------# 

  #Almost everything in R is done through functions. Here I'm only refering to numeric and character functions that are commonly used in creating or recoding variables.
  
  #------------------------------#
  ### 1.4.1 Numeric Functions ####
  #------------------------------#

    #abs(x)	absolute value
    #sqrt(x)	square root
    #ceiling(x)	ceiling(3.475) is 4
    #floor(x)	floor(3.475) is 3
    #trunc(x)	trunc(5.99) is 5
    #round(x, digits=n)	round(3.475, digits=2) is 3.48
    #signif(x, digits=n)	signif(3.475, digits=2) is 3.5
    #cos(x), sin(x), tan(x)	also acos(x), cosh(x), acosh(x), etc.
    #log(x)	natural logarithm
    #log10(x)	common logarithm
    #exp(x)	e^x
  

  #--------------------------------#
  ### 1.4.2 Character Functions ####
  #--------------------------------#

    #substr(x, start=n1, stop=n2)	Extract or replace substrings in a character vector.
    #x <- "abcdef"
    #substr(x, 2, 4) is "bcd"
    #substr(x, 2, 4) <- "22222" is "a222ef"
    #grep(pattern, x , ignore.case=FALSE, fixed=FALSE)	Search for pattern in x. If fixed =FALSE then pattern is a regular expression. If fixed=TRUE then pattern is a text string. Returns matching indices.
    #grep("A", c("b","A","c"), fixed=TRUE) returns 2
    #sub(pattern, replacement, x, ignore.case =FALSE, fixed=FALSE)	Find pattern in x and replace with replacement text. If fixed=FALSE then pattern is a regular expression. If fixed = T then pattern is a text string.
    #sub("\\s",".","Hello There") returns "Hello.There"
    #strsplit(x, split)	Split the elements of character vector x at split.
    #strsplit("abc", "") returns 3 element vector "a","b","c"
    #paste(..., sep="")	Concatenate strings after using sep string to seperate them.
    #paste("x",1:3,sep="") returns c("x1","x2" "x3")
    #paste("x",1:3,sep="M") returns c("xM1","xM2" "xM3")
    #paste("Today is", date())
    #toupper(x)	Uppercase
    #tolower(x)	Lowercase
  

  #----------------------------------------#
  ### 1.4.3 Other Statistical Functions ####
  #----------------------------------------#

    #Other useful statistical functions are provided in the following table. Each has the option na.rm to strip missing values before calculations. Otherwise the presence of missing values will lead to a missing result. Object can be a numeric vector or data frame.
      #mean(x, trim=0,
      #     na.rm=FALSE)	mean of object x
        # trimmed mean, removing any missing values and
        # 5 percent of highest and lowest scores
      #mx <- mean(x,trim=.05,na.rm=TRUE)
      #sd(x)	standard deviation of object(x). also look at var(x) for variance and mad(x) for median absolute deviation.
      #median(x)	median
      #quantile(x, probs)	quantiles where x is the numeric vector whose quantiles are desired and probs is a numeric vector with probabilities in [0,1]. 30th and 84th percentiles of x
      #y <- quantile(x, c(.3,.84))
      #range(x)	range
      #sum(x)	sum
      #diff(x, lag=1)	lagged differences, with lag indicating which lag to use
      #min(x)	minimum
      #max(x)	maximum
      #scale(x, center=TRUE, scale=TRUE)	column center or standardize a matrix.
  

  #-----------------------------------#
  ### 1.4.4 Other Useful Functions ####
  #-----------------------------------#

    #seq(from , to, by)	generate a sequence
    #indices <- seq(1,10,2) indices is c(1, 3, 5, 7, 9)
    #rep(x, ntimes)	repeat x n times
    #y <- rep(1:3, 2) y is c(1, 2, 3, 1, 2, 3)
    #cut(x, n)	divide continuous variable in factor with n levels
    #y <- cut(x, 5) 
  
  
  #-----------------------------------#
  ### 1.4.5 User-written Functions ####
  #-----------------------------------#

  #One of the great strengths of R is the user's ability to add functions. 
  #In fact, many of the functions in R are actually functions of functions. 
  #The structure of a function is given below.
  
    myfunction <- function(arg1, arg2, ... ){
      statements
      return(object)
    }
  
  #Objects in the function are local to the function. The object returned can be any data type. 
  #Here is an example:
    
    reduce <- function(sentence, keep){
      words <- unlist(strsplit(sentence, " "))[keep]
      return(words)
    }  
    
    reduce("Hello my name is Simon", 3:5)
