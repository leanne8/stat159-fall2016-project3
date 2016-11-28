library(shiny)
library(ggplot2)
topSchools <- read.csv("../../data/top_schools.csv")
load("../../data/multiple-linear-reg.RData")
load("../../data/rigde-reg.RData")
load("../../data/rigde1-reg.RData")
load("../../data/rigde2-reg.RData")
load("../../data/random-forest.RData")

ui <- fluidPage(
  titlePanel("High Achieving Students from Top Schools"),
  selectInput('tier', 'Choose the tier of earning', c("Top tier", "Middle tier", "Low tier")),
  selectInput('reg', 'Choose a regression method', c("Multiple Linear Regression",
                                                     "Ridge Regression", "Random Forest")),
  plotOutput("picture")
)

server <- function(input, output) {
  output$picture <- renderPlot({
    if(input$reg == "Ridge Regression" && input$tier == "Top tier") {
      plot(cv.out)
    }
    if(input$reg == "Ridge Regression" && input$tier == "Middle tier") {
      plot(cv.out2)
    }
    if(input$reg == "Ridge Regression" && input$tier == "Low tier") {
      plot(cv.out1)
    }
    
  })
}

shinyApp(ui = ui, server = server)