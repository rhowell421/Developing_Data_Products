#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Demonstrating Model Predictions"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          h5("Slide the weight predictor to calcuate expected MPG."),  
          sliderInput("input",
                        "Predictor - weight in 1000 lbs:",
                        min(mtcars$wt),
                        max(mtcars$wt),
                        median(mtcars$wt))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          h5("Predicted Outcome:"),
          textOutput("outcome"),  
          br(),
          plotOutput("distPlot")
        )
    )
))
