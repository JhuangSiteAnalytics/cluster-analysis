## myData <- reactive({
##   ## Update the data with checkbox input
##   if(input$update) {
##     dat <- datGlobal
##     dat
##   }
## })

## Create 2 output panels to choose the observations
output$obs1 <- renderUI({
  selectInput('sam1', "Choose Observation 1",
              choices=sort(colnames(myData())),
              multiple=FALSE)
})
output$obs2 <- renderUI({
  selectInput('sam2', "Choose Observation 2",
              choices=sort(colnames(myData())),
              multiple=FALSE)
})

## Rank features
ranks <- reactive({
  dat <- myData()
  fcs <- dat[,input$sam1,drop=FALSE] - dat[, input$sam2, drop=FALSE]
  colnames(fcs) <- paste(input$sam1, input$sam2, sep='-')
  fcs <- fcs[order(abs(fcs), decreasing=TRUE),,drop=FALSE]
  fcs <- data.frame(Features=rownames(fcs), fcs, check.names=FALSE)
  return(fcs)
})

output$rankTable <- renderDataTable({
  ranks()
}, options = list(lengthMenu = c(5, 10, 30, 50, 150), pageLength = 10))


