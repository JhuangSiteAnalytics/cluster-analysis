## app.R ##
library(shiny)
library(shinydashboard)
library(shinyapps)
library(markdown)

## Run Locally if interactive (but not when deployed to shinyapps.io
rm(list=ls())
if(interactive()) {
  source("global.R")
  source("ui.R")
  source("server.R") ## function(input, out)
  shinyApp(ui, server)
}

## or Deploy App
## shinyapps::deployApp(appName="SparseData-Cluster", account="sparsedata")

