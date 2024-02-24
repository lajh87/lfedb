library(shiny)

df <- readr::read_csv("posts/exploratory-data-analysis/issues-processed.csv")

ui <- navbarPage(
  title = "LFE",
  tabPanel(
    "Data",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "topics",
          "Topics",
          choices = c("Acquisition"),
          multiple = TRUE
        )
      ),
      mainPanel(
        DT::dataTableOutput("dt")
      )
    )
  )
                 
  
)

server <- function(input, output, session) {
  
  output$dt <- DT::renderDataTable({
    df
  })
}

shinyApp(ui, server)