setwd("C:/Users/Edgar/Source/Repos/R_Tut")

install.packages("caret")
install.packages("e1071")  # otherwise error occurs
library(tree)

data(iris)

# this is close to the course model

set.seed(15)
indexes <- sample(x=1:150, size=100)
train <- iris[indexes,]
test <- iris[-indexes,]

# note: model may differ from course model because of different versions of packages and R
model <- tree(formula = Species ~ ., data = train)
summary (model)
plot(model)
text(model)

library(RColorBrewer)
palette <- brewer.pal(3, "Set2")
plot(x=iris$Petal.Length, y=iris$Petal.Width,
     pch=19, col=palette[as.numeric(iris$Species)],
     main = "Petal length vs. width",
     xlab = "Length [cm]", ylab = "Width [cm]"
)
partition.tree(tree = model, label = "Species", add = TRUE)

prediction <- predict(object = model, newdata = test, type = "class")
table(x = prediction, y=test$Species)

library(caret)
confusionMatrix(data= prediction, reference = test$Species)

save(model, file = "MyTree.RData")

# Alternative

set.seed(13)
indexes2 <- sample(x=1:150, size=100)
train2 <- iris[indexes2,]
test2 <- iris[-indexes2,]

# note: model may differ from course model because of different versions of packages and R
model2 <- tree(formula = Species ~ ., data = train2)
summary (model2)
plot(model2)
text(model2)

library(RColorBrewer)
palette <- brewer.pal(3, "Set2")
plot(x=iris$Petal.Length, y=iris$Sepal.Length,
     pch=19, col=palette[as.numeric(iris$Species)],
     main = "Petal length vs. Sepal length",
     xlab = "Length [cm]", ylab = "Width [cm]"
)
partition.tree(tree = model2, label = "Species", add = TRUE)

prediction2 <- predict(object = model2, newdata = test2, type = "class")
table(x = prediction2, y=test2$Species)

library(caret)
confusionMatrix(data= prediction2, reference = test2$Species)

save(model, file = "MyTree2.RData")
