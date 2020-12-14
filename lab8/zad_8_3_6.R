# Title     : TODO
# Objective : TODO
# Created by: afar
# Created on: 09.12.2020

library(shiny)
library(here)



# Define UI for application that draws a histogram
ui <- fluidPage(

   # Application title
   titlePanel("Moja aplikacja Shiny"),

   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
          h1("Instalacja", align = "left"),
          h4("Shiny jest dostępny w repozytorium ", br(), "CRAN, więc możesz zainstalować go", br()," w zwykły sposób z konsoli R:"),
          code(h4("install.packages('shiny')"), align = "left"),
          br(),
          img(src = 'rstudio.png', height = 93, width = 270),
          br(),
          HTML("Shiny jest produktem <text style='color:red;'>RStudio</text>"),
          width = 3
      ),
      # Show a plot of the generated distribution
      mainPanel(
          h1("Wprowadzenie do Shiny"),
          h4("Shiny jest nowym pakietem RStudio, który bardzo ułatwia tworzenie interaktywnych aplikacji", br(), " internetowych w R."),
          br(),
          h4("Dużo informacji i przykładów znaduje się na", a(href="https://shiny.rstudio.com/", "stronie Shiny")),
          br(),
          br(),
          h1("Ficzery"),

          h4("- Twórz użyteczne aplikacje internetowe zaledwie kilkoma liniami kodu - nie jest wymagana", br(), " znajomość JavaScript."),

          h4("- Aplikacje Shiny aktualizują się tak samo ", strong("szybko"), " jak arkusze danych np. Excel. Wyniki ", br(), "zmieniją się natychmiast -
            gdy użytkownicy modyfikują dane wejściowe, nie ma konieczności ", br(), "ponownego przeładowywania strony."),
          h4(""),

      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

   #output$distPlot <- renderPlot({
   #   # generate bins based on input$bins from ui.R
   #   x    <- faithful[, 2]
   #   bins <- seq(min(x), max(x), length.out = input$bins + 1)
   #
   #   # draw the histogram with the specified number of bins
   #   hist(x, breaks = bins, col = 'darkgray', border = 'white')
   #})
}
options(browser = 'chromium')
shinyApp(ui = ui, server = server)
#runApp(list(ui = ui, server = server), host="127.0.0.1", port=8995, launch.browser = TRUE)
