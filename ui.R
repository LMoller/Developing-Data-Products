library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Predict Weight of Baby Chickens Over Time by Diet"),
  sidebarLayout(
    sidebarPanel(
       
       sliderInput("days","Number of Days Since Birth", min = 0,max = 21,value = 0),
       checkboxInput("diet1","Show Diet #1 Trend Line",value = TRUE),
       checkboxInput("diet2","Show Diet #2 Trend Line",value = TRUE),
       checkboxInput("diet3","Show Diet #3 Trend Line",value = TRUE),
       checkboxInput("diet4","Show Diet #4 Trend Line",value = TRUE),
       selectInput(inputId='var', label = h3('Show Data Points of Diet #...'),
                   choices = c(1,2,3,4)
       )
       
    ),
    mainPanel(
            helpText('Predict the weight of chicks over 21 days based on the diet they eat. Use the slider bar to predict chicks\'\ weight each day. The predicted weight will print at the bottom as well as show on the graph. Check or uncheck the boxes to show the abline for each diet. Use the dropdown to show the specific data points of the chosen diet.\n'),
       plotOutput("plotWeight"),
       h3("Predicted Weight From Diet 1:"),
       textOutput("diet1Result"),
       h3("Predicted Weight From Diet 2:"),
       textOutput("diet2Result"),
       h3("Predicted Weight From Diet 3:"),
       textOutput("diet3Result"),
       h3("Predicted Weight From Diet 4:"),
       textOutput("diet4Result")
    )
  )
))
