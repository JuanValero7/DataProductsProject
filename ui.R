library(shiny)
library(ggplot2)
shinyUI(pageWithSidebar(
  headerPanel("Study of Statistics"),
  sidebarPanel(
    h1("Continuous statistics function"),
    h4("Select the distribution that you want to study"),
    radioButtons("type", "Distribution",
                 c("Exponential", "Normal","Uniform")
    ),
   numericInput("id2","Insert the number of simulations",100,min=100,max=1000,step=100),
   radioButtons("col","Color",c("light green","light blue","yellow")), 
   checkboxGroupInput("id1","Parameters",
                      c("Mean"="1",
                        "Variation"="2",
                        "Standar Deviation"="3")),
   submitButton("Submit")
                       
  ),
  
  mainPanel(
    plotOutput("plot1"),
    plotOutput("plot2"),
    verbatimTextOutput("oid1")
  )
)
)
