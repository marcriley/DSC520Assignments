# Assignment: ASSIGNMENT Scores
# Name: Riley, Marc
# Date: 2021-04-9
# Assignment 4.2 "Housing"


install.packages("ggplot2")
install.packages("pastecs")
install.packages("psych")
install.packages("readxl")
install.packages("plyr")
library(readxl)
library(pastecs)
library(ggplot2)
library(psych)
library(plyr)

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/Daffy/OneDrive/Documents/DSC520")

## Load the `housing` to
housing_df <- read_excel("housing.xlsx")
str(housing_df)


#get the average bedrooms
apply(housing_df[,15],MARGIN=2,mean, na.rm=TRUE)

#Use the aggregate function on a variable in your dataset
#Average slae price based on zip code

colnames(housing_df)[2] <- "Sale_Price"

aggregate(`Sale_Price` ~ zip5, housing_df, mean)

#Use the plyr function on a variable in your dataset – more specifically, I want to see you split some data, perform a modification to the data, and then bring it back together
ddply(housing_df, "Sale_Price", transform, total.count = sum(count))

#Check distributions of the data
ggplot(housing_df, aes(bedrooms)) + geom_histogram() + ggtitle("Total Bedrooms")+ xlab ("Number of Bedrooms")

ggplot(housing_df, aes(Sale_Price)) + geom_histogram(bins = 30L,) + ggtitle("Sale Price")+ xlab("Ammount Sold For")

#Identify if there are any outliers

describe(housing_df)
#outliers are shown more than 2 SD away from mean

#Create at least 2 new variables
#First variable gives us the price per living square foot
housing_df$price_sqfoot <- housing_df$Sale_Price/housing_df$square_feet_total_living
ggplot(housing_df, aes(price_sqfoot)) + geom_histogram(bins = 30L,) + ggtitle("Price Per SQ foot")+ xlab("Price")

#second varibale gives us the price per total sq foot
housing_df$price_totalsqfoot <- housing_df$Sale_Price/(housing_df$square_feet_total_living+housing_df$sq_ft_lot)
ggplot(housing_df, aes(price_totalsqfoot)) + geom_histogram(bins = 30L,) + ggtitle("Price Per Total SQ foot")+ xlab("Price")
