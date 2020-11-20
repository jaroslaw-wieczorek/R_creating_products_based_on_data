library(tidyverse) 
library(tibble)   
library(magrittr) # pakiet z potkoami - ładują się automatycznie z tidyverse
library(weathermetrics)

# wizualizacja danych dplyr 

# Testy bibliotek i metod
# head( arrange(iris, Sepal.Width) )
# 
# 
# head( select(iris, Sepal.Width, Sepal.Length) )
# 
# head( mutate(iris, Nowa.kolumna = 2 * Sepal.Length) )
# 
# summarise(iris, avg1 = mean(Sepal.Width), avg2 = mean(Sepal.Length))
# 
# 
# iris %>% 
#   mutate(Nowa.kolumna = 2 * Sepal.Length) %>%
#   select(Sepal.Width, Sepal.Length, Nowa.kolumna) %>%
#   filter(Sepal.Width > 3) %>%
#   head()


# Dane do zadania 1
airquality
str(airquality)

program_2.3.1.1A = function()
{
  airquality %>%
    select(Ozone, Solar.R, Wind, Temp) %>%
    filter(Ozone > 80) %>%
    head()
}

program_2.3.1.1B = function()
{
  airquality %>%
    select(Ozone:Temp) %>%
    filter(Ozone > 80) %>%
    head()
}


program_2.3.1.2 = function()
{
  airquality %>%
    mutate(TempC = fahrenheit.to.celsius(Temp)) %>%
    rename('TempF' = Temp) %>%
    select(Ozone, Solar.R, Wind, TempC,TempF) %>%
    filter(Ozone > 80) %>%
    head()
}

program_2.4.1.1 = function()
{
  as_tibble(airquality)
}

program_2.4.1.2 = function()
{
  tibble(litery = letters [6:11], 
         miesiace = month.name [1:6])
}

program_2.3.1.1A()
program_2.3.1.1B()
program_2.3.1.2()
program_2.4.1.1()
program_2.4.1.2()



