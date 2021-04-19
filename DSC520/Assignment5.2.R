# Assignment: ASSIGNMENT Scores
# Name: Riley, Marc
# Date: 2021-04-9
# Assignment 5.2 "Housing"

install.packages("tidyverse")
install.packages("readxl")
library(dplyr)
library(readxl)
library(purrr)

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/Daffy/OneDrive/Documents/DSC520")

## Load the `housing` to
housing_df <- read_excel("house.xlsx")
str(housing_df)
glimpse(housing_df)

#Sumarise Function
summarise(housing_df, mean_bedroom=mean(bedrooms))

#group_by() function and summarise

housing_df %>% group_by(`Sale Price`)  %>% summarise(mean_bedroom = mean(bedrooms))

#Filter by Zip and price
housing_df %>% filter(zip5 > mean(`Sale Price`, na.rm = TRUE))
housing_df %>% filter(bedrooms==3)

#Using Mutate to calculate price per Sq Foot
housing_df %>% mutate("Cost per SQ foot"=square_feet_total_living/`Sale Price`)

#using select function to select sale price/date/bedroom
housing_df %>% select(`Sale Price`)
housing_df %>% select(`Sale Price`,`Sale Date`,bedrooms)

#Using Arrange to show houses based on how many bedrooms
housing_df %>% arrange(desc(bedrooms))

#Purr Package

#Using the discrard to remove all houses built before 1990
built_year<-purrr::discard(housing_df$year_built, ~ .x<1990) 
str(built_year)

#using Keep to show all houses with 2 or more bedroom
Bedrooms_over2<-purrr::keep(housing_df$bedrooms, ~ .x>2)
str(Bedrooms_over2)

#using cbind to bind a new column called Average sale price
avg_saleprice<-apply(housing_df[,2],MARGIN=2,mean, na.rm=TRUE)
str(avg_saleprice)
avg_saleprice_new_column <- cbind(housing_df, avg_saleprice)

library(stringr)
 
dates <- str_split(housing_df$`Sale Date`, pattern = "-")


datedata <- data.frame(Reduce(rbind, dates))


names(datedata) <- c("Year", "Month", "Date")

# 
dateList <- sprintf("%s-%s-%s", datedata$Year, datedata$Month, datedata$Date)
head(dateListConcat)

