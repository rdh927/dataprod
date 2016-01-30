library(shiny)
shinyServer(
function(input, output){
  output$inputValue <- renderPrint(input$Fruit)
  output$prediction <- renderTable(data_trunc[data_trunc$food_name == input$Fruit,c(4,6)])
}
)
