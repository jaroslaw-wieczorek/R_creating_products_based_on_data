
print("[!] Zadania z rodziału 4.2:")

program_4.2.1.1 = function()
{
  writeLines("Zad 4.2.1.1 - Utwórz nowy notatnik, wybierając polecenie
  File > New File > R Notebook.
  Przeczytaj instrukcje. Poćwicz uruchamianie fragmentów kodu. 
  Sprawdź, czy możesz zmodyfikować kod, ponownie go uruchomić i sprawdzić zmodyfikowany wykni")
  
  writeLines("Odpowiedź:
  Mogę modyfikować kod i urchomić go ponowanie.
  Bardzo wygodna jest możliwość uruchaminia poszczególnych funkcji (komórek)
  jak w przypadku notebooka.
  Plik: zadanie_4_2_1_1.Rmd")
}

program_4.2.1.1()

program_4.2.1.2 = function()
{
  writeLines("Zad 4.2.1.2 - Utwórz nowy dokument R Markdown, 
  wybierając polecenie File > New File > R Markdown….
  Złóż go, klikając odpowiedni przycisk. 
  Powtórz to, korzystając z odpowiedniego skrótu klawiszowego. 
  Sprawdź, czy możesz zmodyfikować dane wejściowe, i zobacz uaktualnione wyjście.")
  
  writeLines("Odpowiedź:
  Mogę modyfikować kod i urchomić go ponowanie.
  Bardzo wygodna jest możliwość uruchaminia poszczególnych funkcji (komórek)
  jak w przypadku notebooka.
  Plik: zadanie_4_2_1_2.Rmd")
}

program_4.2.1.2()
#
program_4.2.1.3 = function()
{
  writeLines("Zad 4.2.1.3 - Porównaj utworzone wcześniej pliki R Notebook i R Markdown.
  Co mają ze sobą wspólnego dane wyjściowe? Czym się różnią? 
  Co mają ze sobą wspólnego dane wejściowe? Czym się różnią? 
  Co się stanie, jeśli skopiujesz nagłówek YAML z jednego do drugiego?")
  
  writeLines("Odpowiedź:
  Przykładowe dane różnią się od siebie. 
  W przypadku notebooka zaiera nagłówek html_notebook, który swoim działaniem 
  przypomina Jupyter'a. Kliknięcie na przycisk Preview tworzy pogląd aktualnego 
  dokuemntu z aktualną zawartością komórek tzn. że jeśli jakiś kod nie został 
  uruchomiony w podglądzie pokaże się tylko komórka z kodem, bez wyniku jego
  działania. 
  
  Składanie całego dokuemntu markdown powoduje wykonanie wszystkich komórek.
  Przekopiowanie nagłówka spowoduje zmianę dokuemntu z jednego w drugi. 
  Po przekopiowaniu nagłówka YAML z zadanie_4_2_1_3_notebook.Rmd do pliku 
  zadanie_4_2_1_3_markdown.Rmd spowodowało, że wygnerowany plik na jego podstawie 
  zmienił się w zadanie_4_2_1_3_markdown.nb.html
  tego samego typu co plik wygenerowany podczas tworzenia podglądu dla
  zadanie_4_2_1_3_notebook.Rmd - zadanie_4_2_1_3_notebook.nb.html")
}

program_4.2.1.3()

program_4.2.1.4 = function()
{  writeLines("Zad 4.2.1.4 - Utwórz nowy dokument R Markdown dla każdego z trzech
wbudowanych formatów: HTML, PDF i Word.
Złóż każdy z trzech dokumentów. Czym się różnią? 
Czym różnią się dane wejściowe?
")
  
  writeLines("Odpowiedź:
  Dane wejściowe różnią sie nagłówkiem: 
  Plik zadanie_4_2_1_4_html.Rmd tworzący plik html zawiera nagłówek - html_document
  Plik zadanie_4_2_1_4_pdf.Rmd tworzący plik pdf zawiera nagłówek - pdf_document
  Plik zadanie_4_2_1_4_word.Rmd tworzący plik docx zawiera nagłówek - word_document
  
  Poza tym każdy z nich zawiera te same domyślne dane.  
  ")
}

program_4.2.1.4()

print("[!] Zadania z rodziału 4.3:")
program_4.3.1.1 = function()
{  writeLines("Zad 4.3.1.1 - Przećwicz to, czego się nauczyłeś, i utwórz krótkie CV.
   Tytułem powinno być Twoje imię i nazwisko. 
   Powinieneś też uwzględnić nagłówki dla (co najmniej) wykształcenia i doświadczenia zawodowego. 
   Każda z sekcji powinna zawierać wypunktowaną listę stanowisk/stopni naukowych. 
   Zaznacz lata pogrubioną czcionką.")
  
  writeLines("Odpowiedź:
  Pliki: CV.Rmd, CV.html, CV.pdf")
}

program_4.3.1.1()


program_4.3.1.2 = function()
{  writeLines("Zad 4.3.1.2 - Za pomocą ściągawki dla R Markdown sprawdź, jak:
    1. Dodać stopkę.
    2. Dodać linię poziomą.
    3. Dodać cytat blokowy.")
  
  writeLines("Odpowiedź:
  Odp. Ad.1 - za pomocą instrukcji '\\fancyfoot[selectors]{output text}'
  Odp. Ad.2 - za pomocą trzech gwiazdek ***
  Odp. Ad.3 - za pomocą operatora '>' ")
}

program_4.3.1.2()


program_4.3.1.3 = function()
{  writeLines("Zad 4.3.1.3 - Skopiuj zawartość pliku rozmiary-diamentow.Rmd 
   i wklej do lokalnego dokumentu R Markdown. 
   Sprawdź, czy możesz go uruchomić, a następnie dodaj tekst 
   pod wielokątem częstotliwości, który opisuje jego najbardziej rzucające 
   się w oczy cechy.")
  
  writeLines("Odpowiedź:
  Plik: zadanie_4_3_1_3_rozmiary-diamentow.Rmd
  ")
}

program_4.3.1.3()

print("[!] Zadania z rodziału 4.4:")
program_4.4.8.1 = function()
{  writeLines("Zad 4.4.8.1 - Do zmodyfikowanego pliku rozmiary-diamentow.Rmd
  dodaj sekcję, która przeanalizuje różnicę wielkości diamentów w zależności 
  od szlifu, koloru i przejrzystości. Załóżmy, że piszesz raport dla kogoś,
  kto nie zna R, i zamiast ustawiać echo = FALSE dla każdego fragmentu osobno,
  ustaw opcję globalną.")
  
  writeLines("Odpowiedź:
  Plik: zadanie_4_3_1_3_rozmiary-diamentow.Rmd
  
  Komórka echo=False
  ```{r, echo=FALSE}
  knitr::opts_chunk$set(
    echo = FALSE,
    warning = FALSE,
    message = FALSE
  )
  ```
  Analiza
  ```{r analiza}
  diamonds %>%
    ggplot() +
    geom_point(mapping = aes(x = cut, y = carat, color=cut))
  
  diamonds %>%
    ggplot() +
    geom_point(mapping = aes(x = color, y = carat, color=color))
  
  diamonds %>%
    ggplot() +
    geom_point(mapping = aes(x = clarity, y = carat, color=clarity))
  ```
  ")
}

program_4.4.8.1()



program_4.4.8.2 = function()
{  writeLines("Zad 4.4.8.2 - Dodaj do pliku rozmiary-diamentow.Rmd sekcję
   opisującą 20 największych diamentów, włączając tabelę wyświetlającą ich 
   najważniejsze atrybuty.")
  
  writeLines("Odpowiedź:
  Plik: zadanie_4_3_1_3_rozmiary-diamentow.Rmd
  
  ```{r dwadzieścia największych}
  diamonds %>%
    select(carat, cut, color, clarity, price) %>%
    as.data.frame() %>% 
    arrange(desc(carat)) %>%
    head(20)
  ```")
}

program_4.4.8.2()


program_4.4.8.3 = function()
{  writeLines("Zad 4.4.8.3 - Zmodyfikuj plik rozmiary-diamentow.Rmd wykorzystujący funkcję comma(),
   aby utworzyć ładnie sformatowany tekst. 
   Uwzględnij odsetek diamentów o wadze przekraczającej 2,5 karata.")
  
  writeLines("Odpowiedź:
  Plik: zadanie_4_3_1_3_rozmiary-diamentow.Rmd
  ```{r bigger_setup, include = FALSE}
  bigger <- diamonds %>% 
    filter(carat >= 2.5)
  ```
  Mamy dane o `r comma(nrow(diamonds))` diamentach. 
  Aż `r comma(nrow(diamonds) - nrow(bigger))` diamentów jest mniejszych niż 2,5 karata. 
  Poniżej przedstawiony jest rozkład pozostałych:
  
  ```{r, echo = FALSE}
  bigger %>% 
    ggplot(aes(carat)) + 
    geom_freqpoly(binwidth = 0.01)
  ```")
}

program_4.4.8.3()

program_4.4.8.4 = function()
{  writeLines("Zad 4.4.8.4 - Skonfiguruj sieć fragmentów, w której d zależy od c i b,
   a zarówno b, jak i c zależą od a. 
   Niech każdy fragment uruchomi funkcję lubridate::now().
   Ustaw opcję cache = TRUE, a następnie sprawdź, czy dobrze zrozumiałeś 
   zagadnienie zapisywania w pamięci podręcznej.")
  
  writeLines("Odpowiedź:
  Plik: zadanie_4_3_1_3_rozmiary-diamentow.Rmd
  Zadanie 4:
  ```{r a, cache = TRUE}
  lubridate::now()
  ```
  
  ```{r b, cache = TRUE, dependson = \"a\"}
  lubridate::now()
  ```
  
  ```{r c, cache = TRUE, dependson = \"a\"}
  lubridate::now()
  ```
  
  ```{r d, cache = TRUE, dependson = \"c\"}
  lubridate::now()
  ```
  Nie jestem przekonany czy dokońca rozumiem działanie tegeo cache'a.
  Ale jeśli w kodzie nic się nie zmieni, to zwracane daty się nie zmieniają nawet 
  jeśli usunę z pierwszego fragmentu 'a' parametr 'cache' to zwrócenie nowej daty
  w tym fragmencie nie wpływa na pozostałe fragmenty(nadal używają wartości z cache). 
  Jeśli zaś zmodyfikuje kod w tym fragmencie np. dodam jeszcze jedno wywołanie
  lubridate::now() wtedy we wszystkich pozostałych wczytywane są nowe daty.
  ")
}

program_4.4.8.4()  

