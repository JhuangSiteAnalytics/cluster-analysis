## GET STARTED ----------------------------------------------------------------------
source('introduction/intro.R', local=TRUE)

start <- tabItem(
  tabName = "start",
  start.box
)

## UPLOAD ----------------------------------------------------------------------
source('fileUpload/ui.R', local=TRUE)

upload <- tabItem(
  tabName = "upload",
  upload.box
  ## fluidRow(
  ##     box(
  ##         plotOutput("plot1", height = 250)),
  ##     box(
  ##         title = "Controls",
  ##         sliderInput("slider", "Number of observations:", 1, 100, 50)
  ##     )
  ## )
)

## CLUSTER ---------------------------------------------------------------------
source('clustering/ui.R', local=TRUE)

cluster <- tabItem(
  tabName = "cluster",
  cluster.box
)

## RANKING ---------------------------------------------------------------------
source('ranking/ui.R', local=TRUE)

ranking <- tabItem(
  tabName = "ranking",
  ranking.box
)


## ACKNOWLEDGEMENTS ------------------------------------------------------------
acknowledgements <- tabItem(
  tabName = "acknowledgements",
  tags$p("Powered by RStudio Shiny + shinydashboard, Github,
            and Coffee (the caffeinated beverage)."),
  tags$footer(
    tags$p(
      tags$a("View Source Code on Github", href = "https://github.com/sparsedata/cluster-analysis")
    ),
    tags$p(
      tags$small(tags$em(
        "Version 0.0.2002 - Last Updated 2015-07-14"
      ))
    )
  )
)

## BODY ------------------------------------------------------------------------
body <- dashboardBody(
  tabItems(
    start,
    upload,
    cluster,
    ranking,
    acknowledgements
  )
)
