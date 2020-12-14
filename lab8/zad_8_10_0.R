# Title         : TODO
# Objective : TODO
# Created by: afar
# Created on: 09.12.2020

library(shinydashboard)
library(ggplot2)
library(dplyr)
library(here)

census = readRDS(here("./lab8/www/data/census.rds"))
stany = map_data("state")
hrabstwa = map_data("county")
values = 0

# base functions
p <- ggplot(data = data.frame(x=0), mapping = aes(x = x))
f <- function(x) 1 / (1+ exp(-x))
cut <- function(x) 0.1

# Define UI for application that draws a histogram
ui <- fluidPage(
        titlePanel(
                h1("Ovarian tumor risk of malignancy index calculator (IOTA LR2)")),

        sidebarLayout(
                sidebarPanel(
                        sliderInput("wiek",
                                label = "Wiek pacjentki:",
                                min = 14, max = 100, value = 0),

                        selectInput("wodobrzusze",
                                label = "Obecność wodobrzusza:",
                                choices = list("tak" = 1,
                                                             "nie" = 0),
                                selected = 0),

                        selectInput("przeplyw_krwi",
                                label = "Obecność przepływu krwi w obrębie wyrostków brodawkowatych:",
                                choices = list("tak" = 1,
                                                             "nie" = 0),
                                selected = 0),

                        sliderInput("element_lity",
                                label = "Największa średnica elementu litego(w mm):",
                                min = 0, max = 50, value = 0),
                        
                        selectInput("sciana_wewnetrzna",
                                label = "Ieregularna ściana wewnętrzna cysty:",
                                choices = list("tak" = 1,
                                                             "nie" = 0),
                                selected = 0),
                        
                        selectInput("cien_akustyczny",
                                label = "Obecność cieni akustycznych:",
                                choices = list("tak" = 1,
                                                             "nie" = 0),
                                selected = 0),
                        
                        actionButton(inputId = "wykres_action", label = "Calculate")
        ),

        mainPanel(
                h5("This application is designed for gynaecologists and implements ovarian tumor risk malignancy index based on IOTA LR2 algorithm. It also visualises an output of the logistic regression."),
                h5("For a detailed description of the algorithm please refer to the paper: Timmerman D, Testa AC, Bourne T, [et al.]. Logistic regression model to distinguish between the benign and malignant adnexal mass before surgery: a multicenter study by the International Ovarian Tumor Analysis Group. J Clin Oncol. 2005, 23, 8794-8801."),
                h1("Malignancy prediction algorithm"),
                h5("In general, LR2 algorithm predicts a tumor as a benign when a patient is young, a solid component of lesion is small and acoustic shadows are present. You may check it empirically by different combinations of input values."),
                h5("Fill in the form and click Calculate button."),
                #plotOutput("wykres"),

                textOutput("werdykt"),
                #plotOutput("wykres", height = 300),
                plotOutput("wykres_wykres_show", height = 300)
                )
                
        )
)

server <- function(input, output) {

    z = reactive({
        -5.3718+
            input$wiek * 0.0354 +
            strtoi(input$wodobrzusze, base = 0L) * 1.6159 +
            strtoi(input$przeplyw_krwi, base = 0L) * 1.1768 +
            input$element_lity * 0.0697 +
            strtoi(input$sciana_wewnetrzna, base = 0L) * 0.9586 -
            strtoi(input$cien_akustyczny, base = 0L) * 2.9486
    
    })
    
    observeEvent(input$wykres_action, {
        output$werdykt = renderText({
            paste("Prediction:", f(z())) })
    })


    observeEvent(input$wykres_action, {
        output$wykres_wykres_show = renderPlot({
        p +
            stat_function(
                fun = f) +
            stat_function(
                fun = cut,
                linetype = "dashed") +
            xlim(-8,8) +
            geom_point(
                aes(x = z(),
                    y = f(z())),
                colour = "blue") +
            geom_text(x = 6, y = 0.20, label = "Degree of cancer malignancy") +
            labs(x = "Permission", y = "Prediction")

        })
    })
}
options(browser = 'chromium')
shinyApp(ui = ui, server = server)
#runApp(list(ui = ui, server = server), host="127.0.0.1", port=8995, launch.browser = TRUE)
