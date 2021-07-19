#-------------------------#
# 2.4 Panel Regression ####
#-------------------------#

    #remove all objects from the environment
        rm(list = ls())

    #install required package
        if(!require(plm)) install.packages("plm") #usage of plm() 
            library(plm)

        if(!require(haven)) install.packages("haven") #usage of read_dta()
            library(haven)

    #Loading datasets
        #Stata-dataset
            allbus <- read_dta("Data/ALLBUScompact.2018.dta")
        #Excel-dataset
            corona <- read.csv2("Data/Corona.csv", header=TRUE)

    #Panel Regression
        #Estimate Regression
            fixed <- plm(C6_Stay.at.home.requirements ~ lead(new_cases_per_million, 10) + new_tests_per_thousand, data = corona, index=c("location", "date"), model="within")
        
        #Show results       
            summary(fixed)
