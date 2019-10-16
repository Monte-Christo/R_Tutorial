setwd("C:/Users/Edgar/Source/Repos/R_Tut")
cars <- read.table(file="Cars.csv",  header=TRUE, sep = ",", quote="\"")
head(cars)
library(dplyr)
temp <- select(.data=cars,
               Transmission, Cylinders, Fuel.Economy)
head(temp)
