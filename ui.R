library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Hyper geometric tester!"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    #numericInput("obs", "obs:", 10),
    numericInput("sampleSize", "Sample size:", 10),
    numericInput("successes", "Successes in sample:", 10),
    numericInput("successesInPop", "Successes in population:", 20),
    numericInput("pop", "Population size:", 23000)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    verbatimTextOutput("summary")
    #plotOutput("distPlot")
  )
))