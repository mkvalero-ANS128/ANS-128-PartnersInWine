Wine_data=read.csv("/Users/mikaellavalero/Downloads/Wine.csv")
print(Wine_data)

moduleOne <- list(
  
  "ui" = fluidPage(
    selectInput("columnOfInterest", "Select column to plot", choices = colnames(Wine_data)),
    plotlyOutput("plot")
  ),
  
  "server" = function(input, output, session){
    
    output$plot <- plot_ly(Wine_data, x = ~Alcohol, y = ~get(input$columnOfInterest), type = "box")%>%
      layout(barmode = "group") %>%
      layout(yaxis = list(title = input$columnOfInterest)) %>%
      renderPlotly
    
  }
)


