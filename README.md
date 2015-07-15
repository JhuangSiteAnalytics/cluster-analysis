SparseData Cluster
==================

# Objective
The goal of this project is to build a beautiful parser of data that can interpret matrix data (with a specific use-case being gene expression matrices) and construct basic interactive plots for data exploration and preliminary analyses.

# Get Started
Use the [online version](https://sparsedata.shinyapps.io/SparseData-Cluster) of SparseData Cluster. See Installation for details on installing locally.

## Functionality
* *Upload*` : Upload your own flat files (comma, tab, or semi-colon delimited) for analysis.
* *Cluster* : Pair-wise correlation is computed between observations (by default, rows of matrix input) and displayed as a heatmap. A summary of the matrix is also given as plain text.
* *Rank Features* : Choose 2 observations to view an interactive table of the differences for each feature. Note that when data is log2 transformed during *Upload*, these will correspond to log fold changes.

# Details

## Installation
### Dependencies
* This App depends on installation of the following R packages: `shiny` (version >= 0.12.1), `shinydashboard`, `shinyapps`, `markdown`, `gplots`, `RColorBrewer`.

### To Run:
Open app.R and run the code in an interactive R session in the same directory

## Organization
The application is organized into separate files as follows:

* `app.R` : The top-level application that sources the rest of the necessary files to build the app and calls the `shinyApp` function
* `global.R` : Globally needed packages and global variables to share data across multiple embedded apps
* `header.R` : constructs the header bar
* `sidebar.R` : constructs the sidebar; specific pages are delineated here via the `tabName` function, and are similarly defined in `body.R`
* `body.R` : page-level construction of each `tabName` specified in `sidebar.R`
* `server.R` : provides interactivity and backend calculations

# Acknowledgements
Stefan Avey constructed the underlying base, and Rob Amezquita applied a slick coat of paint on it.
