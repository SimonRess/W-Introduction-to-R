Correlations
You can use the cor( ) function to produce correlations and the cov( ) function to produces covariances.

A simplified format is cor(x, use=, method= ) where

Option	Description
x	Matrix or data frame
use	Specifies the handling of missing data. Options are all.obs (assumes no missing data - missing data will produce an error), complete.obs (listwise deletion), and pairwise.complete.obs (pairwise deletion)
method	Specifies the type of correlation. Options are pearson, spearman or kendall.
# Correlations/covariances among numeric variables in
# data frame mtcars. Use listwise deletion of missing data.
cor(mtcars, use="complete.obs", method="kendall")
cov(mtcars, use="complete.obs")

Unfortunately, neither cor( ) or cov( ) produce tests of significance, although you can use the cor.test( ) function to test a single correlation coefficient.

The rcorr( ) function in the Hmisc package produces correlations/covariances and significance levels for pearson and spearman correlations. However, input must be a matrix and pairwise deletion is used.

# Correlations with significance levels
library(Hmisc)
rcorr(x, type="pearson") # type can be pearson or spearman

#mtcars is a data frame
rcorr(as.matrix(mtcars))

You can use the format cor(X, Y) or rcorr(X, Y) to generate correlations between the columns of X and the columns of Y. This similar to the VAR and WITH commands in SAS PROC CORR.

# Correlation matrix from mtcars
# with mpg, cyl, and disp as rows
# and hp, drat, and wt as columns
x <- mtcars[1:3]
y <- mtcars[4:6]
cor(x, y)

Other Types of Correlations
# polychoric correlation
# x is a contingency table of counts
library(polycor)
polychor(x)

# heterogeneous correlations in one matrix
# pearson (numeric-numeric),
# polyserial (numeric-ordinal),
# and polychoric (ordinal-ordinal)
# x is a data frame with ordered factors
# and numeric variables
library(polycor)
hetcor(x)


# partial correlations
library(ggm)
data(mydata)
pcor(c("a", "b", "x", "y", "z"), var(mydata))
# partial corr between a and b controlling for x, y, z

Visualizing Correlations
Use corrgram( ) to plot correlograms .

Use the pairs() or splom( ) to create scatterplot matrices.


##t-tests
The t.test( ) function produces a variety of t-tests. Unlike most statistical packages, the default assumes unequal variance and applies the Welsh df modification.
# independent 2-group t-test
t.test(y~x) # where y is numeric and x is a binary factor

# independent 2-group t-test
t.test(y1,y2) # where y1 and y2 are numeric

# paired t-test
t.test(y1,y2,paired=TRUE) # where y1 & y2 are numeric

# one sample t-test
t.test(y,mu=3) # Ho: mu=3

You can use the var.equal = TRUE option to specify equal variances and a pooled variance estimate. You can use the alternative="less" or alternative="greater" option to specify a one tailed test.

Nonparametric and resampling alternatives to t-tests are available.

Visualizing Results
Use box plots or density plots to visualize group differences.
