## app.R ##
library(shiny)
library(shinydashboard)
library(shinyapps)

## Define structure of dashboard
source("header.R")
source("sidebar.R")
source("body.R")

ui <- dashboardPage(
    skin = "red",
    header, sidebar, body
)

## Define IO
source("server.R") ## function(input, out)

## Run Locally
shinyApp(ui, server)

## or Deploy App
shinyapps::deployApp(appName="Sparse Data Cluster", account="sparsedata")

