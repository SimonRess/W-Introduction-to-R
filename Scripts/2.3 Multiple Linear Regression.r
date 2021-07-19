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


#----------------------------------------#
### 2.3 Multiple (Linear) Regression  ####
#----------------------------------------#
  #R provides comprehensive support for multiple linear regression. The topics below are provided in order of increasing complexity.

  #Fitting the Model
    fit <- lm(C6_Stay.at.home.requirements ~ new_cases_per_million + new_tests_per_thousand, data = corona) #Calculation of multiple linear regression
    summary(fit) # show results
    
    #Other useful functions
      coefficients(fit) # model coefficients
      confint(fit, level=0.95) # CIs for model parameters
      fitted(fit) # predicted values
      residuals(fit) # residuals
      anova(fit) # anova table
      vcov(fit) # covariance matrix for model parameters
      influence(fit) # regression diagnostics

  #Diagnostic Plots
    #Diagnostic plots provide checks for heteroscedasticity, normality, and influential observerations.

    #diagnostic plots
      layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page
      plot(fit)
      
      
  #Comparing Models
    #You can compare nested models with the anova( ) function. The following code provides a simultaneous test that x3 and x4 add to linear prediction above and beyond x1 and x2.

    #Compare models
      fit1 <- lm(C6_Stay.at.home.requirements ~ new_cases_per_million, data = corona[!is.na(corona$new_tests_per_thousand),]) #datasets nneds to be of the same size, therefore exclude observation with missings on "new_tests_per_thousand"-variable
      fit2 <- lm(C6_Stay.at.home.requirements ~ new_cases_per_million + new_tests_per_thousand, data = corona)
      anova(fit1, fit2)


  #Regression Diagnostics
    #An excellent review of regression diagnostics is provided in John Fox's aptly named Overview of Regression Diagnostics. Dr. Fox's car package provides advanced utilities for regression modeling.

    # Assume that we are fitting a multiple linear regression
      # on the MTCARS data
      if(!require(car)) install.packages("car")
      library(car)
      fit <- lm(mpg~disp+hp+wt+drat, data=mtcars)

    #Outliers
      #Assessing Outliers
      outlierTest(fit) # Bonferonni p-value for most extreme obs
      qqPlot(fit, main="QQ Plot") #qq plot for studentized resid
      leveragePlots(fit) # leverage plots

      
    #Influential Observations
      #added variable plots
        avPlots(fit)
      #Cook's D plot
        # identify D values > 4/(n-k-1)
        cutoff <- 4/((nrow(mtcars)-length(fit$coefficients)-2))
        plot(fit, which=4, cook.levels=cutoff)
      #Influence Plot
        influencePlot(fit, id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )


    #Non-normality
      # Normality of Residuals
      # qq plot for studentized resid
        qqPlot(fit, main="QQ Plot")
      # distribution of studentized residuals
        if(!require(MASS)) install.packages("MASS")  
        library(MASS)
        sresid <- studres(fit)
        hist(sresid, freq=FALSE,
           main="Distribution of Studentized Residuals")
        xfit<-seq(min(sresid),max(sresid),length=40)
        yfit<-dnorm(xfit)
        lines(xfit, yfit)

    #Non-constant Error Variance
      # Evaluate homoscedasticity
      # non-constant error variance test
        ncvTest(fit)
      # plot studentized residuals vs. fitted values
        spreadLevelPlot(fit)

    #Multi-collinearity
      # Evaluate Collinearity
        vif(fit) # variance inflation factors
        sqrt(vif(fit)) > 2 # problem?
        
    #Nonlinearity
      # Evaluate Nonlinearity
        # component + residual plot
          crPlots(fit)
        # Ceres plots
          ceresPlots(fit)


    #Non-independence of Errors
      # Test for Autocorrelated Errors
      durbinWatsonTest(fit)


    # Global test of model assumptions
      if(!require(gvlma)) install.packages("gvlma")  
      library(gvlma)
      gvmodel <- gvlma(fit)
      summary(gvmodel)
