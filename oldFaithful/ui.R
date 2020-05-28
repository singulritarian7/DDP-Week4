library(shiny)
shinyUI(fluidPage(
    # Application title
    hr(),
    titlePanel("Old Faithful Geyser Data"),
    hr(),

    includeMarkdown("oldFaithful.Rmd"),
    hr(),
    
    inputPanel(
        selectInput("n_breaks", label = "Eruption Frequency",
                    choices = c(10, 20, 35, 50), selected = 20),
        
        sliderInput("bw_adjust", label = "Regression Line Adjustment",
                    min = 0.2, max = 2, value = .6, step = 0.2)
    ),
    fluidRow(
        hr(),
        plotOutput("distPlot"),
        hr()
    ) 
)
)
