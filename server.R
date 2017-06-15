library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  datasetInput <- reactive({
    switch(input$dataset,
           "point" = point,
           "smooth" = smooth,
           "boxplot" = boxplot,
           "path" = path,
           "line" = line)
  })
  
  output$summary <- renderPlot({
    dataset <- datasetInput()
    qplot(x=c(1,2,3,4,5,5,6,7,8),y=c(2,4,7,14,27,34,47,54,67),geom = c("point"))
  })

})
