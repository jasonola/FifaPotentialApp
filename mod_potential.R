potentialui <- function(id) {
  ns <- NS(id)
  sidebarLayout(sidebarPanel(
    sliderInput(
      ns("age"),
      label = "Select age:",
      min = min(ageRange),
      max = max(ageRange),
      value = c(18, 20)
    ),
    sliderInput(
      ns("obs"),
      label = "Select number of players to display:",
      min = 1,
      max = 40,
      value = 20
    ),
    sliderInput(
      ns("gen"),
      label = "Select general score range:",
      min = 47,
      max = 100,
      value = c(70,100)
    ),
  ),
  mainPanel(plotOutput(ns("plot"))))
}

potential <- function(input, output, session) {
  ns <- session$ns
  output$plot <- renderPlot({
      plot_potential(fifa,
                     input$age,
                     input$obs,
                     input$gen)
  })
}



