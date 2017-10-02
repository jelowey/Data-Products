#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    #Load card data
    colorcodes <- c("White", "Blue", "Black", "Red", "Green", "Gold")
    xlndf<- read.csv("https://raw.githubusercontent.com/miniace/Data-Products/master/xlndf.csv")
    xlndf$identity<-as.factor(xlndf$identity)
    if(input$color == 'G'){graphcol<- colorcodes[5]}
    if(input$color == 'W'){graphcol<-colorcodes[1]}
    if(input$color == 'U'){graphcol<-colorcodes[2]}
    if(input$color == 'B'){graphcol<-colorcodes[3]}
    if(input$color == 'R'){graphcol<-colorcodes[4]}
    if(input$color == 'Multicolor'){graphcol<-colorcodes[6]}
    categorizeddata <- filter(xlndf, identity ==input$color)
    # generate histogram based on radio button clicked
    ggplot(categorizeddata, aes(x=cmc))+geom_histogram(stat="count", fill=graphcol)
    
    
  })
  
})
