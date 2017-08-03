library(shiny)

shinyServer(function(input, output) {
        model1 <- lm(weight ~ Time, subset(ChickWeight,Diet==1))
        model2 <- lm(weight ~ Time, subset(ChickWeight,Diet==2))
        model3 <- lm(weight ~ Time, subset(ChickWeight,Diet==3))
        model4 <- lm(weight ~ Time, subset(ChickWeight,Diet==4))

  model1pred <- reactive({
          predict(model1, newdata = data.frame(Time = input$days))
  })
  model2pred <- reactive({
          predict(model2, newdata = data.frame(Time = input$days))
  })      
  model3pred <- reactive({
          predict(model3, newdata = data.frame(Time = input$days))
  })
  model4pred <- reactive({
          predict(model4, newdata = data.frame(Time = input$days))
  })

  subDiet <- reactive({ChickWeight[which(ChickWeight$Diet==input$var),]})
  
        output$plotWeight <- renderPlot({
                plot(subDiet()$Time,subDiet()$weight, data=subDiet(),col=c("blue","green","red","purple")[subDiet()$Diet], xlab="Number of Days Since Birth", ylab="Weight of Chick (gm)")
 
        if(input$diet1){abline(model1,col="blue")}
        if(input$diet2){abline(model2,col="green")}
        if(input$diet3){abline(model3,col="red")}
        if(input$diet4){abline(model4,col="purple")}
      legend("topleft",c("Diet 1","Diet 2", "Diet 3", "Diet 4"),col=c("blue","green","red","purple"),lty=1,lwd=2)
      points(input$days,model1pred(),col="blue")
      points(input$days,model2pred(),col="green")
      points(input$days,model3pred(),col="red")
      points(input$days,model4pred(),col="purple")
      
    
  })
  output$diet1Result <- renderText({
          model1pred()
  })
  output$diet2Result <- renderText({
          model2pred()
  })
  output$diet3Result <- renderText({
          model3pred()
  })
  output$diet4Result <- renderText({
          model4pred()
  })
})
