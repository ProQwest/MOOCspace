#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
train <- read.csv("~/train.csv")
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Survival on the Titanic"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
      sidebarPanel(
      selectInput("Sex", "Sex:", 
                  choices=levels(train$sex)),
    hr(),
    helpText("Created by Sethu Iyer")
      ),
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
