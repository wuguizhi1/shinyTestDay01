library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {

  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "point" = point,
           "smooth" = smooth,
           "boxplot" = boxplot,
           "path" = path,
           "line" = line)
  })

  # Generate a summary of the dataset
  
  output$summary <- renderPlott({
    dataset <- datasetInput()
    qplot(x=c(1,2,3,4,5,5,6,7,8),y=c(2,4,7,14,27,34,47,54,67),geom = c(dataset))
  })

  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
})
