#Your Shiny Application

#Write a shiny application with associated supporting documentation. 
#The documentation should be thought of as whatever a user will need to get started using your application.
#Deploy the application on Rstudio's shiny server
#Share the application link by pasting it into the text box below
#Share your server.R and ui.R code on github
#The application must include the following:


#The documentation should be at the Shiny website itself. Do not post to an external link.
library(shiny)
shinyUI(
  pageWithSidebar(
    #Application title
  headerPanel("Does your fruit contain harmful compounds?"),
    #Drop-down input selection
  sidebarPanel(
    selectInput(inputId = 'Fruit', label = 'fruit', choices= c('Kiwi', 'Pineapple', 'Custard apple', 'Star fruit', 
                'Papaya', 'Strawberry', 'Tamarind'), selected = 'Kiwi', multiple=FALSE, selectize=TRUE),
    submitButton('Submit')
  ),
  mainPanel(
    h4('You entered'),
    verbatimTextOutput("inputValue"),
    h4('Which has the following compounds and health effects: '),
    tableOutput("prediction")
  )
))
