## SIDEBAR

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem(
            "Upload",
            tabName = "upload",
            icon = icon("cloud-upload")
        ),
        menuItem(
            "Cluster",
            tabName = "cluster",
            icon = icon("sitemap")
        ),
        menuItem(
            "Acknowledgements",
            tabName = "acknowledgements",
            icon = icon("trophy")
        )
    )
)
