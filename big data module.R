setwd("C:/Users/Edgar/Source/Repos/R_Tut")
library(ff)

irisff <- read.table.ffdf(file = "Iris.csv", FUN = "read.csv")
class(irisff)
head(irisff)
names(irisff)
irisff[1:5,]

library(biglm)

model <- biglm(data=irisff, formula=Petal.Width ~ Petal.Length)
summary(model)
plot(x=irisff$Petal.Length[], y=irisff$Petal.Width[],
     main="Iris petal length vs. width",
     xlab="Length [cm]", ylab="Width [cm]")

b <- summary(model)$mat[1,1]
m <- summary(model)$mat[2.1]
lines(x = irisff$Petal.Length[],
      y = m * irisff$Petal.Length[] + b,
      col = "red",
      lwd = 3
      )

predict(object = model,
        newdata = data.frame(Petal.Length = c(2.6,5,8),
                             Petal.Width = c(0,0,0)))
