---
title: "Rozmiary diamentów"
date: 2016-08-25
output: html_document
---
  
```{r setup, include = FALSE}
library(ggplot2)
library(dplyr)

smaller <- diamonds %>% 
  filter(carat <= 2.5)
```

#Mamy dane o `r nrow(diamonds)` diamentach. Tylko 
#`r nrow(diamonds) - nrow(smaller)` diamentów jest większych niż 2,5 karata. 
#Poniżej przedstawiony jest rozkład pozostałych:
  
```{r, echo = FALSE}
smaller %>% 
ggplot(aes(carat)) + geom_freqpoly(binwidth = 0.01)
```
