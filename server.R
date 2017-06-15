library(shiny)
library(ggplot2)

shinyServer(function(input, output) {    
  datasetInput <- reactive({    
    switch(input$plotType,           
      "point" = point,           
      "smooth" = smooth,           
      "boxplot" = boxplot,           
      "path" = path,           
      "line" = line })
#           "histogram" = histogram,
#           "freqpoly" = freqpoly,
#           "density" = density,
#           "bar" = bar  })

  output$summary <- renderPrint({    
    type <- datasetInput()    
    qplot(x=c(1,2,3,4,5,5,6,7,8),y=c(2,4,7,14,27,34,47,54,67),geom = c(type))      
  })  
  
  output$view <- renderTable({    
    head(datasetInput(), n = input$obs)  
  })
})
  