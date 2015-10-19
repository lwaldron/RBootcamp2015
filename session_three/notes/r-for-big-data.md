---
title: "Making the most of R"
author: "Marcel Ramos"
date: "October 18, 2015"
output: 
  beamer_presentation:
    theme: "CambridgeUS"
    colortheme: "dolphin"
    fonttheme: "structureitalicserif"
---

Using R for Big Data
==============================================
* Big Data 
* Tidy Data
* Tips for learning R
* Reading data into memory
* Cleaning and Manipulating data with `tidyr` and `dplyr`
* Pipes for fluid and readable programming

Big Data\footnote{\tiny{Slide adapted from Hadley Wickham}}
==============================================
Size   | Description
------ | -------
Big    | Can't fit in memory on one computer: >5 TB
Medium | Fits in memory on a server: 10 GB - 5 TB
Small  | Fits in memory on a laptop: <10 GB

\begin{block}{Note:}
R is great at small!
\end{block}

Big Data (2)
==============================================
* Reducible problems (subsetting, sampling, summarizing)
* Big data is often messy data and not much else
* Price to pay for big data

Principles of Tidy Data
==============================================
* Often said: 80% of data analysis is cleaning/munging
* Provide a standard way of organizing data\footnote{\tiny{http://vita.had.co.nz/papers/tidy-data.pdf}}
1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

Dataset     | Variable    | Variable
----------- | ----------- | -----------
Observation | Value       | Value
Observation | Value       | Value


Principles of Tidy Data (2)
==============================================
* Why is tidy data important? 
* Easier for the analyst and the computer to extract knowledge from a set of values
* Saves a *lot* of time

Tips for learning R (general)
==============================================
* Learning R may become frustrating at times
* Learning a language
* Practice is key

Useful tips for learning R (stand-alone)
==============================================
Pseudo code                                   |   Example code
--------------------------------------------  |   -------------------
install.packages(packagename)                 | library(dplyr) 
?functionname                                 | ?select
?package::functionname                        | ?dplyr::select
? 'Reserved keyword or symbol' \color{blue}{(or backticks)} | ? '%>%'
??searchforpossiblyexistingfunctionandortopic | ??simulate
help(package = "loadedpackage")               | help("dplyr")
browseVignettes("packagename")                | browseVignettes("dplyr")

Learning R via online courses
==============================================
* [Coursera](https://www.coursera.org)
* [edX](https://www.edX.org)
* [RStudio](https://www.rstudio.com/resources/training/online-learning/#R)
* [Quick-R](http://www.statmethods.net/) -
Mostly for basic and base functions
* [RStudio Cheatcheets](https://www.rstudio.com/resources/cheatsheets/)

Reading and Loading Datasets into Memory
==============================================
* Requires installation of `devtools` package and Rtools (varies by OS)

```r
devtools::install_github("username/repository")
devtools::install_github("hadley/readr")
devtools::install_github("hadley/haven")
```

Read Time
==============================================

```r
file.info("data/BRFSS2013_Data.csv")$size/(1024^2)
system.time(read.csv("data/BRFSS2013_Data.csv"))

library(readr)
system.time(read_csv("data/BRFSS2013_Data.csv"))
```

58.8 MB File

Function         | Elapsed Time
---------------- | ------------
utils::read.csv  | 5.115
readr::read_csv  | 1.836

Read Time (2)
==============================================

* You may also consider the `fread` function
* data.table syntax is different


```r
library(data.table)
?fread
```

Data Munging using `tidyr`
==============================================
* `tidyr` faciliates reshaping of data
1. spread vs. gather \color{purple}{*most likely to use}\color{black}
2. extract/separate vs. unite
3. nest vs. unnest

Data Manipulation using `dplyr`
==============================================
* `dplyr` convention aims to ease cognitive burden
* Function names are easy to remember
1. select (Y)
2. mutate/transmute (add Ys / new Y)
3. filter (get Xs based on condition)
4. slice (get Xs specified)
5. summarise (reduce to single observation) 
6. arrange (re-order observations)

Examples of use
==============================================
* Create an example of messy data: 


```r
library(dplyr); library(tidyr)
data("mtcars")
mtcars <- select(mtcars, c(mpg:hp, wt, vs:carb))
mtcars <- unite(mtcars, cylgear, cyl, gear)
separate(mtcars, cylgear, c("cyl0", "gear0"))[1:3,]
```

```
##                mpg cyl0 gear0 disp  hp    wt vs am carb
## Mazda RX4     21.0    6     4  160 110 2.620  0  1    4
## Mazda RX4 Wag 21.0    6     4  160 110 2.875  0  1    4
## Datsun 710    22.8    4     4  108  93 2.320  1  1    1
```

mtcars <- select(mtcars, c(1:4, 5, 7:11))

Mutate & Transumte
==============================================

```r
head(mutate(mtcars, displ_l = disp/61.0237))
```

```
##    mpg cylgear disp  hp    wt vs am carb  displ_l
## 1 21.0     6_4  160 110 2.620  0  1    4 2.621932
## 2 21.0     6_4  160 110 2.875  0  1    4 2.621932
## 3 22.8     4_4  108  93 2.320  1  1    1 1.769804
## 4 21.4     6_3  258 110 3.215  1  0    1 4.227866
## 5 18.7     8_3  360 175 3.440  0  0    2 5.899347
## 6 18.1     6_3  225 105 3.460  1  0    1 3.687092
```

```r
head(transmute(mtcars, disp_l = disp/61.0237),2)
```

```
##     disp_l
## 1 2.621932
## 2 2.621932
```

Example with base functions
==============================================

```r
data("mtcars")
mtcars <- mtcars[,c("mpg", "cyl", "disp", "hp",
                    "wt", "vs", "am", "gear", "carb")]
mtcars$cylgear <- with(mtcars, paste(cyl, gear, sep = "."))
mtcars[, c("cyl1", "gear1")] <- NA
mtcars[, c("cyl1", "gear1")] <-
  t(sapply(strsplit(mtcars$cylgear, ".", fixed = TRUE), FUN = "[", c(1,2)))
head(mtcars, 3)
```

```
##                mpg cyl disp  hp    wt vs am gear carb cylgear cyl1 gear1
## Mazda RX4     21.0   6  160 110 2.620  0  1    4    4     6.4    6     4
## Mazda RX4 Wag 21.0   6  160 110 2.875  0  1    4    4     6.4    6     4
## Datsun 710    22.8   4  108  93 2.320  1  1    4    1     4.4    4     4
```

Considerations
==============================================

\huge{Be careful of loss of information!}

Functional programming example
==============================================

```r
hourly_delay <- filter(
  summarise(
    group_by(
      filter(
        flights,
        !is.na(dep_delay)
      ),
      date, hour
    ), 
    delay = mean(dep_delay),
    n = n()
  ), 
  n > 10
)
```

Pipes for fluid and readable programming
==============================================
* Piping operator: %>%
* Consider the previous example with pipes:


```r
hourly_delay <- flights %>% 
  filter(!is.na(dep_delay)) %>%
  group_by(date, hour) %>%
  summarise(delay = mean(dep_delay), n = n()) %>%
  filter(n > 10)
```

More piping
==============================================

```r
library(nycflights13)
flights %>% group_by(carrier) %>% 
  summarise(avg_depdelay = mean(dep_delay, na.rm = TRUE), count = n()) %>% 
  left_join(airlines) %>% arrange(avg_depdelay) %>% head
```

```
## Warning in left_join_impl(x, y, by$x, by$y): joining factor and character
## vector, coercing into character vector
```

```
## Source: local data frame [6 x 4]
## 
##   carrier avg_depdelay count                   name
##     (chr)        (dbl) (int)                 (fctr)
## 1      US     3.782418 20536        US Airways Inc.
## 2      HA     4.900585   342 Hawaiian Airlines Inc.
## 3      AS     5.804775   714   Alaska Airlines Inc.
## 4      AA     8.586016 32729 American Airlines Inc.
## 5      DL     9.264505 48110   Delta Air Lines Inc.
## 6      MQ    10.552041 26397              Envoy Air
```

Using `separate`
==============================================

```r
data(iris)
longdata <- gather(iris, key = measure, n, Sepal.Length:Petal.Width) %>% 
  separate(measure, c("type", "dimension"))
longdata %>% group_by(Species, type, dimension) %>% summarise(avg_dim = mean(n, na.rm = TRUE))
```

```
## Source: local data frame [12 x 4]
## Groups: Species, type [?]
## 
##       Species  type dimension avg_dim
##        (fctr) (chr)     (chr)   (dbl)
## 1      setosa Petal    Length   1.462
## 2      setosa Petal     Width   0.246
## 3      setosa Sepal    Length   5.006
## 4      setosa Sepal     Width   3.428
## 5  versicolor Petal    Length   4.260
## 6  versicolor Petal     Width   1.326
## 7  versicolor Sepal    Length   5.936
## 8  versicolor Sepal     Width   2.770
## 9   virginica Petal    Length   5.552
## 10  virginica Petal     Width   2.026
## 11  virginica Sepal    Length   6.588
## 12  virginica Sepal     Width   2.974
```

Piping with `tidyr`
==============================================

```r
library(readr)
(pew <- read_csv("../data/pew.csv"))
```

```
## Source: local data frame [18 x 11]
## 
##                   religion <$10k $10-20k $20-30k $30-40k $40-50k $50-75k
##                      (chr) (int)   (int)   (int)   (int)   (int)   (int)
## 1                 Agnostic    27      34      60      81      76     137
## 2                  Atheist    12      27      37      52      35      70
## 3                 Buddhist    27      21      30      34      33      58
## 4                 Catholic   418     617     732     670     638    1116
## 5       Don’t know/refused    15      14      15      11      10      35
## 6         Evangelical Prot   575     869    1064     982     881    1486
## 7                    Hindu     1       9       7       9      11      34
## 8  Historically Black Prot   228     244     236     238     197     223
## 9        Jehovah's Witness    20      27      24      24      21      30
## 10                  Jewish    19      19      25      25      30      95
## 11           Mainline Prot   289     495     619     655     651    1107
## 12                  Mormon    29      40      48      51      56     112
## 13                  Muslim     6       7       9      10       9      23
## 14                Orthodox    13      17      23      32      32      47
## 15         Other Christian     9       7      11      13      13      14
## 16            Other Faiths    20      33      40      46      49      63
## 17   Other World Religions     5       2       3       4       2       7
## 18            Unaffiliated   217     299     374     365     341     528
## Variables not shown: $75-100k (int), $100-150k (int), >150k (int), Don't
##   know/refused (int)
```

Using `gather`
==============================================


```r
pew %>% gather(income, n, -religion) %>% head
```

```
## Source: local data frame [6 x 3]
## 
##             religion income     n
##                (chr) (fctr) (int)
## 1           Agnostic  <$10k    27
## 2            Atheist  <$10k    12
## 3           Buddhist  <$10k    27
## 4           Catholic  <$10k   418
## 5 Don’t know/refused  <$10k    15
## 6   Evangelical Prot  <$10k   575
```

income, religion : variables to gather 
n : variable in cells 
-religion means all except religion

Using `group_by`
==============================================

```r
pew %>% gather(income, n, -religion) %>% group_by(income) %>% summarise(totals = sum(n))
```

```
## Source: local data frame [10 x 2]
## 
##                income totals
##                (fctr)  (int)
## 1               <$10k   1930
## 2             $10-20k   2781
## 3             $20-30k   3357
## 4             $30-40k   3302
## 5             $40-50k   3085
## 6             $50-75k   5185
## 7            $75-100k   3990
## 8           $100-150k   3197
## 9               >150k   2608
## 10 Don't know/refused   6121
```

Using `group_by` (2)
==============================================

```r
pew %>% gather(income, n, -religion) %>% group_by(religion) %>% summarise(totals = sum(n))
```

```
## Source: local data frame [18 x 2]
## 
##                   religion totals
##                      (chr)  (int)
## 1                 Agnostic    826
## 2                  Atheist    515
## 3                 Buddhist    411
## 4                 Catholic   8054
## 5       Don’t know/refused    272
## 6         Evangelical Prot   9472
## 7                    Hindu    257
## 8  Historically Black Prot   1995
## 9        Jehovah's Witness    215
## 10                  Jewish    682
## 11           Mainline Prot   7470
## 12                  Mormon    581
## 13                  Muslim    116
## 14                Orthodox    363
## 15         Other Christian    129
## 16            Other Faiths    449
## 17   Other World Religions     42
## 18            Unaffiliated   3707
```

Summary
==============================================
* Big data not always the best option
* Tidy data makes everything easier and saves time
* Learning R can be a bit frustrating but certainly not impossible
* R is great for small types of datasets that fit into memory but can also be used in HPC
* Writing R code should not be a cognitive burden on the user 
* R programming should be readable and fun to use!
