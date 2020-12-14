# Title     : TODO
# Objective : TODO
# Created by: afar
# Created on: 09.12.2020

library(shiny)
library(here)


encoding <- "utf-8"

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Spis powszechny"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h4("Stwórz mapy demograficzne za pomocą informacji ze spisu powszechnego USA w 2010 r.", style="color:gray"),
            selectInput("var", label="Wybierz zmienną do wyświetlenia:",
                c(
                    "Procent ludności białej" = 1,
                    "Procent Afroamerykanów" = 2,
                    "Procent Latynosów" = 3,
                    "Procent Azjatów" = 4), selected = 1),

            sliderInput("range", h3(strong("Zakres:")), min = 0, max = 100, value = c(0, 100)),
            width = 3
        ),
      # Show a plot of the generated distribution
        mainPanel(
            textOutput("selected_var"),
            textOutput("selected_range")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$selected_var <- renderText({
    paste("Zaznaczyłeś opcję:", input$var)
  })
    output$selected_range <- renderText({
    paste("#Wybrałeś zakres od", input$range[1]," do:", input$range[2])
  })

}
options(browser = 'chromium')
shinyApp(ui = ui, server = server)
#runApp(list(ui = ui, server = server), host="127.0.0.1", port=8995, launch.browser = TRUE)
