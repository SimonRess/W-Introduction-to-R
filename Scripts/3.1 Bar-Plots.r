#--------------------------------#
### Chapter 3: Basic Graphics ####
#--------------------------------#

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

#-----------------------------#
### Chapter 3.1: Bar Plots ####
#-----------------------------#
      
  #Basic graphs with discrete x-axis
    #With bar graphs, there are two different things that the heights of bars commonly represent:

      #1. The count of cases for each group – typically, each x value represents one group. This is done with stat_bin, which calculates the number of cases in each group (if x is discrete, then each x value is a group; if x is continuous, then all the data is automatically in one group, unless you specifiy grouping with group=xx).
      #2. The value of a column in the data set. This is done with stat_identity, which leaves the y values unchanged.
        #Overview of usage
          #Continuous	Count:	Histogram
          #Discrete	Count:	Bar-graph
          #Continuous	Value:	Bar-graph
          #Discrete	Value:	Bar-graph
      
      #In ggplot2, the default is to use stat_bin, so that the bar height represents the count of cases.

      
  #Bar graphs of values

    #Load the ggplot2 package
      if(!require(ggplot2)) install.packages("ggplot2")
      library(ggplot2)

    #Very basic bar graph
      ggplot(data=corona[corona$date=="2020-06-01",], aes(x=continent, y=new_cases)) +  # continent: x-axis and sometimes color fill / new_cases_per_million: y-axis (height of the bar)
          geom_bar(stat="identity") # -> height of the bar represents the value in a column of the data frame


    #Map the continent to different fill colors
      ggplot(data=corona[corona$date=="2020-06-01",], aes(x=continent, y=new_cases, fill=continent)) +
          geom_bar(stat="identity")

      #This would have the same result as above
        # ggplot(data=corona, aes(x=continent, y=new_cases_per_million)) +
        #    geom_bar(aes(fill=continent), stat="identity")


    #Add a black outline
      ggplot(data=corona[corona$date=="2020-06-01",], aes(x=continent, y=new_cases, fill=continent)) +
          geom_bar(colour="black", stat="identity") # See http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/ for more information on colors


    #No legend, since the information is redundant
      ggplot(data=corona[corona$date=="2020-06-01",], aes(x=continent, y=new_cases, fill=continent)) +
        geom_bar(colour="black", stat="identity") +
        guides(fill=FALSE)
    

    #Add title, narrower bars, fill color, and change axis labels
      ggplot(data=corona[corona$date=="2020-06-01",], aes(x=continent, y=new_cases, fill=continent)) + 
          geom_bar(colour="black", fill="#DD8888", width=.8, stat="identity") + 
          guides(fill=FALSE) +
          xlab("Continent") + ylab("New cases / million") +
          ggtitle("New corona cases per continent on 06/01/2020")

      
    #Bar graph of counts
      ggplot(data=corona[corona$date=="2020-06-01",], aes(x=C5_Close.public.transport)) +
          geom_bar(stat="count")
        #thinner bars
        ggplot(data=corona[corona$date=="2020-06-01",], aes(x=C5_Close.public.transport)) +
          geom_bar(stat="bin")


  #Graphs with more variables
    #This data will be used for the examples below:

    dat1 <- data.frame(sex = factor(c("Female","Female","Male","Male")),
                       time = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
                       total_bill = c(13.53, 16.81, 16.24, 17.42)
                       )
    dat1


  #Bar graphs
    #These are the variable mappings used here:
      #time: x-axis
      #sex: color fill
      #total_bill: y-axis
    
    #Stacked bar graph -- this is probably not what you want
      ggplot(data=dat1, aes(x=time, y=total_bill, fill=sex)) +
          geom_bar(stat="identity")

    #Bar graph, time on x-axis, color fill grouped by sex -- use position_dodge()
      ggplot(data=dat1, aes(x=time, y=total_bill, fill=sex)) +
          geom_bar(stat="identity", position=position_dodge())
        #black outline 
          ggplot(data=dat1, aes(x=time, y=total_bill, fill=sex)) +
              geom_bar(stat="identity", position=position_dodge(), colour="black")
        #Change colors
          ggplot(data=dat1, aes(x=time, y=total_bill, fill=sex)) +
              geom_bar(stat="identity", position=position_dodge(), colour="black") +
              scale_fill_manual(values=c("#999999", "#E69F00"))

    #Bar graph, sex on x-axis, color fill grouped by time -- use position_dodge()
      ggplot(data=dat1, aes(x=sex, y=total_bill, fill=time)) +
          geom_bar(stat="identity", position=position_dodge(), colour="black")
