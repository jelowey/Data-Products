#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
colorchoices <- c("W","U","B","R","G")
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Ixalan Color Distribution"),
  
  # Sidebar with a input for which color to display
  sidebarLayout(
    sidebarPanel(
       radioButtons("color", "Select Color of Card", choices = colorchoices, inline = TRUE)
    ),
   
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
