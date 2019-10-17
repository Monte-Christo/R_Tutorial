install.packages("shiny")
library(shiny)

setwd("C:/Users/Edgar/Source/Repos/R_Tut")

# Hello World
ui <- fluidPage("Hello World of R!")
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

# input output app
ui <- fluidPage(titlePanel("In and Out"),
                sidebarLayout(sidebarPanel(sliderInput(
                  inputId = "num",
                  label = "Choose a number",
                  min = 0,
                  max = 100,
                  value = 25)),
                  mainPanel(textOutput(outputId = "text"))
                ))

server <- function(input, output) {
  output$text <- renderText({paste("You selected ", input$num)})
}

shinyApp(ui=ui, server=server)
load("MyTree.RData")

library(RColorBrewer)
palette <- brewer.pal(3, "Set2")

ui <- fluidPage(titlePanel("Iris Classifier"),
                sidebarLayout(sidebarPanel(
                  sliderInput(inputId = "petal.length",
                              label = "Petal length [cm]",
                              min = 1.0,
                              max = 8.0,
                              step = 0.2,
                              value = 4.0),
                  sliderInput(inputId = "petal.width",
                              label = "Petal width [cm]",
                              min = 0.0,
                              max = 3.0,
                              step = 0.1,
                              value = 1.5)),
                  mainPanel(
                    textOutput(outputId = "text"),
                    plotOutput(outputId = "plot")
                  )))

server <- function(input, output) {
  output$text = renderText({
    predictors <- data.frame(
      Petal.Length = input$petal.length,
      Petal.Width = input$petal.width,
      Sepal.Length = 0,
      Sepal.Width = 0)
    prediction = predict(
      object = model,
      newdata = predictors,
      type = "class")
    paste("Predicted species: ", as.character(prediction))
  })
  output$plot = renderPlot({
    plot(x=iris$Petal.Length, y=iris$Petal.Width,
         pch=19, col=palette[as.numeric(iris$Species)],
         main = "Petal length vs. width",
         xlab = "Length [cm]", ylab = "Width [cm]")
    partition.tree(model, label = "Species", add = TRUE)
    points(
      y = input$petal.width,
      x = input$petal.length,
      col = "Red",
      pch = 4,
      cex = 2,
      lwd = 2)
  })
}

shinyApp(ui=ui, server=server)
