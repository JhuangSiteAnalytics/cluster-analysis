## app.R ##
library(shiny)
library(shinydashboard)
library(shinyapps)

## Run Locally if interactive (but not when deployed to shinyapps.io
if(interactive()) {
  source("ui.R")
  source("server.R") ## function(input, out)
  shinyApp(ui, server)
}

## or Deploy App
## shinyapps::deployApp(appName="SparseData-Cluster", account="sparsedata")

