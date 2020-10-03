library(shiny)
data("airquality")

ui <- fluidPage(
  titlePanel("Wind Measure"),
  
  sidebarLayout(
      sidebarPanel(
       sliderInput(
          inputId = "bins",
          label = "No of Bins: ",
          min = 1,
          max = 50,
          value = 25,
          step = 2,
          
      )
    ),
    mainPanel(
      
      plotOutput(outputId = "plot" )
      
     
    )
  )
)

server <- function(input,output)
{
  output$plot <- renderPlot({
    o <- airquality$Wind
    o <- na.omit(o)
    bins <- seq(min(o),max(o),length.out = input$bins +1)
    
    hist(o, breaks = bins, col = "#F5F5DC", border = "black",
         xlab = "Wind Level",
         main = "Histogram Wind level")
    
    
  })
  
}

shinyApp(ui = ui, server = server)

