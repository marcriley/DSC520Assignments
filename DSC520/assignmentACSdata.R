# Assignment: ASSIGNMENT 3.2
# Name: Riley, Marc
# Date: 2021-04-3

## Load the ggplot2 package
install.packages("ggplot2")
install.packages("pastecs")
install.packages("psych")
library(pastecs)
library(ggplot2)
library(psych)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/Daffy/OneDrive/Documents/DSC520")

## Load the `data/r4ds/heights.csv` to
acs_df <- read.csv("acs-14-1yr-s0201.csv")

#What are the elements in your data (including the categories and data types)?
#Categories= id, id2, popgroup, races reported, hsdegree, bachdegree

#output from str() nrow() ncoll() 
str(acs_df)
nrow(acs_df)
ncol(acs_df)

#Create a Histogram of the HSDegree variable using the ggplot2 package.
#Set a bin size for the Histogram.
#Include a Title and appropriate X/Y axis labels on your Histogram Plot
ggplot(acs_df, aes(HSDegree)) + geom_histogram(bins=15)+ggtitle('%of POP with HSDegree')+xlab("% of people with a HSDegree")+ylab("Occurences")

#Based on what you see in this histogram, is the data distribution unimodal? Yes
#Is it approximately symmetrical? No, Skewed left
#Is it approximately bell-shaped? Yes
#Is it approximately normal? No
#If not normal, is the distribution skewed? If so, in which direction? Yes Skewed Left
# Include a normal curve to the Histogram that you plotted. Would be normal if outliers were removed
#Explain whether a normal distribution can accurately be used as a model for this data.Yes there is currenlty one outlier making this histrogram skewed left. If that data was filtered a normal distribution would fit this data.
#Create a Probability Plot of the HSDegree variable
ggplot(acs_df, aes(sample=HSDegree)) + stat_qq() + stat_qq_line()

#Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know. No the data sets do not follow the probaibilty line close enough
#If not normal, is the distribution skewed? If so, in which direction? Explain how you know. Yes, skewed to the left, the points are under the probability line

#Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
stat.desc(acs_df)
describe(acs_df)
#In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation
#Using describe the skew was shown to be 4.98 which is well above a normal distribution. The kurtosis is greater than 3 meaning the distribution is not nomral. If the sample size were to increase it could help balance out our outliers providing us with a more normal distribution.

