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


#------------------------------#
### Chapter 3.2: Line Plots ####
#------------------------------#
    #For line graphs, the data points must be grouped so that R knows which points to connect. In this case, it is simple – all points should be connected, so group=1. When more variables are used and multiple lines are drawn, the grouping for lines is usually done by variable (this is seen in later examples).

    # Basic line graph
        ggplot(data=corona[corona$continent=="Europe",], aes(x=date, y=new_cases, group=location)) +
            geom_line()
        #This would have the same result as above
            # ggplot(data=corona, aes(x=date, y=new_cases)) +
            #     geom_line(aes(group=location))

    # Add points
        ggplot(data=corona[corona$continent=="Europe",], aes(x=date, y=new_cases, group=location)) +
            geom_line() +
            geom_point()

    # Change color of both line and points
        # Change line type and point type, and use thicker line and larger points
        # Change points to circles with white fill
        ggplot(data=corona[corona$continent=="Europe",], aes(x=date, y=new_cases, group=location)) + 
            geom_line(colour="red", linetype="dashed", size=1.5) + 
            geom_point(colour="red", size=4, shape=21, fill="white")


    #Change the y-range to go from 0 to the maximum value in the total_bill column, and change axis labels
        ggplot(data=corona[corona$continent=="Europe",], aes(x=date, y=new_cases, group=location)) +
            geom_line() +
            geom_point() +
            expand_limits(y=0) +
            xlab("New cases") + ylab("Time") +
            ggtitle("Development of new corona cases in europe")

        
    #Plots with more variables
        #To draw multiple lines, the points must be grouped by a variable; otherwise all points will be connected by a single line. In this case, we want them to be grouped by sex.
    
        # Basic line graph with points
            ggplot(corona[corona$continent=="Europe" & corona$location %in% c("Greece", "Poland", "France", "Germany", "United Kingdom"),], aes(x=date, y=new_cases, group=location)) +
                geom_line() +
                geom_point()
        
        # Map sex to color
            ggplot(corona[corona$continent=="Europe" & corona$location %in% c("Greece", "Poland", "France", "Germany", "United Kingdom"),], aes(x=date, y=new_cases, group=location, colour=location)) +
                geom_line() +
                geom_point()
        
        # Map sex to different point shape, and use larger points
            ggplot(corona[corona$continent=="Europe" & corona$location %in% c("Greece", "Poland", "France", "Germany", "United Kingdom"),], aes(x=date, y=new_cases, group=location, shape=location)) +
                geom_line() +
                geom_point()
        
        
        # Use thicker lines and larger points, and hollow white-filled points
            ggplot(corona[corona$continent=="Europe" & corona$location %in% c("Greece", "Poland", "France", "Germany", "United Kingdom"),], aes(x=date, y=new_cases, group=location, shape=location)) + 
                geom_line(size=1.5) + 
                geom_point(size=3, fill="white") +
                scale_shape_manual(values=c(22,21,20,19,18))
     
     
