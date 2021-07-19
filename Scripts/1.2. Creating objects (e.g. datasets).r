#------------------------------------------#  
# 1.2. Creating objects (e.g datasets) #####
#------------------------------------------# 

#------------------------------------#
### 1.2.0 Data types & structures ####
#------------------------------------#

  #Understanding Basic Data Types and Data Structures in R
    #To make the best of the R language, you’ll need a strong understanding of the basic data types and data structures and how to operate on them.

    #Data structures are very important to understand because these are the objects you will manipulate on a day-to-day basis in R. Dealing with object conversions is one of the most common sources of frustration for beginners.

    #Everything in R is an object.

    #R has several basic data types (selection):

      #character:
        #e.g.: "a", "swc"
      #numeric (real or decimal)
        #e.g.: 2, 15.5
      #integer
        #e.g.: 2L (the L tells R to store this as an integer)
      #logical/boolean
        #e.g.: TRUE, FALSE
     

    #Every object that contains data has a data structures. These include
      #(atomic) vector
      #list
      #matrix
      #data frame
      #factors


#-------------------#
### 1.2.1 Vector ####
#-------------------#

  #A vector is the most common and basic data structure in R and is pretty much the workhorse of R
  #Feature: All elements within a vector have same data type (character, integer, numeric, ...)

  #A vector is created by the function c() (for combine)

  #Creating several vectors (r-objects) which contain characteristics of people
    names <- c("John", "Lea")
    birthdates <- c("10.01.2000", "20.02.2010", "11.09.1980")
    height <- c(148, 170, 184)
    nationality <- c(1,3,2)
    education <- c(2,3,1)
    
  #Adding Elements
    #The function c() can also be used to add elements to a vector.
    names <- c(names, "Carl")

    #Additional information: Coersion (rule)
      #Vectors may only have one type
      #R will create a resulting vector that is the least common denominator. The coercion will move towards 
      #the one that's easiest to coerce to -> This is called implicit coercion
    
      #The coersion rule goes logical -> integer -> numeric -> complex -> character.
    
      #You can also coerce vectors explicitly using the as.<class_name>. Example:
        #as.numeric()
        #as.character()
        #as.logical()
    
    
#-----------------#
### 1.2.2 List ####
#-----------------#

  #In R lists act as containers. Unlike atomic vectors, the contents of a list are not restricted 
  #to a single mode and can encompass any mixture of data types. Lists are sometimes called generic vectors,
  #because the elements of a list can by of any type of R object, even lists containing further lists. 
  #This property makes them fundamentally different from atomic vectors.
    
  #A list is a special type of vector. Each element can be a different type.
    
  #Create lists using list() or coerce other objects using as.list(). An empty list of the required length can be created using vector()
    
    x <- list(1.9, "a", TRUE, 2L) 
    
    
#-------------------#    
### 1.2.3 Matrix ####
#-------------------#

    #In R matrices are an extension of the numeric or character vectors. 
    #They are not a separate type of object but simply an atomic vector with dimensions; 
    #the number of rows and columns. As with atomic vectors, the elements of a matrix must be of the same data type.
      m <- matrix(1:6, nrow = 2, ncol = 3) # Matrices in R are filled column-wise.
    
    #Another way is to bind columns or rows using rbind() and cbind() (“row bind” and “column bind”, respectively).
      x <- 1:3
      y <- 10:12
      cbind(x, y)
      
      m <- cbind(names, birthdates, education, height, nationality)
    

  
#---------------------------------#
### 1.2.4 Dataset / data frame ####
#---------------------------------#

  #A data frame is a very important data type in R. It’s pretty much the de facto data structure for most tabular data 
  #and what we use for statistics.
  
  #A data frame is a special type of list where every element of the list has same length 
  #(i.e. data frame is a “rectangular” list).
  
  #Data frames can have additional attributes such as rownames(), which can be useful for annotating data, 
  #like subject_id or sample_id. But most of the time they are not used.
      
  #Several possibilities to create a dataset
    #1. Create a dataframe from vectors
      data1 <- data.frame(names, birthdates, height, nationality, education)
    
    #2. Create a data set by entering all the data
      data2 <- data.frame(Names = c("John", "Lea", "Carl"), 
                          Birthdates = c("10.01.2000", "20.02.2010", "11.09.1980"), 
                          Height = c(148, 170, 184),
                          Nationality = c(1,3,2),
                          Education = c(2,3,1))
    


  #In-R dataframes (useful for demonstration purposes)
    #Getting an overview of all datasets in the package ‘datasets’
      data()
  
    #Loading the in-R dataset ‘cars’ 
      data.cars <- cars
    
        
    #Creating a new Variable
      data.cars$speed.plus.dist <- data.cars$speed + data.cars$dist
      data.cars$distminus100 <- data.cars$dist - 100
  

    #Recoding variables
      #In order to recode data, you will probably use one or more of R's control structures.

      #create 2 height categories
        data1$height.cat2 <- ifelse(data1$height > 180, c("tall"), c("little"))
  
      #another example: create 3 height categories
        data1$height.cat3 <- ifelse(data1$height > 180, "tall", NA) #create new variable and define value for each observation/row
        data1$height.cat3[data1$height > 160 & data1$height <= 180] <- "medium"
        data1$height.cat3[data1$height <= 160] <- "little"



#-----------------------------------#
### 1.2.5 Factors / Value Labels ####
#-----------------------------------#

  #To understand value labels in R, you need to understand the data structure factor.
    
  #Factors are special vectors that represent categorical data. Factors can be ordered or unordered and are 
  #important when for modelling functions such as aov(), lm() and glm() and also in plot methods.
  
  #R statistical and graphic functions will then treat the data appriopriately.
    
  #Factors are pretty much integers that have labels on them. While factors look (and often behave) 
  #like character vectors, they are actually integers under the hood, and you need to be careful when treating 
  #them like strings. Some string methods will coerce factors to strings, while others will throw an error.
    
  #They are better than using simple integer labels because factors are what are called self describing. 
  #male and female is more descriptive than 1s and 2s. Helpful when there is no additional metadata.
    #Which is male? 1 or 2? You wouldn't be able to tell with just integer data. Factors have this information built in.

  
    #factor() function for nominal data
      #variable Nationality is coded 1, 2 or 3
      #we want to attach value labels 1=German, 2=Polish, 3=Spanish
        data1$nationality.f <- factor(data1$nationality,
                            levels = c(1,2,3),
                            labels = c("German", "Polish", "Spanish"))
        
        data1$nationality.f #print content of the variable
  
    #ordered() function for ordinal data
      #variable y is coded 1, 3 or 5
      #we want to attach value labels 1=Low, 2=Medium, 3=High
        data1$education.f <- ordered(data1$education,
                                     levels = c(1,2,3),
                                     labels = c("Low", "Medium", "High"))
        
        data1$education.f #print content of the variable
  
  
#--------------------------#
### 1.2.6 Load datasets ####
#--------------------------#

  #Examples of who to load local and online datasets

  #From Stata (similar for Spss)
    #install required package
      install.packages("haven")
      library(haven)
    #Load dataset
      allbus <- read_dta("Data/ALLBUScompact.2018.dta")
    
  #From Excel
    # if first row contains variable names use: header=TRUE)
      corona <- read.csv2("Data/Corona.csv", header=TRUE)
    
  #From Web
    #One source of examplary datasets: https://vincentarelbundock.github.io/Rdatasets/datasets.html
      strike <- read.csv(url("https://vincentarelbundock.github.io/Rdatasets/csv/AER/StrikeDuration.csv"))


#--------------------------#     
### 1.2.7 Save datasets ####
#--------------------------#      

  #Save as R-dataset
    saveRDS(data1, "Data/data1.rds")
    
    #read it again
      test <- readRDS("Data/data1.rds")
      
  #Export data
    #There are numerous methods for exporting R objects into other formats . For SPSS, SAS and Stata, you will need to load the foreign packages. 
    
    #To A Tab Delimited Text File
      write.table(data1, "Data/data1.txt", sep="\t")
    
    #To an Excel Spreadsheet
      write.csv2(data1, "Data/data1.csv")

    #To SPSS
      # write out text datafile and
      # an SPSS program to read it
        library(foreign)
        write.foreign(data1, "Data/data1.txt", "Data/Test/data1.sps",   package="SPSS")

    #To Stata
      # export data frame to Stata binary format
        library(foreign)
        write.dta(data1, "Data/data1.dta")

 
#------------------------------------------------------#
### 1.2.8 Additional Information: Dates (data type) ####       
#------------------------------------------------------#
        
        #Data Type Conversion
        #Type conversions in R work as you would expect. For example, adding a character string to a numeric vector converts all the elements in the vector to character.
        
        #is.numeric(), is.character(), is.vector(), is.matrix(), is.data.frame()
        #as.numeric(), as.character(), as.vector(), as.matrix(), as.data.frame)
        
        #vector	c(x,y)
        #vector as.vector(mymatrix)
        #matrix as.matrix(myframe)	
        #data.frame as.data.frame(mymatrix)
        
        #Date Values
        #Dates are represented as the number of days since 1970-01-01, with negative values for earlier dates.
        
        # use as.Date( ) to convert strings to dates
        mydates <- as.Date(c("2007-06-22", "2004-02-13"))
        # number of days between 6/22/07 and 2/13/04
        days <- mydates[1] - mydates[2]
        
        #Sys.Date( ) returns today's date
        Sys.Date()
        
        #date() returns the current date and time
        date()
        
        #The following symbols can be used with the format( ) function to print dates.
        #%d	day as a number (0-31)	01-31
        #%a
        #%A	abbreviated weekday
        #unabbreviated weekday	Mon
        #%m	month (00-12)	00-12
        #%b
        #%B	abbreviated month
        #%y
        #%Y	2-digit year
        #4-digit year	07
        
        
        # print today's date
        today <- Sys.Date()
        format(today, format="%B %d %Y")
        # ->"June 20 2007"
        
        #Date Conversion
        #Character to Date
        #You can use the as.Date( ) function to convert character data to dates. The format is as.Date(x, "format"), where x is the character data and format gives the appropriate format.
        
        # convert date info in format 'mm/dd/yyyy'
        strDates <- c("01/05/1965", "08/16/1975")
        dates <- as.Date(strDates, "%m/%d/%Y")
        
        #The default format is yyyy-mm-dd
        mydates <- as.Date(c("2007-06-22", "2004-02-13"))
        
        #Date to Character
        #You can convert dates to character data using the as.Character( ) function.
        #convert dates to character data
        strDates <- as.character(dates)  
        
        