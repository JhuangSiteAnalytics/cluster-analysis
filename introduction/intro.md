# Objective
SparseData Cluster is a tool for interactive clustering and related analyses on any matrix-like data.

# Application
The items you want to cluster and rank are referred to as *observations* while the measurements made on the observations are referred to as *features*.

## Functionality
* *Upload*` : Upload your own flat files (comma, tab, or semi-colon delimited) for analysis.
* *Cluster* : Pair-wise correlation is computed between observations (by default, rows of matrix input) and displayed as a heatmap. A summary of the matrix is also given as plain text.
* *Rank* : Choose 2 observations to view an interactive table of the differences for each feature. Note that when data is log2 transformed during *Upload*, these will correspond to log fold changes.

# Example Data
Don't have your own data handy?  Download [mtcars](https://internal.shinyapps.io/gallery/066-upload-file/_w_ea0a7d8b/mtcars.csv) and then upload it in the **Upload** tab.

# Documentation
For more information, see the README on the [Github page](https://github.com/sparsedata/cluster-analysis).
