#----------------------------------#
### Chapter 2: Basic Statistics ####
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
      data1 <- read.csv2("Data/data1.csv", header=TRUE)

#----------------------------------#
### 2.1 Descriptive Statistics  ####
#----------------------------------#
  #R provides a wide range of functions for obtaining summary statistics. One method of obtaining descriptive statistics is to use the sapply( ) function with a specified summary statistic.

  #get means for all variables in "corona" data frame (other possible functions: mean, sd, var, min, max, median, range, and quantile)
    sapply(corona[corona$location=="Germany",], mean, na.rm=TRUE) # excluding missing values


  #Functions & packages    
    #There are also numerous R functions designed to provide a range of descriptive statistics at once
      
    #summary()-function  
      #mean,median,25th and 75th quartiles,min,max
      summary(corona[,5:10]) #get statistics for 5th to 10th variable
      summary(corona[,c("total_cases","new_tests")]) #get statistics for variables "total_cases" and "new_tests"
      
    #fivenum()-function  
      #min, lower-hinge, median,upper-hinge, max
      fivenum(corona[,5]) # results of 5th variable
  
    #Hmisc package
      if(!require(Hmisc)) install.packages("Hmisc") #only install package if it's not already installed
      library(Hmisc)
      describe(corona[,5:10]) # n, nmiss, unique, mean, 5,10,25,50,75,90,95th percentiles, 5 lowest and 5 highest scores
  
    #pastecs package
      if(!require(pastecs)) install.packages("pastecs") #only install package if it's not already installed
      library(pastecs)
      stat.desc(corona[,5:10]) #nbr.val, nbr.null, nbr.na, min max, range, sum, median, mean, SE.mean, CI.mean, var, std.dev, coef.var
      
    #psych package
      if(!require(mnormt)) install.packages("mnormt") # <-psych-package relies on this package
      if(!require(psych)) install.packages("psych") #only install package if it's not already installed  // option: dependencies=TRUE
      library(psych)
      #use <packagename>::<command> when a command is included in several packages to specifies which one to use
        psych::describe(corona) # item name ,item number, nvalid, mean, sd, edian, mad, min, max, skew, kurtosis, se

    
  #Summary Statistics by Group
    #A simple way of generating summary statistics by grouping variable is available in the psych package.

    #describe.by()-function
      #syntax: describe.by(mydata, group,...)
      describe.by(corona[5:10], corona$continent)

      
      
  #Frequencies and Crosstabs
    #This section describes the creation of frequency and contingency tables from categorical variables, along with tests of independence, measures of association, and methods for graphically displaying results.

    #Generating Frequency Tables
      #R provides many methods for creating frequency and contingency tables. Three are described below. In the following examples, assume that A, B, and C represent categorical variables.

      #table
        #You can generate frequency tables using the table( ) function, tables of proportions using the prop.table( ) function, and marginal frequencies using margin.table( ).

        #2-Way Frequency Table
          mytable <- table(corona$continent, corona$total_cases) # A will be rows, B will be columns
          mytable # print table

          margin.table(mytable, 1) # A frequencies (summed over B)
          margin.table(mytable, 2) # B frequencies (summed over A)

          prop.table(mytable) # cell percentages
          prop.table(mytable, 1) # row percentages
          prop.table(mytable, 2) # column percentages

        #Multidimensional tables
          #table( ) can also generate multidimensional tables based on 3 or more categorical variables. In this case, use the ftable( ) function to print the results more attractively.

          # 3-Way Frequency Table
          mytable <- table(corona$continent, corona$date, corona$total_cases)
          ftable(mytable)

      #xtabs
        #The xtabs( ) function allows you to create crosstabulations using formula style input.
      
        # 3-Way Frequency Table
          mytable <- xtabs(~A+B+c, data=mydata)
          ftable(mytable) # print table
          summary(mytable) # chi-square test of indepedence

      #Crosstable
        #The CrossTable( ) function in the gmodels package produces crosstabulations modeled after PROC FREQ in SAS or CROSSTABS in SPSS. It has a wealth of options.
      
        #2-Way Cross Tabulation
          library(gmodels)
          CrossTable(mydata$myrowvar, mydata$mycolvar) #There are options to report percentages (row, column, cell), specify decimal places, produce Chi-square, Fisher, and McNemar tests of independence, report expected and residual values (pearson, standardized, adjusted standardized), include missing values as valid and annotate with row and column titles

