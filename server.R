#load data and work it up so the app runs correctly
#DDP Course Project
#Input food, get out chemical constituents and their potential health effects

# read in foods
all_foods <- read.csv("foods.csv")
compounds <- read.csv("compounds.csv")
health_effects <- read.csv("compounds_health_effects.csv")
comp_foods <- read.csv("compounds_foods.csv")

# remove unnecessary cols in prep for merge
fruits <- subset(all_foods, food_group == "Fruits")
fruits2 <- fruits[,1:2]
compounds2 <- compounds[,c(1,2,5)]
comp_foods2 <- comp_foods[,c(2,3,5)]
health_effects2 <- health_effects[,2:5]

#rename some cols to prevent confusion
names(fruits2) <- c("food_id", "food_name")
names(comp_foods2) <- c("compound_id", "food_id", "food_name")
names(compounds2) <- c("compound_id", "legacy_id", "compound_name")
names(health_effects2) <- c("compound_id", "health_effect_id", "health_effect_name", "compound_name")

#do the merge
#merge foods and compounds
foods_comps <- merge(fruits2, comp_foods2, by="food_id")
foods_comps2 <- foods_comps[,1:3]
# merge foods, compounds, and compound names
foods_comps3 <- merge(foods_comps2, compounds2, by="compound_id")
#merge the above with health effects
foods_comps4 <- merge(foods_comps3, health_effects2, by="compound_id")
foods_comps5 <- foods_comps4[,c(1,2,3,5,6,7)]
names(foods_comps5) <- c("compound_id", "food_id", "food_name", "compound_name",
                         "health_effect_id", "health_effect_name")
data <- foods_comps5
data_trunc <- unique(subset(data, food_name == "Kiwi" | food_name =="Pineapple" | food_name == "Custard apple" |
                              food_name == "Star fruit" | food_name == "Papaya" | food_name == "Strawberry" |
                              food_name == "Tamarind"))
## here is the app part
library(shiny)
shinyServer(
function(input, output){
  output$inputValue <- renderPrint(input$Fruit)
  output$comp_number <- renderPrint(length(unique(data_trunc[data_trunc$food_name == input$Fruit,4])))
  output$prediction <- renderTable(data_trunc[data_trunc$food_name == input$Fruit,c(4,6)])
}
)
