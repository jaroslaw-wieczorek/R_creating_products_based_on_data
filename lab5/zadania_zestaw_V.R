library(dplyr)
library(ggplot2)
library(tidyverse)


# Do zadań 
bigger <- diamonds %>% 
  filter(carat >= 2.5)

premium <- filter(bigger, cut=='Premium', clarity=='I1')
premium2 <- filter(bigger, cut=='Premium', clarity=='SI2')

print("[!] Zadania z rodziału 5.2:")

program_5.2.1.1 = function()
{
  writeLines("Zad 5.2.1.1 - Utwórz jeden wykres dotyczący danych o gospodarce paliwowej 
  z dostosowanymi etykietami title, subtitle, caption, x, y oraz colour")
  
  writeLines("Odpowiedź: Wykres utworzony na postawie innego 
             
  ")
  mpg %>%
  ggplot(aes(displ, hwy)) %>% +
    geom_point(aes(colour = class)) +
    geom_smooth(se = FALSE) +
    labs(
      title = "Gospodarka paliwowa samochodów",
      subtitle = "Wykres zużycia paliwa na autostradzie względu objęctości skokowej",
      x = "Objętość skokowa silnika (l)",
      y = "Gospodarka paliwowa na autostradzie (mpg)",
      colour = "Rodzaj samochodu")
}

program_5.2.1.1()

program_5.2.1.2 = function()
{
  writeLines("Zad 5.2.1.2 - (opcjonalne) Funkcja geom_smooth() jest dość myląca,
  ponieważ wartości zmiennej hwy dla wielkich silników są przekrzywione w górę 
  z powodu uwzględnienia lekkich samochodów sportowych z wielkimi silnikami.
  Użyj swoich narzędzi do modelowania, aby dopasować i wyświetlić lepszy model.")
  
  writeLines("Odpowiedź:
    Związku z tym, że 2seater zawyża postanowiłem go odfiltrować z wykresu.")
  
  mpg <- filter(mpg, class != '2seater')
  
  mpg %>%
    ggplot(aes(displ, hwy)) %>% +
    geom_point(aes(colour = class)) +
    geom_smooth(se = FALSE) +
    labs(
      title = "Gospodarka paliwowa samochodów",
      subtitle = "Wykres zużycia paliwa na autostradzie względu objęctości skokowej",
      x = "Objętość skokowa silnika (l)",
      y = "Gospodarka paliwowa na autostradzie (mpg)",
      colour = "Rodzaj samochodu")
}

program_5.2.1.2()


program_5.2.1.3 = function()
{
  writeLines("Zad 5.2.1.3 - (opcjonalne) Znajdź wykres eksploracyjny, który
  utworzyłeś w ostatnim miesiącu, i dodaj informacyjne tytuły, aby ułatwić innym 
  jego zrozumienie.")
  
  writeLines("Odpowiedź:
     Wybrałem wykres przedstaiwający częstotliwość występowania diamentów równych
     lub większych niż 2,5 z porzednich zajęć.")
  

  bigger %>% 
    ggplot(aes(carat)) + 
    geom_freqpoly(binwidth = 0.01, color='red') +
    labs(x='Ilość karatów',
         y='Liczba diamentów',
         title='Częstotliwość występowania diamentów',
         subtitle = "Od 2,5 karata")
  
}

program_5.2.1.3()


program_5.3.1.1 = function()
{
  writeLines("Zad 5.3.1.1 - Użyj funkcji geom_text() z nieskończonymi wartościami pozycji, 
  aby umieścić tekst w czterech rogach wykresu.")
  
  writeLines("Odpowiedź:
     Wykorzystałem wykres dotyczący daimentów.        
  ")
  label <- tribble(
    ~carat, ~color, ~label, ~vjust, ~hjust,
    -Inf, Inf, "Diamenty <3", "top", "left",
    Inf, Inf, "Diamenty <3", "top", "right",
    -Inf, -Inf, "Diamenty <3", "bottom", "left",
    Inf, -Inf, "Diamenty <3", "bottom", "right"
  )
  
  bigger %>% 
    ggplot(aes(carat)) + 
    geom_freqpoly(binwidth = 0.01, color='red') +
    labs(x='Ilość karatów',
         y='Liczba diamentów',
         title='Częstotliwość występowania diamentów',
         subtitle = "Od 2,5 karata") +
    geom_text(
      aes(y=color, label = label, vjust = vjust, hjust = hjust),
      data = label) 
}
program_5.3.1.1()


program_5.3.1.2 = function()
{
  writeLines("Zad 5.3.1.2 - Przeczytaj dokumentację funkcji annotate(). 
  Jak z niej skorzystać, aby dodać etykietę tekstową do wykresu bez konieczności 
  tworzenia danych typu tibble?")
  ?annotate
  writeLines("Odpowiedź:
     Użycie annotate bez tworzenia tibble: 
     bigger %>% 
      ggplot(aes(carat)) + 
      geom_freqpoly(binwidth = 0.01, color='red') +
      labs(
        x='Ilość karatów',
        y='Liczba diamentów',
        title='Częstotliwość występowania diamentów',
        ubtitle = \"Od 2,5 karata\") +
      annotate(
        \"text\", x = -Inf, y = Inf,
        label = \"Diamenty od 2,5 karata i więcej.\",
        hjust = \"left\", vjust = \"top\", color='green')
  ")
  
  bigger %>% 
    ggplot(aes(carat)) + 
    geom_freqpoly(binwidth = 0.01, color='red') +
    labs(x='Ilość karatów',
         y='Liczba diamentów',
         title='Częstotliwość występowania diamentów',
         subtitle = "Od 2,5 karata") +
    annotate(
      "text", 
      x = -Inf, y = Inf,
      label = "Diamenty od 2,5 karata i więcej.",
      hjust = "left", vjust = "top", color='green')
}
program_5.3.1.2()

program_5.3.1.3 = function()
{
  writeLines("Zad 5.3.1.3 - Jak etykiety utworzone za pomocą funkcji geom_text()
  działają z panelami? Jak dodać etykietę do pojedynczego panelu? 
  Jak umieścić różne etykiety na każdym panelu? (Wskazówka: pomyśl o danych, 
  na podstawie których utworzyłeś wykres).")
  
  writeLines("Odpowiedź: 
     Etykiety działają z panelami tak, że umieszczane są w ich wnętrzu.
     Utworzenie do wszystkich paneli takiej samej etykiety:
    
     label <- tibble(
      color = Inf,
      carat = Inf,
      label = \"Diamnety <3\"
    )
    
    ggplot(bigger, aes(color, carat, color=color)) +
      geom_point() +
      geom_text(
        aes(label = label), 
        data = label, vjust = \"top\", hjust = \"right\", 
        size = 4, color='green') +
      facet_wrap(~clarity)")
  
  label <- tibble(
    color = Inf,
    carat = Inf,
    label = "Diamnety <3"
  )
  
  ggplot(bigger, aes(color, carat, color=color)) +
    geom_point() +
    geom_text(
      aes(label = label), 
      data = label, vjust = "top", hjust = "right", 
      size = 4, color='green') +
    facet_wrap(~clarity)
}

program_5.3.1.3()

program_5.3.1.3.1 = function()
{
  writeLines("zad 5.3.1.3.1: Jak dodać etykietę do pojedynczego panelu? ")
  writeLines("Odpowiedź: 
  label <- tibble(
    color = Inf,
    carat = Inf,
    label = 'Diamnety VS2 <3',
    clarity = 'VS2'
  )
  
  ggplot(bigger, aes(color, carat, color=color)) +
    geom_point() +
    geom_text(
      aes(label = label), 
      data = label, vjust = 'top', hjust = 'right', 
      size = 4, color='green') +
    facet_wrap(~clarity)")
  
  label <- tibble(
    color = Inf,
    carat = Inf,
    label = 'Diamnety VS2 <3',
    clarity = 'VS2'
  )
  
  ggplot(bigger, aes(color, carat, color=color)) +
    geom_point() +
    geom_text(
      aes(label = label), 
      data = label, vjust = 'top', hjust = 'right', 
      size = 4, color='green') +
    facet_wrap(~clarity)
}
program_5.3.1.3.1()

program_5.3.1.3.2 = function()
{
  writeLines("zad 5.3.1.3.2: Jak umieścić różne etykiety na każdym panelu? ")
  writeLines("Odpowiedź: 
  Dodać pole np. clarity = unique(bigger$clarity) jako pole w label (tibble).
  
  label <- tibble(
    color = Inf,
    carat = Inf,
    clarity = unique(bigger$clarity),
    label = str_c(\"Jakość diamentu \", clarity, \" - a jego rozmiar i kolor <3\")
  )
  
  ggplot(bigger, aes(color, carat, color=color)) +
    geom_point() +
    geom_text(
      aes(label = label), 
      data = label, vjust = 'top', hjust = 'right', 
      size = 3, color='red') +
    facet_wrap(~clarity)")
  
  ?diamonds
  label <- tibble(
    color = Inf,
    carat = Inf,
    clarity = unique(bigger$clarity),
    label = str_c("Jakość diamentu ", clarity, " - a jego rozmiar i kolor <3")
  )
  
  ggplot(bigger, aes(color, carat, color=color)) +
    geom_point() +
    geom_text(
      aes(label = label), 
      data = label, vjust = 'top', hjust = 'right', 
      size = 3, color='red') +
    facet_wrap(~clarity)
}

program_5.3.1.3.2()


program_5.3.1.4 = function()
{
  writeLines("Zad 5.3.1.4 - Jakie argumenty funkcji geom_label() kontrolują 
  wygląd prostokąta tła?")
  ?geom_label
  writeLines("Odpowiedź:
    label.padding: odstęp wokół etykiety. . Wartość domyślna wynosi 0,25 linii. 
    label.r: promień zaokrąglonych narożników. Domyślnie wynosi 0.15 linii.
    label.size: rozmiar ramki w milimetrach         
  ")
}

program_5.3.1.4()


program_5.3.1.5 = function()
{
  writeLines("Zad 5.3.1.5 - Jakie są cztery argumenty funkcji arrow()? 
  Jak działają? Utwórz zestaw wykresów, który zaprezentuje najważniejsze opcje.")
  ?grid::arrow
  writeLines("Odpowiedź:
    A) angle:
    Kąt wierzchołka strzałki w stopniach (mniejsze liczby dają węższe, 
    bardziej punktowe strzałki). Zasadniczo opisuje szerokość grotu strzałki.
    
    B) length:
    Jednostka określająca długość grotu strzałki (od końca do podstawy).
    
    C) ends:
    Jeden z \"last\", \"first\",lub \"both\", wskazujący, które końce linii
    służą do rysowania strzałek.
    
    D) type: 
    Jeden z \"open\" lub \"close\" wskazujący, czy głowica strzałki powinna być
    zamkniętym trójkątem.
  ")
  
}
program_5.3.1.5()

program_5.3.1.5A = function()
{
  writeLines("A) Wykres angle 55:
  premium %>%
  ggplot(aes(x=price, y=carat)) %>% + 
    geom_point(size=5, aes(colour=clarity)) +
    geom_line(aes(group=clarity), arrow = ggplot2::arrow(angle=55))")
  
  premium %>%
  ggplot(aes(x=price, y=carat)) %>% + 
    geom_point(size=5, aes(colour=clarity)) +
    geom_line(aes(group=clarity), arrow = ggplot2::arrow(angle=55)) 
}

program_5.3.1.5B = function()
{
  writeLines("B) Wykres length 2 cm:
  premium %>%
    ggplot(aes(x=price, y=carat)) %>% + 
    geom_point(size=5, aes(colour=clarity)) +
    geom_line(aes(group=clarity), arrow = ggplot2::arrow(length=unit(2, 'cm')))           
  ")
  
  premium %>%
    ggplot(aes(x=price, y=carat)) %>% + 
    geom_point(size=5, aes(colour=clarity)) +
    geom_line(aes(group=clarity), arrow = ggplot2::arrow(length=unit(2, 'cm')))
  
}

program_5.3.1.5C = function()
{
  writeLines("C) Wykres ends:
  premium %>%
    ggplot(aes(x=price, y=carat)) %>% + 
    geom_point(size=5, color='orange') +
    geom_line(aes(group=clarity), arrow = ggplot2::arrow(ends='first'))")
  
  premium %>%
    ggplot(aes(x=price, y=carat)) %>% + 
    geom_point(size=5, color='orange') +
    geom_line(aes(group=clarity), arrow = ggplot2::arrow(ends='first'))

    
}
program_5.3.1.5D = function()
{
  writeLines("D) Wykres type open:
  premium %>%
    ggplot(aes(x=price, y=carat)) %>% + 
    geom_point(size=5, color='yellow') +
    geom_line(aes(group=clarity), arrow = ggplot2::arrow(
      ends='first', type='open'))")
  premium %>%
    ggplot(aes(x=price, y=carat)) %>% + 
    geom_point(size=5, color='orange') +
    geom_line(aes(group=clarity), arrow = ggplot2::arrow(type='open'))
}

program_5.3.1.5A()
program_5.3.1.5B()
program_5.3.1.5C()
program_5.3.1.5D()


program_5.4.4.1 = function()
{
  writeLines("Zad 5.4.4.1 - Dlaczego następujący kod nie przesłania domyślnej
  skali?
  df <- tibble(x = rnorm(10000), y = rnorm(10000))
  
  ggplot(df, aes(x, y)) +
    geom_hex() +
    scale_colour_gradient(low = \"white\", high = \"red\") +
    coord_fixed()")
  
  df <- tibble(x = rnorm(10000), y = rnorm(10000))
  
  ggplot(df, aes(x, y)) +
    geom_hex() +
    scale_colour_gradient(low = "white", high = "red") +
    coord_fixed()
  ?scale_fill_gradient
  writeLines("Odpowiedź:
  Ponieważ potrzeba użyć funkcji, która przedstawia skale za pomocą wpłenienia
  gradientu - scale_fill_gradient:
    ggplot(df, aes(x, y)) +
      geom_hex() +
      scale_fill_gradient(low = \"white\", high = \"red\") +
      coord_fixed()")
  
  df %>%
  ggplot(aes(x, y)) %>% +
    geom_hex() +
    scale_fill_gradient(low = "white", high = "red") +
    coord_fixed()
  
}


program_5.4.4.2 = function()
{
  writeLines("Zad 5.4.4.2 - Jaki jest pierwszy argument dla każdej skali? 
  Jak można go porównać do labs()?.")
  ??scale_color_gradient
  ??labs
  writeLines("Odpowiedź:
  A) Pierwszym argumentem dla każdej skali jest scale_name dla skali 
  czyli je nazwa/etykieta. 
  B) Użycie scale jest równoznaczne z użyciem funkcji labs.
  ")
  
}
program_5.4.4.2()

program_5.4.4.3 = function()
{
  writeLines("Zad 5.4.4.3 - Zmień sposób wyświetlania kadencji prezydenckich poprzez:
  1. Połączenie dwóch wariantów widocznych powyżej.
  2. Ulepszenie wyświetlania osi y.
  3. Umieszczenie przy każdej kadencji etykiety z nazwiskiem prezydenta.
  4. Dodanie informacyjnych etykiet na wykresie.
  5. Umieszczenie odstępów co cztery lata (jest to trudniejsze, niż mogłoby się wydawać!).

  Kod, który może się przydać:

  years <- lubridate::make_date(seq(lubridate::year(min(presidential$start)),
    lubridate::year(max(presidential$end)), by = 4), 1, 1)")
  
  
  writeLines("Odpowiedź:
  years <- lubridate::make_date(
    seq(
      lubridate::year(min(presidential$start)),
      lubridate::year(max(presidential$end)),
      by = 4),
    1, 1)
  
  # Id od którego mają zostać wylistowani prezydenci USA
  start_id = 33
  
  presidential %>%
    # dopisanie id 
    mutate(
      id = start_id + row_number(), 
      name_id = fct_inorder(str_c(name, \" (\", id, \")\"))) %>%
    
    ggplot(aes(start, name_id, colour = party)) +
      geom_point(size=2) +
      geom_segment(aes(xend = end, 
                       yend = name_id)) +
    scale_colour_manual(
      \"party\",  values = c(Democratic = \"blue\", 
                           Republican = \"red\")) +
    scale_y_discrete(NULL) +
    scale_x_date(NULL,
                 breaks = \"4 years\", date_labels = \"'%y\",
                 minor_breaks = years) +
    ggtitle(\"Prezydenci USA - czas piastowania urzędu prezydenta\",
            subtitle = \"Od roku 1953 do 2017\")")
  
  years <- lubridate::make_date(
    seq(
      lubridate::year(min(presidential$start)),
      lubridate::year(max(presidential$end)),
      by = 4),
    1, 1)
  
  # Id od którego mają zostać wylistowani prezydenci USA
  start_id = 33
  
  presidential %>%
    # dopisanie id 
    mutate(
      id = start_id + row_number(), 
      name_id = fct_inorder(str_c(name, " (", id, ")"))) %>%
    
    ggplot(aes(start, name_id, colour = party)) +
      geom_point(size=2) +
      geom_segment(aes(xend = end, 
                       yend = name_id)) +
    scale_colour_manual(
      "party",  values = c(Democratic = "blue", 
                           Republican = "red")) +
    scale_y_discrete(NULL) +
    scale_x_date(NULL,
                 breaks = "4 years", date_labels = "'%y",
                 minor_breaks = years) +
    ggtitle("Prezydenci USA - czas piastowania urzędu prezydenta",
            subtitle = "Od roku 1953 do 2017")
}


program_5.4.4.3()


program_5.4.4.4 = function()
{
  writeLines("Zad 5.4.4.4 - Użyj override.aes, aby zwiększyć czytelność legendy 
  na poniższym wykresie:
  ggplot(diamonds, aes(carat, price)) +
    geom_point(aes(colour = cut), alpha = 1/20)")
  
  diamonds %>%
    ggplot(aes(carat, price)) %>% +
      geom_point(aes(color = cut), alpha = 1 / 20) +
      guides(colour = guide_legend(override.aes = list(alpha = 1)))
  
}

program_5.4.4.4()
