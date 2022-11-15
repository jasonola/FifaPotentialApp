library(shiny)
library(bslib)
source("mod_potential.R")
source("functions.R")
source("variables.R")
ui <- fluidPage(
  theme = bs_theme(
    bg = "black",
    fg = "beige",
    primary = "orange"
  ),
  h1("Fifa potential app"),
  br(),
  potentialui("potentialui"),
  br(),
  div(style = "text-align: center",
      p(markdown("This app was built using Fifa data found on [Kaggle](https://www.kaggle.com/datasets/1898257a1915cbd22dd226f16c66dc218dfb65fd6f062755f4d0243bb8365a99?resource=download) "))),
      p(markdown("Check out the [code]() in my Github if you are interested in the code !"))
  )

server <- function(input, output) {
  callModule(potential, "potentialui")
}

shinyApp(ui = ui, server = server)
