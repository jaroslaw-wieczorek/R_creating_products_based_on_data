# Title     : TODO
# Objective : TODO
# Created by: afar
# Created on: 09.12.2020

library(ggplot2)
library(maps)
library(mapproj)
library(shiny)
library(here)
library(dplyr)

census = readRDS(here("./lab8/www/data/census.rds"))
stany = map_data("state")
hrabstwa = map_data("county")

#census = readRDS("data/census.rds")
#library(tibble)
#as_tibble(census)
encoding <- "utf-8"

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Spis powszechny"),

  sidebarLayout(
    sidebarPanel(
      helpText("Stwórz mapy demograficzne za pomocą
                informacji ze spisu powszechnego USA w 2010 r."),

      selectInput("var",
                  label = "Wybierz zmienną do wyświetlenia",
                  choices = list("Procent ludności białej" = "white",
                                 "Procent Afroamerykanów"  = "black",
                                 "Procent Latynosów"       = "hispanic",
                                 "Procent Azjatów"         = "asian"),
                  selected = "Procent ludności białej"),

      sliderInput("range",
                  label = "Zakres:",
                  min = 0, max = 100, value = c(0, 100))
    ),

    mainPanel(plotOutput("mapa"))
  )
)
# Define server logic required to draw a histogram
server <- function(input, output) {

    output$mapa <- renderPlot({

        tyt.leg <- switch(input$var,
                         "white"    = "% ludności białej",
                         "black"    = "% Afroamerykanów",
                         "hispanic" = "% Latynosów",
                         "asian"    = "% Azjatów")

        filtr = paste(input$var, ">=", input$range[1], "&",
                      input$var, "<=", input$range[2])

        hr_cen_filt <-
            left_join(hrabstwa,
                      filter_(census, filtr),
                      by = c("region", "subregion"))

        ggplot() +
            geom_polygon(data = hr_cen_filt,
                         aes_string(x = "long",
                                    y = "lat",
                                    group = "group",
                                    fill = input$var),
                         colour = rgb(1,1,1,0.2)) +
            geom_polygon(data = stany,
                         mapping = aes(long,lat, group = group),
                         colour = "white",
                         fill = NA) +
            scale_fill_gradient(name = tyt.leg) +
            coord_quickmap() +
            theme_void()
  })
}
options(browser = 'chromium')
shinyApp(ui = ui, server = server)
#runApp(list(ui = ui, server = server), host="127.0.0.1", port=8995, launch.browser = TRUE)
