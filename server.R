library(gplots) ## for heatmap.2
library(RColorBrewer)
source('heatmap2.R')                     # overwrite heatmap.2 with my version

server <- function(input, output, session) {
  ## UPLOAD --------------------------------------------------------------------
  source("fileUpload/server.R", local=TRUE)

  ## CLUSTER --------------------------------------------------------------------
  source("clustering/server.R", local=TRUE)
}

