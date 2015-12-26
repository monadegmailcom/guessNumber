library(shiny)

guessMin <- 1
guessMax <- 101
numberOfGuesses <- 0
resetCount <- 0
greaterCount <- 0
lessCount <- 0
estimator <- 0

mid <- function()
{
  trunc((guessMax+guessMin) / 2)
}

shinyServer(function(input, output) {
    update <- reactive({
      if (resetCount != input$reset)
      {
        resetCount <<- input$reset
        guessMax <<- max(input$maxNumber+1, 1)
        estimator <<- ceiling(log2( input$maxNumber))
        guessMin <<- 1
        numberOfGuesses <<- 0
#        cat( "Is your number less then", mid(), "?")
      }
    })
    output$question <- renderPrint({
      update()
      input$greaterEqual
      input$less
      if (resetCount != 0)
      {
        if (lessCount != input$less)
        {
          lessCount <<- input$less
          guessMin <<- mid()
          numberOfGuesses <<- numberOfGuesses + 1
        }
        else if (greaterCount != input$greaterEqual)
        {
          greaterCount <<- input$greaterEqual
          guessMax <<- mid()
          numberOfGuesses <<- numberOfGuesses + 1
        }

        if (guessMax-guessMin <=1)
          cat("Your number is",guessMin)
        else
          cat("Is your number less than", mid(), "?")
      }
    })
    
    output$guessCount <- renderPrint({
      update()
      input$greaterEqual
      input$less
      cat( "My guesses", numberOfGuesses, "of", estimator)
    })
})