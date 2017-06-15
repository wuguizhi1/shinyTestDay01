library(shiny)

shinyUI(pageWithSidebar(

  headerPanel("Shiny ggplot2 examples"),
  
  sidebarPanel(
    selectInput("dataset", "Choose a dataset:", 
                choices = c("point", "smooth", "boxplot","path","line")),

    numericInput("obs", "Number of observations to view:", 10)
  ),

  mainPanel(
    plotOutput("summary"),

    tableOutput("view")
  )
))
