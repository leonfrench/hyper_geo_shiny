library(shiny)

prettyPrint <- function(frontstring, q, value){
  format <- if(value < 0.001) '%.3e' else '%.3f'
  cat(sprintf(paste(frontstring,format, "\n"), q, value))
}

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {

  
  output$summary <- renderPrint({
    m <- input$successesInPop
    n <- input$pop - input$successesInPop
    x <- input$successes
    q <- input$successes
    k <- input$sampleSize
    
    expected <- m/input$pop * k
    cat(sprintf("\nExpected successes in sample: %.2f\n\n", expected))
    
    
    prettyPrint("X = %i, p = ", q, dhyper(x, m, n, k))
    cat("\n")
    prettyPrint("X < %i, p = ", q, phyper(q, m, n, k, lower.tail = TRUE) - dhyper(x, m, n, k))
    prettyPrint("X <= %i, p = ", q, phyper(q, m, n, k, lower.tail = TRUE))
    cat("\n")
    
    prettyPrint("X > %i, p = ", q, phyper(q, m, n, k, lower.tail = FALSE))
    prettyPrint("X >= %i, p = ", q, phyper(q, m, n, k, lower.tail = FALSE)  + dhyper(x, m, n, k))
    
    cat(sprintf("\nCode at: https://github.com/leonfrench/hyper_geo_shiny"))
    
    
    #dhyper(input$successes, input$successesInPop, input$pop - input$successesInPop, input$sampleSize)
    #x <- sprintf("X = %i, p = %e\n", input$successes,dhyper(input$successes, input$successesInPop, input$pop - input$successesInPop, input$sampleSize))
    #at(x)
  })
  
  output$distPlot <- renderPlot({
    # generate an rnorm distribution and plot it
    dist <- rnorm(input$obs)
    hist(dist)
  })
})