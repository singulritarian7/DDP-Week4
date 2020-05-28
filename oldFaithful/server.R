library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        colors <- length(ggplot2:::bin_breaks_width(range(faithful), width = input$bw_adjust)$breaks) - 5L
        hist(faithful$eruptions, probability = TRUE, breaks = as.numeric(input$n_breaks),
             xlab = "Eruption Duration (minutes)", main = "Geyser Eruption Duration")
        
        dens <- density(faithful$eruptions, adjust = input$bw_adjust)
        lines(dens, col = "blue")

    })

})
