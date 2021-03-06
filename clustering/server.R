## Create 2 output panels that depend on the data passed in
output$condPanel1 <- renderUI({
  if(input$update > updGlobal) {
    message("Updating Data...")
  }
  conditionalPanel(
    condition = "input.rem == true",
    selectizeInput('toRm', "Exclude",
                   choices=sort(rownames(datGlobal)),
                   multiple=TRUE)
  )
})
output$condPanel2 <- renderUI({
  if(input$update > updGlobal) {
    message("Updating Data...")
  }
  conditionalPanel(
    condition = "input.incl == true",
    selectizeInput('toIncl', "Include Only",
                   choices=sort(rownames(datGlobal)),
                   multiple=TRUE)
  )
})


output$summary <- renderPrint({
  if( is.null(datGlobal) && (input$update == updGlobal) ) {
    stop("No data uploaded")
  }
  summary(datGlobal)
})


## Combine the selected variables into a new data frame
selectedData <- reactive({
  if( is.null(datGlobal) && (input$update == updGlobal) ) {
    stop("No data uploaded")
  }
  features <- rownames(datGlobal)
  if (input$rem && input$incl) {
    stop("Cannot select both features to include and features to exclude")
  }
  if(input$rem) {
    features <- setdiff(features, input$toRm)
  } else if(input$incl) {
    features <- input$toIncl
  }
  if(input$update > updGlobal) {
    message("Updating Data...")
  }
  return(datGlobal[features, ])
})

output$plot1 <- renderPlot({
  selDat <- selectedData()
  corMat <- cor(selDat, method=input$method)
  op <- par(mar = c(12, 4.1, 2, 15), oma=c(6, 0, 0, 6))
  hmcols <- colorRampPalette(c("white","red"))(256)
  if(input$chooseBreaks) {
    if(all(corMat >= 0, na.rm=TRUE)) {
      breaks <- seq(0, 1, length.out=256+1) # must have 1 more break than color
    }
  } else {
    breaks <- NULL
  }
  hc <- hclust(dist(corMat, method=input$distMethod),
               method=input$clustMethod)
  ## hc <- hclust(dist(t(selDat), method=input$distMethod),
  ##              method=input$clustMethod)
  ## hc <- hclust(as.dist(1-cor(corMat, method="spearman")), method=input$clustMethod)
  ## cellnote does not have default argument of NULL so need an if statement
  ## here to include it or not
  if(input$showCors) {
    cellnote <- apply(round(corMat, 2), 2, as.character)
    heatmap2(corMat,
             Colv=as.dendrogram(hc), Rowv=as.dendrogram(hc),
             dendrogram="column", trace="none",
             breaks=breaks,
             cellnote=cellnote,
             notecol="black",
             density.info="hist",
             col=hmcols, scale="none")
  } else {
    heatmap2(corMat,
             Colv=as.dendrogram(hc), Rowv=as.dendrogram(hc),
             dendrogram="column", trace="none",
             breaks=breaks,
             density.info="hist",
             col=hmcols, scale="none")
  }

  par(op)
})
