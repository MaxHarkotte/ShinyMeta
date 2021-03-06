#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



## ToDo
#' Scrolable
#' Wer hat was gemacht Doku 
#' Simulation
#' 

library(shiny)
library(metafor)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "The Shiny R Meta-Analyzer based on metafor"),
  dashboardSidebar(
    sidebarMenu(
    menuItem("Data Selection", tabName = "dataSel", icon = icon("file")),
    menuItem("Data Overview", tabName = "dataOvr", icon = icon("bar-chart")),
    menuItem("Meta Analysis", tabName = "MetaAna", icon = icon("resistance"))
    )
  ),
  
  dashboardBody(
    tabItems(
    tabItem(tabName = "dataSel", 
            fluidRow(
            box(title = "Data Selection",
              radioButtons("dataChoice", label = h3("Radio buttons"),
                 choices = list("Example Data" = 1, "Upload Data" = 2, "Simulate Data" = 3),
                 selected = 1),
           uiOutput("dataChoiceUI"),
          actionButton("refresh", "Load Data Set")
          ))),
    
    tabItem(tabName = "dataOvr",
            # fluidRow(
            # box(title = "Data Overview",
            #     uiOutput("dataUI"),
            #   width = NULL))
            div(style = 'overflow-x: scroll', DT::dataTableOutput("dataUI"))
            ),
    tabItem(tabName = "MetaAna",
            fluidRow(
              box(title = "I am a placeholder for a fancy meta-analysis")))
  )
)
)