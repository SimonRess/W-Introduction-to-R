#----------------------------------#  
#### 1.3. Working with datasets ####
#----------------------------------# 

#remove all objects from the environment
  rm(list = ls())

#Loading datasets
  #Stata-dataset
    #install required package
      if(!require(haven)) install.packages("haven") #only install package if it's not already installed
      library(haven)
    #Load dataset
      allbus <- read_dta("Data/ALLBUScompact.2018.dta")

  #Excel-dataset
    corona <- read.csv2("Data/Corona.csv", header=TRUE)
    data1.csv <- read.csv2("Data/data1.csv", header=TRUE)

  #R-dataset
    data1.rds <- readRDS("Data/data1.rds", header=TRUE)

    
#---------------------------------------------#
### 1.3.1 Getting Information on a Dataset ####
#---------------------------------------------#
    
  #There are a number of functions for listing the contents of an object or dataset.
  
    #list objects in the working environment
      ls()
    
    #Names of elements within an object (e.g. list the variables in a dataset)
      names(corona)
  
    #Compactly display the internal structure of an R object. Perhaps the most uesful diagnostic function in R.
      str(corona) #str is short for structure
    
    #dimensions of an object
      dim(corona)
    
    #number of rows
      nrow(corona)
      
    #number of columns
      ncol(corona)      
    
    #class of an object (numeric, matrix, data frame, etc)
      class(corona)

    #metadata/attributes of an object 
      attributes(corona)
    
    #print mydata
      corona
    
    #print first 10 rows of mydata
      head(corona, n=10)
    
    #print last 5 rows of mydata
      tail(corona, n=5)


    #list levels of factor Education.f
      levels(data1.csv$Education.f)

    #list levels of factor Education.f
      levels(data1.rds$Education.f)
      #Q: Why is there a different output?


    #Get or set the length of vectors
      length(corona$date)

      
      
#-------------------------------------------#      
### 1.3.2 Slicing/Subsetting data frames ####     
#-------------------------------------------#      

  #R has powerful indexing features for accessing object elements. 
  #These features can be used to select and exclude variables and observations.
      
  #Specific data in dataframes can be accessed using square brackets: [] 
  #The desired data is selected using two vectors: one for the rows and one for the columns
  #Notation: data[rows, columns]
  
  #---------------------------------------------#
  #### 1.3.2.1 Slicing with indexing vectors ####
  #---------------------------------------------#
      
    #Return row 1
      corona[1, ]
      
    #Return column 5
      corona[, 5]
      
    #Return rows 1 to 5 and column 2
      corona[1:5, 2]      
      
    #Retrun column "date" & "location"
      corona.reduced <- corona[,c("date","location")]
    
    #Save 1st and 5th thru 10th variables in new dataframe
      corona.reduced <- corona.reduced[c(1,5:10),]
  
  #--------------------------------------------#    
  #### 1.3.2.2 Slicing with logical vectors ####
  #--------------------------------------------#
      
    #Indexing dataframes with logical vectors is almost identical to indexing single vectors. 
    #First, we create a logical vector containing only TRUE and FALSE values.
    #Next, we index a dataframe (typically the rows) using the logical vector to return only values for which the logical vector is TRUE.
      
      #Create a new df with only the rows of corona where
        #1) continent is "Europe" AND
        #2) total_cases is greater than 10
          corona.selected1 <- corona[corona$continent=='Europe' & corona$total_cases > 10, ]
      
      #Selection using the Subset Function
        #Indexing with brackets is the standard way to slice and dice dataframes. 
        #Another method is to use the subset() function.
          corona.selected2 <- subset(corona, total_cases >= 20 & total_cases < 100, select=c(date, total_cases))
  
      
  #-------------------------------------------------#   
  #### 1.3.2.3 Delete variables from a dataframe ####
  #-------------------------------------------------#
      
    #There are two approaches:
    
      #1) Create a new dataframe with unneeded variables
        #By the %in% operator is elementwise checked if elements on the left side equal 
        #to elements within the vector of the right side. Output is a Boolean vector
        #The ! operator negates Boolean values. Therefore the position of variable is TRUE except of "iso_code"
        corona.new <- corona[, !(names(corona) %in% ("iso_code"))]
      
      #2) Delete the variable/column from an existing dataframe
        #To do so assign NULL to this variable:
          corona$iso_code <- NULL    
        #Use this approach only if you definitly don't need this variable anymore
       
          
          
#--------------------------------#      
### 1.3.3 Sorting data frames ####
#--------------------------------#      
      
  #To sort a data frame in R, use the order( ) function. By default, sorting is ASCENDING. Prepend the sorting variable by a minus sign to indicate DESCENDING order. Here are some examples.
  # sorting examples using the corona dataset

    # sort by continent
      corona <- corona[order(corona$continent),]
    
    # sort by continent and total_cases
      corona <- corona[order(corona$continent, corona$total_cases) , ]  # nameofdataset[ , ]
      
    #sort by continent (ascending) and total_cases (descending)
      corona <- corona[order(corona$continent, -corona$total_cases),]

      
#-------------------------#
### 1.3.4 Merging Data ####
#-------------------------#
  
  #Adding Columns
    #To merge two data frames (datasets) horizontally, use the merge function. In most cases, you join two data frames by one or more common key variables (i.e., an inner join).
      #splitting corona dataset
        corona1 <- corona[,1:30]
        corona2 <- corona[,c(3:4,31:73)]
    #merge two data frames by ID and Country
      corona.full <- merge(corona1, corona2, by=c("location","date"))

  
  #Adding Rows
    #To join two data frames (datasets) vertically, use the rbind function. The two data frames must have the same variables, but they do not have to be in the same order.
      #splitting corona dataset
        corona3 <- corona[1:10000,]
        corona4 <- corona[10001:20572,]
        
      corona.full2 <- rbind(corona3, corona4)
  
  #If data frameA has variables that data frameB does not, then either:
    #- Delete the extra variables in data frameA or
    #- Create the additional variables in data frameB and set them to NA (missing) before joining them with rbind( ).

      
#-----------------------------#
### 1.3.5 Aggregating Data ####
#-----------------------------#
  #It is relatively easy to collapse data in R using one or more variables
  
  if(!require("dplyr")) install.packages("dplyr")
  library(dplyr)
  
  agg.corona <- corona %>% 
    group_by(continent, date) %>% 
    summarise(sum = sum(total_cases, na.rm = TRUE)) 
  

  

  

