setwd("C:/Users/Edgar/Source/Repos/R_Tut")
cars <- read.csv("Cars.csv")

library(ggplot2)

ggplot(data=cars, aes(x=Transmission)) +
  geom_bar() +
  ggtitle("Cars by Transmission Type") +
  xlab("Transmission Type") +
  ylab("Number of Cars")

ggplot(data=cars, aes(x=Fuel.Economy)) +
  geom_histogram(bins=10) +
  ggtitle("FuelEconomy Distribution") +
  xlab("Fuel Economy [mpg]") +
  ylab("Number of Cars")

ggplot(data=cars, aes(x=Fuel.Economy)) +
  geom_density() +
  ggtitle("FuelEconomy Distribution") +
  xlab("Fuel Economy [mpg]") +
  ylab("Density")

ggplot(data=cars, aes(x=Cylinders, y=Fuel.Economy)) +
  geom_point() +
  ggtitle("FuelEconomy by Cylinders") +
  ylab("Fuel Economy [mpg]") +
  xlab("Number of Cylinders")
