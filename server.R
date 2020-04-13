# server.R
#Adam Rucker Lab 8 Code
library(shiny)
source("helpers.R")
counties <- readRDS("./counties.rds")
library(maps) 
library(mapproj)


shinyServer(
  
    function(input, output) {
    
      output$map <- renderPlot({
      #print(input$range)
      #print(input$var)
      percent_map(var = switch(input$var, 'Percent White' = counties$white, 'Percent Black' = counties$black, 'Percent Hispanic' = counties$hispanic, 'Percent Asian' = counties$asian), color = switch(input$var, 'Percent White' = 'blue', 'Percent Black' = 'green', 'Percent Hispanic' = 'navy', 'Percent Asian' = 'purple'), legend.title = switch(input$var, 'Percent White' = 'Percent White', 'Percent Black' = 'Percent Black', 'Percent Hispanic' = 'Percent Hispanic', 'Percent Asian' = 'Percent Asian'), min = input$range[1], max = input$range[2])
      })
      
    }
  )
    