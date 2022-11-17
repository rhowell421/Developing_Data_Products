#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  slm <- lm(mpg ~ wt, mtcars) 
  
  pred_values <- reactive(coef(slm)[1] + coef(slm)[2] * input$input)
  
  output$outcome <- renderText({
    pred_values()
  })
   
    output$distPlot <- renderPlot({

      ggplot(mtcars, aes(wt, mpg)) +
        geom_point() +
        geom_smooth(aes(y = predict(lm(mpg ~ wt, mtcars))), method = lm) +
        geom_vline(xintercept = input$input, color = "red") +
        theme_bw() +
        labs(title = "Simple Linear Regression Model Predicting MPG by Weight") +
        xlab("Weight in 1000lbs") +
        ylab("Miles per Gallon (MPG)")
    })

})
