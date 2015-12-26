library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("I guess your number"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    numericInput("maxNumber", 
                "Your number is between 1 and", 100),
    actionButton("reset", "Start new guess"),
    h3(""),
    actionButton("greaterEqual", "Yes"),
    actionButton("less", "No")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    verbatimTextOutput("question"),
    verbatimTextOutput("guessCount")
  )
))