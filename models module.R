data(iris)
head (iris)

plot(x=iris$Petal.Length, y=iris$Petal.Width,
     main="Iris petal length vs. width",
     xlab="Length [cm]", ylab="Width [cm]")

model <- lm(formula=Petal.Width ~ Petal.Length, data=iris)
summary(model)

lines (x=iris$Petal.Length, y=model$fitted, col="red", lwd=3)

cor (x=iris$Petal.Length, y=iris$Petal.Width)

predict(object=model, newdata = data.frame(Petal.Length=c(2.6,5,8)))
