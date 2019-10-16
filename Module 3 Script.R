setwd("C:/Users/Edgar/Source/Repos/R_Tut")
cars <- read.table(file="Cars.csv",  header=TRUE, sep = ",", quote="\"")
head(cars)
library(dplyr)
temp <- select(.data=cars,
               Transmission, Cylinders, Fuel.Economy)
head(temp)
temp <- filter(.data=temp, Transmission=="Automatic")
head(temp)
temp <- mutate(.data = temp, Consumption= 100 / (Fuel.Economy * 0.425))
head(temp)
temp <- group_by(.data = temp, Cylinders)
head(temp)
temp <- summarize(.data = temp, Avg.Consumption = mean(Consumption))
head(temp)
temp <- arrange(.data = temp, Avg.Consumption)
head(temp)
efficiency <- as.data.frame(temp)
head(efficiency)

###################
#    This is it
###################

cars <- read.csv("Cars.csv")

efficiency <- cars %>%
  select(Transmission, Cylinders, Fuel.Economy) %>%
  filter(Transmission=="Automatic") %>%
  mutate(Consumption= 100 / (Fuel.Economy * 0.425)) %>%
  group_by(Cylinders) %>%
  summarize(Avg.Consumption.In.l.per.100km = mean(Consumption)) %>%
  arrange(Avg.Consumption.In.l.per.100km) %>%
  as.data.frame()

write.csv(x=efficiency, file = "Fuel Efficiency.csv", row.names = FALSE)
