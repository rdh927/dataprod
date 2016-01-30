#Your Shiny Application

#Write a shiny application with associated supporting documentation. 


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
    submitButton('Submit'),
    verbatimTextOutput("documentation")
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Documentation", verbatimTextOutput("documentation")), 
      tabPanel("Results", h4('You entered'),
               verbatimTextOutput("inputValue"),
               h4('The number of compounds in that fruit is: '),
               verbatimTextOutput("comp_number"),
               h4('This fruit has the following compounds and health effects: '),
               tableOutput("prediction"))
    
  )
)))
