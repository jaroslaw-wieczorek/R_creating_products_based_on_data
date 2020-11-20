# Wizualizacja danych — ggplot2
# Rodział 3 zadania: 

library(tidyverse)
library(maps)
mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))


print("[!] Zadania z rodziału 3.2:")
program_3.2.4.1 = function()
{
  print("Zad 3.2.4.1 - Uruchom polecenie ggplot(data = mpg). Co widzisz?")
  ggplot(data = mpg)
  writeLines("Odpowiedź:
  Widzę białą strona bez wykresu.")
}
program_3.2.4.1()

program_3.2.4.2 = function()
{
  print("Zad 3.2.4.2 - Ile wierszy znajduje się w zbiorze danych mtcars? Ile jest kolumn?")
  mtcars
  str(mtcars) # 32 obiekty (wierszy) po 11 zmiennych (kolumn)
  print("Odpowiedź:")
  print(paste0("Liczba wierszy: ", nrow(mtcars)))  # liczba wierszy
  print(paste0("Liczba kolumn: ", ncol(mtcars)))  # liczba column
}
program_3.2.4.2()

program_3.2.4.3 = function()
{
  writeLines("Zad 3.2.4.3 - Co opisuje zmienna drv?
  Dowiesz się tego z treści pomocy, która zostanie wyświetlona po uruchomieniu polecenia ?mpg.")
  ?mpg
  writeLines("Odpowiedź:
  drv to typ układu napędowego, gdzie wartość:
  f oznacza napęd na przednie koła,
  r oznacza napęd na tylne koła,
  4 oznacza napęd na 4 koła.")
}
program_3.2.4.3()


program_3.2.4.4 = function()
{
  writeLines("Zad 3.2.4.4 - Wykonaj wykres punktowy zależności między zmiennymi hwy i cyl.")
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = hwy, y = cyl))
  writeLines("Odpowiedź: gotowe.")
}
program_3.2.4.4()


program_3.2.4.5 = function()
{
  writeLines("Zad 3.2.4.5 - Co zobaczysz na wykresie punktowym zależności między zmiennymi class i drv?
             Dlaczego ten wykres jest bezużyteczny?")
  ggplot(data = mpg) + geom_point(mapping = aes(x = class, y = drv))   
  
  writeLines("Odpowiedź:
  Po wykonaniu powyższego polecenia zostanie wyświetlony wykres zawierający informacje,
  jakie rodzaje napędów przypadają dla danej klasy aut.
  Np. z wykresu możemy dowiedzieć się, że klasa aut subcompact może występować
  z każdym z trzech rodzajów napędu.
  Wykres ten jest bezużyteczny pod tym względem, że nie zawiera informacji,
  o tym jaki model auta posiada dany typ napędu np.:
  
  Audi klasy compact ma napęd na przednie koła(f), ale audi quattro również klasy compact ma już napęd na cztery koła (4).")
  
  writeLines("
Lepszym więc pomysłem jest stworzenie poniższego wykresu zawierającego informacje:
  Do jakiej klasy przynależy dany model auta i jaki napęd posiada. 
  Dzięki niemu możemy zaobserwować fakt, że np. model altima występuje 
  z tym samym rodzajem napędu 'f' (na przednie koła) w dwóch różnych wariantach klas")
  
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = class, y = model, color=drv, fill=drv), shape=23, size=2)     

}
program_3.2.4.5()

print("[!] Zadania z rodziału 3.3:")

program_3.3.1.1 = function()
{
  writeLines("Zad 3.3.1.1 - W którym miejscu tego kodu znajduje się błąd? 
  Dlaczego punkty nie są niebieskie?
    
    ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, color = \"blue\"))"
  )
  writeLines("Odpowiedź:
  Zamknięcie pierwszego nawiasu powinno być przed przecinkiem występującym 
  przed słowem color. W przecwinym wypadku słowo \"blue\" traktowane jest 
  jako zwykła wartość, która mapowana jest na kolor czerwony. 
  Można to zauważyć dzięki tworzącej się legendzie.
  
  Wersja poprawna:    
    ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy), color = \"blue\")")
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy), color = "blue")   
}

program_3.3.1.2 = function()
{
  writeLines("Zad 3.3.1.2 - Które zmienne ze zbioru mpg są kategorialne? 
  Które zmienne są ciągłe? 
  (Wskazówka: wpisz ?mpg, aby przeczytać dokumentację tego zbioru danych). 
  Jak sprawdzić te informacje, uruchamiając polecenie mpg?
  ")
  writeLines("Odpowiedź:
a)Zmienne kategorialne to: manufacturer, model, trans, drv, fl, class.

b)Zmienne ciągłe to: cty, hwy, year, displ, cyl

c)Uruchamiając polecenie mpg możemy zwrócić uwagę na to, że pod nazwami kolumn
(pod zmiennymi) umieszczone są ich typy: typy liczbowe <int> są typami
ciągłymi zaś ciągi znaków <chr> są typami kategorialnymi.)")
}
program_3.3.1.2()


program_3.3.1.3 = function()
{
  writeLines("Zad 3.3.1.3 - Zmapuj zmienną ciągłą na estetykę color, size i shape.
Na czym polega różnica w zachowaniu tych estetyk w przypadku zmiennych 
kategorialnych i ciągłych?")
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y=cty, color=hwy, shape=drv))
  writeLines("Odpowiedź:
  W przypadku zmiennych ciągłych język R zwraca błąd przy próbie 
  użycia estetyki shape: BŁĄD: A continuous variable can not be mapped to shape.
  Zaś w przypadku zmiennych kategorialnych można użyć każdej z 3 estetyk do zmapowania.
  Estetyka color i shape zmieniają się stopniowo w przypadku zmiennych ciągłych 
  np. kolor zmienia odcień od jasnego do niemal czanrego.
  Zaś w przypadku zmiennych kategorialnych każda wartość reprezentowana w 
  jest inną barwą, a nie tylko odcieniem koloru.")
  
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y=cty, color=drv, shape=drv))
}
program_3.3.1.3()

program_3.3.1.4 = function()
{
  writeLines("Zad 3.3.1.4 - Co się stanie, jeśli zmapujesz tę samą zmienną na wiele estetyk?")
  writeLines("Odpowiedź:
  Dana wartość będzie reprezentowana za pomocą więcej niż jednej estetyki 
  np.  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y=cty, color=hwy, size=hwy))
    
  Efektem będzie wykres na którym wraz z wielkością punktów będzie zmieniać się także ich kolor.
  Im mniejsze i ciemniejsze punkty tym wartości są niższe, 
  a im większe punkty i jaśniejsze tym wartości (przez nie reprezentowane) są większe.")
}
program_3.3.1.4()

program_3.3.1.5 = function()
{
writeLines("Zad 3.3.1.5 - Do czego służy estetyka stroke? Z jakimi kształtami 
można jej użyć? (Wskazówka: skorzystaj z polecenia ?geom_point).")
?geom_point
writeLines("Odpowiedź:
Kształty 21-24 mają zarówno kolor wypełnienia, jak i skoku.
Rozmiar wypełnionej części jest kontrolowany przez size, 
wielkość skoku jest kontrolowana przez stroke. 
Każdy z nich jest mierzony w mm, a całkowita wielkość punktu jest sumą obu.
Można ją użyc tylko w przypadku zmiennych ciaglych w wykresie punktowym.

")
?geom_point
ggplot(mpg, aes(x = displ, y=cty, color=hwy, size=hwy)) +
  geom_point(size = 6, stroke = 1)
}

program_3.3.1.6 = function()
{ 
  writeLines("Zad 3.3.1.6 - Co się stanie, jeśli zmapujesz estetykę na coś 
  innego niż nazwa zmiennej, jak na przykład aes(color = displ < 5)?")
  
  writeLines("Odpowiedź: 
  Wartości poniżej 5 zostaną pokolorowane inaczej od wartości większych bądź równych 5, 
  a informacja o tym, który kolor co oznacza zostanie dodana do legendy.")

  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y=cty, color=displ < 5, size=cty))
}

program_3.3.1.6()



print("[!] Zadania z rodziału 3.5:")

program_3.5.1.1 = function()
{ 
  writeLines("Zad 3.5.1.1 - Co się stanie, jeśli podzielisz wykres na panele na 
  podstawie zmiennej ciągłej?")
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = drv)) + 
    facet_grid(hwy ~ cyl)
  writeLines("Odpowiedź: 
  Wykres zostanie podzielony na bardzo dużą liczbę paneli 
  (dla każdej wartości zmiennej ciągłej z danych), co może spowodować, 
  że będzie nieczytelny ponad to większość z nich najprawdopodobniej będzie pustych. 
  Panele lepiej stosować dla cech kategorialnych, których nie jest zbyt dużo 
  np. ja w przypadku cechy kategorialnej drv, który zawiera tylko różne 3 wartości.
  Należy także nadminić, że face_grid pomija wartści dla których nie ma żadnej 
  pary z drugą wartością, np. wykres: 
  ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl) 
  pomija kolumnę z wartością 7 - ponieważ żaden rodzaj napędu w podanych danych
  nie posiada takiej liczby cylindrów.")
}
program_3.5.1.1()

program_3.5.1.2 = function()
{
  writeLines("Zad 3.5.1.2 - Co oznaczają puste komórki na wykresie utworzonym 
  przy użyciu instrukcji facet_grid(drv ~ cyl)? 
  Jaka jest ich zależność względem tego wykresu?")
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = drv, y = cyl))
  
  writeLines("Odpowiedź: 
  Puste komórki w face_grid oznaczają, że nie istnieją pary danych
  drv - cyl dla niektórych wartości. 
  
  Intepretując wykres - nie istnieją auta z silnikami o 4 lub 5 cylindrach 
  z napędem na tylnie koła (cyl = 4 lub 5 i drv = r).")

  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) + 
    facet_grid(drv ~ cyl)
  
}

program_3.5.1.2()


program_3.5.1.3 = function()
{
  writeLines("Zad 3.5.1.3 - Jakie wykresy powstaną po uruchomieniu tego kodu? Do czego służy znak .?")
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_grid(drv ~ .)
  
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_grid(. ~ cyl)
  writeLines("Odpowiedź: 
  Kropka pomija tworzenie paneli na podstawie kolumn lub wierszy.
  Pierwszy wykres zostanie podzielony na panele przy użyciu wierszy
  na podstawie zmiennej 'drv'. 
  
  Drugi wykres zostanie podzielony na panele przy użyciu kolumn 
  na podstawie zimennej 'cyl'")

}
program_3.5.1.3()

program_3.5.1.4 = function()
{
  writeLines("Zad 3.5.1.4 - Przyjrzyj się wykresowi w pierwszym panelu utworzonym za pomocą poniższego kodu:")
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) + 
    facet_wrap(~ class, nrow = 2)
  
  writeLines("Jakie korzyści płyną z użycia paneli w porównaniu z użyciem 
             estetyki koloru? Jakie są wady tego podejścia? Jak się to zmieni, 
             jeśli skorzystasz z wielkiego zbioru danych?")
  
  writeLines("Odpowiedź: 
  Wykorzystanie estetyk jest dobre dla dużych wartości ciągłych, 
  ponieważ łatwiej jest je odczytać np. dzięki użyciu koloru, rozmiaru czy kształtu.
  Użycie paneli jest dobry podejściem jeśli np. wyniki nachodzą się na siebie, 
  a możemy je rozbić na poszczególne wykresy w wykresie(panele) 
  przy użyciu cech kategorczynych (ew. małej cechy ciągłej jak np. displ w mpg).
  
  Przy bardzo dużej ilości danych i cech kategorycznych najlepszym podejściem 
  jest zastosowanie obydwu podejść, aby zmaksymalizować czytelność wykresu.
  
  Estetyki sprawdzają się doskonale do mniej unikatowych wartości np.hwy.
  Panele zaś do tych najbardziej unikatowych i nie licznych np. drv.
  Aby uniknąć np. sytuacji w której mamy zbyt dużo paneli lub 
  zbyt małe różnice wizualne w mapowaniu estetyki (np. kolor), 
  aby jednoznacznie określić przedstawianą wartość.")
}

program_3.5.1.5 = function()
{
  writeLines("Zad 3.5.1.5 - Przeczytaj pomoc dla ?facet_wrap. 
  Do czego służy argument nrow? Do czego służy argument ncol? 
  Jakie inne opcje kontrolują układ poszczególnych paneli? 
  Dlaczego funkcja facet_grid() nie przyjmuje argumentów nrow i ncol?")
  ?facet_wrap
  writeLines("Odpowiedź: 
nrow - Liczba wierszy
ncol - Liczba kolumn
strip.position Domyślnie etykiety są wyświetlane na górze działki. 
Używając strip.position możliwe jest umieszczenie etykiet na każdej z 
czterech stron poprzez ustawienie strip.position = c(top, bottom, left, right) 

facet_grid - nie przyjmuje argumentów nrow i ncol ponieważ zawsze
liczbę kolumn i wierszy wyznaczją parametry podane w tej funckji.")
}


program_3.5.1.6 = function()
{
  writeLines("Zad 3.5.1.6 - Podczas korzystania z funkcji facet_grid() 
  w kolumnach zwykle należy umieszczać zmienne z bardziej unikatowymi poziomami.
  Dlaczego?")
  writeLines("Odpowiedź: 
  Przy zmiennych z bardziej unikatowymi poziomami podział na panele będzie
  bardziej czytelny.")
}
program_3.5.1.6()

print("[!] Zadania z rodziału 3.6:")


program_3.6.1.1 = function()
{
  writeLines("Zad 3.6.1.1 - Jakiej geometrii użyjesz, aby narysować wykres 
  liniowy? ")
  
  writeLines("Odpowiedź: 
  pudelkowy - boxy - za pomocą geom_boxplot()
  histogram - slupki - za pomocą geom_bar() 
  liniowy - linie - za geom_smooth()
  warstwowy - za pomoca (+) dodajemy poszczegolne warstwy")
  
  #Wykres liniowy:
    ggplot(data = mpg) + 
    geom_line(mapping = aes(x = displ, y=cty, color = displ < 5))
  
  # Wykres pudełkowy box-plot
  ggplot(data = mpg) + 
    geom_boxplot(mapping = aes(x = class, y = hwy, color=class), outlier.shape=1,
                 outlier.size=1, notch=FALSE)
  
  # Wykres Histogram
  ggplot(data = mpg, aes(hwy)) + 
    geom_histogram()
  
  
  # Wykres Warstwowy 
  p<-ggplot(mtcars, aes(x = mpg^2, y = wt/cyl))
  p+geom_point(color="magenta",size=4,shape=8)+geom_line(color="green")+geom_jitter(color="yellow",size=2)
}


program_3.6.1.2 = function()
{
  writeLines("Zad 3.6.1.2 - Wyobraź sobie wynik działania poniższego kodu.
Następnie uruchom go w R i zweryfikuj swoje przewidywania:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + geom_point() +  geom_smooth(se = FALSE)")

  ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
    geom_point() + geom_smooth(se = FALSE)
  
  writeLines("Odpowiedź: 
Spodziewałem się takiego wykresu, ponieważ oba obiekety graficzne wykorzystują
globalne mapowanie. Zaś zmienna se = False wyłącza wyświetlanie przedziału
ufności wokół wygładzonej linii.")
}
 

program_3.6.1.3 = function()
{
  writeLines("Zad 3.6.1.3 -  Do czego służy kod show.legend = FALSE?
 Co się stanie, gdy go usuniesz?
 Jak myślisz, dlaczego użyto go wcześniej w tym rozdziale?")
  
  ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),
      show.legend = FALSE)
  
  writeLines("Odpowiedź: 
show.legend = FALSE powoduje, że nie będzie tworzona legenda obok wykresu.
Jeśli go usune zostanie dodana do wykresu automatyczna legenda.
W celu uproszczenia wykresów.")
}


program_3.6.1.4 = function()
{
  writeLines("Zad 3.6.1.4 - Do czego służy argument se w funkcji geom_smooth()?")
  
  writeLines("Odpowiedź: 
  Argument se służy do wyświetlania przedziału ufności wokół wygładzonej linii.")
}


program_3.6.1.5 = function()
{
  writeLines("Zad 3.6.1.5 - Czy te dwa wykresy są inne? Dlaczego?")
 
   ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point() +
    geom_smooth()
   
   ggplot() +
     geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +
     geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
  
  writeLines("Odpowiedź: 
  Wykresy te będą identyczne dlatego, że w przypadku pierwszego jak i drugiego
zastosowano takie same mapowanie, z tą różnicą ze w przypadku pierwszego wykresu
jest to mapowanie globalne, zaś w przypadku drugiego powtórzone dla dwóch
obiektów graficznych mapowanie lokalne.")
}
program_3.6.1.5()



program_3.6.1.6A = function()
{
  writeLines("Zad 3.6.1.6.A - Odtwórz kod R potrzebny do wygenerowania 
             następujących wykresów: Wykres I")
  
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy), size=4) +
    geom_smooth(mapping = aes(x = displ, y = hwy),size=2, se = FALSE)
}  

program_3.6.1.6A()

program_3.6.1.6B = function()
{
  writeLines("Zad 3.6.1.6.B - Odtwórz kod R potrzebny do wygenerowania 
             następujących wykresów: Wykres II")
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy),  size=4) +
    geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), size=2, se = FALSE)
}

program_3.6.1.6C = function()
{
  writeLines("Zad 3.6.1.6.C - Odtwórz kod R potrzebny do wygenerowania 
             następujących wykresów: Wykres III")
  ggplot(data = mpg) +
    geom_smooth( mapping = aes(x = displ, y = hwy, color = drv), size=2, se = FALSE) +
    geom_point(mapping = aes(x = displ, y = hwy, color = drv), size=4)
}

program_3.6.1.6D = function()
{
  writeLines("Zad 3.6.1.6.D - Odtwórz kod R potrzebny do wygenerowania 
             następujących wykresów: Wykres IV")
  ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y = hwy), size=2,  se = FALSE) +
    geom_point(mapping = aes(x = displ, y = hwy, color = drv), size=4)
}

program_3.6.1.6E = function()
{
  writeLines("Zad 3.6.1.6.E - Odtwórz kod R potrzebny do wygenerowania 
             następujących wykresów: Wykres V")
  ggplot(data = mpg) +
    geom_smooth( mapping = aes(x = displ, y = hwy, linetype = drv),size=2, se = FALSE) +
    geom_point(mapping = aes(x = displ, y = hwy, color = drv),size=3)
}

program_3.6.1.6F = function()
{
  writeLines("Zad 3.6.1.6.F - Odtwórz kod R potrzebny do wygenerowania 
             następujących wykresów: Wykres VI")
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = drv), size=3)
}


program_3.6.1.6A()
program_3.6.1.6B()
program_3.6.1.6C()
program_3.6.1.6D()
program_3.6.1.6E()
program_3.6.1.6F()

print("[!] Zadania z rodziału 3.7:")


program_3.7.1.1 = function()
{
  writeLines("Zad 3.7.1.1 - Która domyślna funkcja geometryczna jest związana 
  z funkcją stat_summary()? Jak można przepisać wcześniejszy wykres, 
  aby skorzystać z funkcji geometrycznej zamiast z przekształcenia statystycznego?")
  ?stat_summary
  writeLines("Odpowiedź: 
  Domyslna funkcja geometryczna związana z funkcją stat_summary to 'pointrange'.")
  ggplot(data = diamonds) + 
    geom_pointrange(mapping = aes(x = cut, y = depth), stat = "summary", 
                    fun.min = function(z) {min(z)},
                    fun.max = function(z) {max(z)},
                    fun = median)
  
}
program_3.7.1.1()

program_3.7.1.2 = function()
{
  writeLines("Zad 3.7.1.2 - Do czego służy funkcja geom_col()?
  Czym różni się od funkcji geom_bar()?")
  ?geom_col
  
  writeLines("Odpowiedź: 
  Istnieją dwa rodzaje wykresów słupkowych: geom_bar() i geom_col().
  geom_bar() sprawia, że wysokość słupka jest proporcjonalna do liczby przypadków 
  w każdej z grup (lub, jeśli podano estetykę wagi, jest to suma wag). 
  
  Jeśli chcemy, aby wysokość słupków reprezentowała wartości w danych, 
  powinniśmy wybrać geom_col().
  
  geom_bar() używa domyślnie stat_count(): zlicza liczbę przypadków na każdej pozycji x.
  geom_col() używa stat_identity(): pozostawia dane takimi, jakie są.")
}

program_3.7.1.2()



program_3.7.1.3 = function()
{
  writeLines("Zad 3.7.1.3 - Większość funkcji geometrycznych i przekształceń 
  statystycznych tworzy pary, które niemal zawsze są używane wspólnie. 
  Przeczytaj dokumentację i wykonaj listę tych par. Co mają ze sobą wspólnego?")
  
  
  writeLines("Odpowiedź: 
  Niektóre funkcje geometryczne korzystają z tych samych przekształceń:
    geom_blank - stat_identity
    geom_abline - stat_abline
    geom_hline - stat_identity
    geom_vline - stat_vline 
    geom_text - stat_identity
    geom_point - stat_identity
    geom_jitter - stat_identity
    geom_segment - stat_identity 
    geom_line - stat_identity
    geom_bar - stat_count
    geom_histogram - stat_bin
    geom_area - stat_identity
    geom_ribbon - stat_identity
    geom_linerange - stat_identity
    geom_pointrange - stat_identity
    geom_errorbar - stat_identity
    geom_errorbarh - stat_identity
    geom_crossbar - stat_identity
    geom_boxplot - stat_boxplot
    geom_path - stat_identity
    geom_polygon - stat_identity
    geom_rect - stat_identity
    geom_rug - stat_identity
    geom_step - stat_identity
    geom_bin2d - stat_bin2d
    geom_tile - stat_identity
    geom_hex - stat_binhex
    geom_density - stat_density
    geom_density2d - stat_density2d
    geom_contour - stat_contour
    geom_freqpoly - stat_bin
    geom_quantile - stat_quantile
    geom_smooth - stat_smooth")
}
?stat_count
program_3.7.1.3()

program_3.7.1.4 = function()
{
  writeLines("Zad 3.7.1.4 - Jakie zmienne oblicza funkcja stat_smooth()? 
  Jakie parametry sterują jej zachowaniem?")
  ?stat_smooth()
  writeLines("Odpowiedź: 
  Funkcja stat_smooth() obliczba następujące zmienne:
  y - predicted value
  ymin - lower pointwise confidence interval around the mean
  ymax - upper pointwise confidence interval around the mean
  se - standard error
  
  Parametr y steruje jej zachowaniem")
}
program_3.7.1.4()



program_3.7.1.5 = function()
{
  writeLines("Zad 3.7.1.5 - Na naszym wykresie słupkowym proporcji musieliśmy 
  skorzystać z zapisu group = 1.
   Dlaczego? Innymi słowy, na czym polega problem z poniższymi wykresami?")
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, y = ..prop..))
  ?geom_bar
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
  writeLines("Odpowiedź: 
  Group = 1 zapewnia poprawne partycjonowanie danych (wierszy) które zawierają 
  określone cięcie, a proporcje zostaną odszukane w odniesieniu do całej bazy 
  danych jako proporcja max cut (maksymalnego idealnego cięcia)
  w całym zestawie danych.")
}
program_3.7.1.5()


print("[!] Zadania z rodziału 3.8:")

program_3.8.1.1 = function()
{
  writeLines("Zad 3.8.1.1 - Na czym polega problem z tym wykresem?
  Jak można go poprawić?")
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_point()

  writeLines("Odpowiedź: 
  Problem z wykresem polega na zaokręgleniu zmiennych hwy i cty, co skutkuje tym,
  że wiele puntków nakłada się na siebie podczas wyświetlania.
             
  W celu poprawy można wykorzystać estetykę position - jitter.")
  
  
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_point(position = "jitter")
}

program_3.8.1.1()

program_3.8.1.2 = function()
{
  writeLines("Zad 3.8.1.2 - Jakie parametry funkcji geom_jitter() sterują poziomem fluktuacji?")
  
  ?position_jitter
  
  writeLines("Odpowiedź: 
    Z dokumentacji position_jitter istnieją dwa argumenty przemawiające za 
    jitterem: width i height, które kontrolują wielkość pionowego i poziomego jittera.")
}
program_3.8.1.2()

program_3.8.1.3 = function()
{
  writeLines("Zad 3.8.1.3 - Porównaj ze sobą funkcje geom_jitter() i geom_count()")
  
  ggplot(data = mpg, mapping = aes(x = cyl, y = drv)) + 
    geom_jitter(color = "green") +
    geom_count(color = "blue")
  
  writeLines("Odpowiedź: Count zlicza wystąpienia wartości - niebieski.")
}
program_3.8.1.3()


program_3.8.1.4 = function()
{
    writeLines("Zad 3.8.1.4 - Jakie jest domyślne dopasowanie położenia dla geom_boxplot()?
    Utwórz odpowiednią wizualizację zestawu danych mpg.")
    ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
      geom_boxplot() 
    writeLines("Odpowiedź: Za pomocą Kartezjańskiego systemu operującego na 2 współrzędnych x i y.")
}
program_3.8.1.4()


program_3.9.1.1 = function()
{
  writeLines("Zad 3.9.1.1 - Przekształć skumulowany wykres słupkowy w wykres 
  kołowy za pomocą funkcji coord_polar().")
  
  bar <- ggplot(data = diamonds) + 
    geom_bar(
      mapping = aes(x = cut, fill = cut), 
      show.legend = FALSE,
      width = 1
    ) + 
    theme(aspect.ratio = 1) +
    labs(x = NULL, y = NULL)
  
  bar + coord_flip()
  bar + coord_polar()
  writeLines("Odpowiedź: Rozwiązanie z podręcznika.")
}

program_3.9.1.1()



program_3.9.1.2 = function()
{
  writeLines("Zad 3.9.1.2 - Do czego służy funkcja labs()? Przeczytaj dokumentację.")
  
  ?labs()
  writeLines("Odpowiedź: Pozwala opisywać osie współrzędne wykresu za pomocą etykiet.")
}

program_3.9.1.2()


program_3.9.1.3 = function()
{
  writeLines("Zad 3.9.1.3 - Na czym polega różnica między coord_quickmap() a coord_map()?.")
  ?coord_quickmap
    
  writeLines("Odpowiedź: 
  coord_map() rzutuje część ziemi, która jest w przybliżeniu sferyczna, 
  na płaską płaszczyznę 2D za pomocą dowolnego występu zdefiniowanego przez pakiet mapproj.
  Projekcje map nie zachowują na ogół linii prostych, więc wymaga to znacznych obliczeń.
  coord_quickmap() jest szybkim przybliżeniem, które zachowuje linie proste. 
  Najlepiej sprawdza się w przypadku mniejszych obszarów położonych bliżej równika.")
}

program_3.9.1.3()


program_3.9.1.4 = function()
{
  writeLines("Zad 3.9.1.4 - Patrząc na poniższy wykres, czego możesz się dowiedzieć
  o zależności między miastem (cty) a wydajnością zużycia paliwa na autostradzie (hwy)? 
  Dlaczego ważne jest wywołanie coord_fixed()?
  Do czego służy funkcja geom_abline()?.")
  
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
    geom_point() + 
    geom_abline() +
    coord_fixed()
  ?mpg
  ?coord_fixed
  ?geom_abline
  writeLines("Odpowiedź:
  Na dłuższych odcinakch wydajność paliwa jest większa. 
  coord_fixes - poprawia odzorowanie stosunku wartości
  geom_abline - służy do tworzenia linii podkreślającej jakość zależność
  głównie w celu tworzenia notatek na wykresie.")
}

program_3.9.1.4()
