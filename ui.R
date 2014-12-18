library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Melanoma Kaplan-Meier Estimates"),
  sidebarPanel(
    h5('This shiny app displays Kaplan-Meier survival estimates based on the strata you select in the pulldown menu below.  It uses the melanoma dataset from the ISwR package.'),
    selectInput("mystrata", label = h3("Select Strata"), choices = list("Select Strata"=0,"None" = 1, "Sex" = 2), selected = 0)
        
    ),
  mainPanel(
    h3('KM Plot'),
    plotOutput("tte1"),
    h3('Results'),
    verbatimTextOutput("prediction1"),
    h3('Pageviews'),
    textOutput("counter")

    )
)
)