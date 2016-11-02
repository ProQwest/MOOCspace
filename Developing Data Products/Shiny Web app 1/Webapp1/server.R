#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
train <- read.csv("~/train.csv")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    table1 <- prop.table(table(train$sex,train$pclass,train$survived))
  output$distPlot <- renderPlot({
      barplot(table1[input$Sex,,1]*100, 
              main=paste("Percentage of ",input$Sex,"Survived grouped by Class"),
              ylab="Percentage Survived",
              xlab="Passenger Class")
    
  })
  
})
