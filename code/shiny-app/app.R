library(shiny)
library(glmnet)
topSchools <- read.csv("../../data/top_schools.csv")
load("../../data/multiple-linear-reg.RData")
load("../../data/rigde-reg.RData")
load("../../data/rigde1-reg.RData")
load("../../data/rigde2-reg.RData")
load("../../data/random-forest-top.RData")
load("../../data/random-forest-mid.RData")
load("../../data/random-forest-low.RData")

ui <- fluidPage(
  titlePanel("High Achieving Students from Top Schools"),
  sidebarLayout(
    sidebarPanel(
      selectInput('tier', 'Choose the tier of earning', c("Top tier", "Middle tier", "Low tier")),
      selectInput('reg', 'Choose a regression method', c("Multiple Linear Regression",
                                                         "Ridge Regression", "Random Forest"))
      
    ),
    
    mainPanel(
      tabsetPanel(
                  tabPanel("Plot", plotOutput("picture")), 
                  tabPanel("MSE", verbatimTextOutput("mse")), 
                  tabPanel("Coefficients", verbatimTextOutput("coeff")),
                  tabPanel("Comparison", plotOutput("compare"))
      )
    )
  
))

server <- function(input, output) {
  output$picture <- renderPlot({
    if(input$reg == "Ridge Regression" && input$tier == "Top tier") {
      plot(cv.out, main = "Top tier earning in Ridge Regression Cross Validation")
    }
    if(input$reg == "Ridge Regression" && input$tier == "Middle tier") {
      plot(cv.out2, main = "Middle tier earning in Ridge Regression Cross Validation")
    }
    if(input$reg == "Ridge Regression" && input$tier == "Low tier") {
      plot(cv.out1, main = "Low tier earning in Ridge Regression Cross Validation")
    }
    if(input$reg == "Multiple Linear Regression" && input$tier == "Top tier") {
      par(mfrow=c(2,2))
      plot(TopLM, main = "Top tier earning in Multiple Linear Regression")
    }
    if(input$reg == "Multiple Linear Regression" && input$tier == "Middle tier") {
      par(mfrow=c(2,2))
      plot(MidLM, main = "Middle tier earning in Multiple Linear Regression")
    }
    if(input$reg == "Multiple Linear Regression" && input$tier == "Low tier") {
      par(mfrow=c(2,2))
      plot(LowLM, main = "Low tier earning in Multiple Linear Regression")
    }
    if(input$reg == "Random Forest" && input$tier == "Top tier") {
      par(mfrow=c(1,2))
      plot(rfModel, main = "Top tier earning in Random Forest model")
      plot(varplot, main = "Variance Importance in Random Forest")
    }
    if(input$reg == "Random Forest" && input$tier == "Middle tier") {
      par(mfrow=c(1,2))
      plot(rfModelMid, main = "Middle tier earning in Random Forest model")
      plot(varplotMid, main = "Variance Importance in Random Forest")
    }
    if(input$reg == "Random Forest" && input$tier == "Low tier") {
      par(mfrow=c(1,2))
      plot(rfModelLow, main = "Low tier earning in Random Forest model")
      plot(varplotLow, main = "Variance Importance in Random Forest")
    }
  })
  output$mse <- renderPrint({
    if(input$reg == "Ridge Regression" && input$tier == "Top tier") {
      full_mse_ridge
    }
    else if(input$reg == "Ridge Regression" && input$tier == "Middle tier") {
      full_mse_ridge2
    }
    else if(input$reg == "Ridge Regression" && input$tier == "Low tier") {
      full_mse_ridge1
    }
    else if(input$reg == "Multiple Linear Regression" && input$tier == "Top tier") {
      TopMSE 
    }
    else if(input$reg == "Multiple Linear Regression" && input$tier == "Middle tier") {
      MidMSE
    }
    else if(input$reg == "Multiple Linear Regression" && input$tier == "Low tier") {
      LowMSE
    }
    else if(input$reg == "Random Forest" && input$tier == "Top tier") {
      imp
    }
    else if(input$reg == "Random Forest" && input$tier == "Middle tier") {
      impMid
    }
    else if(input$reg == "Random Forest" && input$tier == "Low tier") {
      impLow
    }
  })

  output$coeff <- renderPrint({
    if(input$reg == "Ridge Regression" && input$tier == "Top tier") {
      coeff_ridge
    }
    else if(input$reg == "Ridge Regression" && input$tier == "Middle tier") {
      coeff_ridge2
    }
    else if(input$reg == "Ridge Regression" && input$tier == "Low tier") {
      coeff_ridge1
    }
    else if(input$reg == "Multiple Linear Regression" && input$tier == "Top tier") {
      TopCoef 
    }
    else if(input$reg == "Multiple Linear Regression" && input$tier == "Middle tier") {
      MidCoef
    }
    else if(input$reg == "Multiple Linear Regression" && input$tier == "Low tier") {
      LowCoef
    }
    #Random Forest doesn't have coefficients
  })
  
  output$compare <- renderPlot({
    if(input$tier == "Top tier") {
      par(mfrow=c(2,4))
      plot(cv.out, main = "Top tier earning in Ridge Regression Cross Validation")
      plot(TopLM, main = "Top tier earning in Multiple Linear Regression")
      plot(rfModel, main = "Top tier earning in Random Forest model")
      plot(varplot, main = "Variance Importance in Random Forest")
      
    }
    else if(input$tier == "Middle tier") {
      par(mfrow=c(2,4))
      plot(cv.out2, main = "Middle tier earning in Ridge Regression Cross Validation")
      plot(MidLM, main = "Middle tier earning in Multiple Linear Regression")
      plot(rfModelMid, main = "Middle tier earning in Random Forest model")
      plot(varplotMid, main = "Variance Importance in Random Forest")
    }
    else if(input$tier == "Low tier") {
      par(mfrow=c(2,4))
      plot(cv.out1, main = "Low tier earning in Ridge Regression Cross Validation")
      plot(LowLM, main = "Low tier earning in Multiple Linear Regression")
      plot(rfModelLow, main = "Low tier earning in Random Forest model")
      plot(varplotLow, main = "Variance Importance in Random Forest")
    }

  })
  
}

shinyApp(ui = ui, server = server)