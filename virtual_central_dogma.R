library("shiny")
library("bslib")

source(file = "app_functions.R")
source(file = "ui.R")
source(file = "server.R")

shinyApp(
  ui = ui,
  server = server
)
