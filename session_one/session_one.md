Introduction to R
========================================================
author: Timothy Tickle
date: October 17th, 2015

What is RStudio?
========================================================

- IDE Interactive Development Environment
- Console + Help + Figures + Project Management
- Let's use it!

Crunching Numbers
========================================================

- 5 + 2
- 5 - 2
- 5 * 2
- 5 / 2
- 5 ^ 2
- 5 ** 2
- 5 %% 2
- 5 %/% 2

---

- addition
- subtraction
- multiplication
- division
- exponentiation
- exponentiation
- modulus ( remainder )
- integer division (divisor )

Try it yourself
========================================================

- 1. 5 plus 4 __then__ times 2
- 1. 5 plus 7 __then__ divided by 2
- 1. 4 minus 2 __then__ to the power of 2
- 1. 5 plus 5 __then__ modulus 5

---

![Question Cat](cats/question_cat.png)

Adding Logic to Your Code
========================================================

- 5 < x
- 5 <= x
- 5 > x
- 5 >= x
- 5 == x
- 5 != x
- !x
- True || False
- True && False
- isTrue( x )

---

- less than
- less than or equal to
- greater than
- greater than or equal to
- equal to
- not equal to
- Logical NOT
- Logical OR
- Logical AND
- Test for True

Warning for Precision
========================================================

![Angry Cat](cats/sad_cat2.png)

Warning for Precision
========================================================
class:small-code


```r
sqrt(4) * sqrt(4) == 4
```

```
[1] TRUE
```

```r
sqrt(2) * sqrt(2) == 2
```

```
[1] FALSE
```

```r
all.equal( sqrt(2) * sqrt(2), 2)
```

```
[1] TRUE
```

Storing Data / Making Variables
========================================================
class:small-code

The rules:
- Letters, numbers, dots, underscores
- Must start with a letter or a dot not followed by a number
- No reserve words, No spaces


```r
x <- 5
x
```

```
[1] 5
```

```r
x * 2
```

```
[1] 10
```

Storing Data / Making Variables
========================================================
class:small-code


```r
x <- 2
x <- x + 1
x
```

```
[1] 3
```

Storing Data / Making Variables
========================================================
class:small-code


```r
x <- 2
x <- x + 1
y <- 4
x * y
```

```
[1] 12
```

Basic Data Types
========================================================

- integer
- numeric
- character (Strings)
- logical
- factor
- ordered factor
- Missing Values and others

---

- 1
- 1.0
- "hello"   'hello'  "a"    'a'
- TRUE FALSE
- factor("GroupOne")
- factor( c("d","o","g"), ordered = TRUE)
- NA, NaN, -Inf, Inf
- class()

Group Similar Data with Vectors
========================================================
class:small-code

Vector - Single collection of the same data mode


```r
c(1,2,3,4,5,6,7)
```

```
[1] 1 2 3 4 5 6 7
```

```r
5:9
```

```
[1] 5 6 7 8 9
```

```r
9:1
```

```
[1] 9 8 7 6 5 4 3 2 1
```

Character Vectors
========================================================
class:small-code


```r
c( "a", "a", "a", "a", "a" )
```

```
[1] "a" "a" "a" "a" "a"
```

```r
rep( "a", 5 )
```

```
[1] "a" "a" "a" "a" "a"
```

```r
c( "Cats","are","amazing" )
```

```
[1] "Cats"    "are"     "amazing"
```

Logical Vectors
========================================================
class:small-code


```r
c( TRUE, FALSE, TRUE, TRUE, FALSE )
```

```
[1]  TRUE FALSE  TRUE  TRUE FALSE
```

Factor Vector
========================================================
class:small-code


```r
factor( c( "Cats","are","still", "amazing" ) )
```

```
[1] Cats    are     still   amazing
Levels: amazing are Cats still
```

Vectors Must Be of One Data Mode
========================================================
class:small-code


```r
c( 1, "2", FALSE)
```

```
[1] "1"     "2"     "FALSE"
```

```r
c( 1, FALSE )
```

```
[1] 1 0
```

---

!["Confused Cat"](cats/surprised_cat_3.png)

Combining Vectors
========================================================
class:small-code


```r
x <- 1:4
y <- 5:10
c( x, y )
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
c( 1:4, 5:10 )
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

Selecting Vector Elements
========================================================
class:small-code

- One element

```r
x <- 1:4
x[ 2 ]
```

```
[1] 2
```
- A slice of a vector

```r
x <- 1:10
x[ 4:7 ]
```

```
[1] 4 5 6 7
```

Selecting Vector Elements
========================================================
class:small-code

- Multiple elements ( not contiguous )

```r
x <- c( "a", "b", "c", "d", "e", "f" )
x[ c(5,3,1) ]
```

```
[1] "e" "c" "a"
```
- Removing elements

```r
x <- 5:1
x[ -1 ]
```

```
[1] 4 3 2 1
```

Selecting Vector Elements
========================================================
class:small-code

- Using logical vector

```r
# Start with vector from 1 - 10
x <- 1:10
# Get indices of even elements
y <- x%%2 == 0
# Pull out those even element by index
x[y]
```

```
[1]  2  4  6  8 10
```

2-Dimensional Vectors are Matrices
========================================================
class:small-code


```r
matrix( 1:20, nrow = 5, ncol = 4 )
```

```
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]    2    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20
```

Indexing Matrices
========================================================
class:small-code

- matrix[ r, c ]

```r
boring.matrix <- matrix( 1:20, nrow = 5, ncol = 4 )
dim( boring.matrix )
```

```
[1] 5 4
```

```r
boring.matrix[ ,1 ]
```

```
[1] 1 2 3 4 5
```

```r
boring.matrix[ 2, ]
```

```
[1]  2  7 12 17
```

Indexing Matrices
========================================================
class:small-code

- matrix[ r, c ]

```r
boring.matrix
```

```
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]    2    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20
```

```r
boring.matrix[ 2, 1 ]
```

```
[1] 2
```

Updating Data in Matrices
========================================================
class:small-code


```r
boring.matrix[ 2, 1 ] <- 99 
boring.matrix
```

```
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]   99    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20
```

Matrix Operations
========================================================
class:small-code

- Transpose

```r
boring.matrix <- matrix(1:9, nrow = 3)
boring.matrix
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```

```r
t(boring.matrix)
```

```
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
```

Matrix Operations
========================================================
class:small-code

- Adding


```r
boring.matrix
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```

```r
boring.matrix + 1
```

```
     [,1] [,2] [,3]
[1,]    2    5    8
[2,]    3    6    9
[3,]    4    7   10
```

Matrix Operations
========================================================
class:small-code

- Adding

```r
boring.matrix
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```

```r
boring.matrix + boring.matrix
```

```
     [,1] [,2] [,3]
[1,]    2    8   14
[2,]    4   10   16
[3,]    6   12   18
```

Matrix Operations
========================================================
class:small-code

- Multiplying

```r
boring.matrix
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```

```r
boring.matrix * 2
```

```
     [,1] [,2] [,3]
[1,]    2    8   14
[2,]    4   10   16
[3,]    6   12   18
```

Matrix Operations
========================================================
class:small-code

- Multiplying

```r
boring.matrix
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```

```r
boring.matrix * boring.matrix
```

```
     [,1] [,2] [,3]
[1,]    1   16   49
[2,]    4   25   64
[3,]    9   36   81
```

Matrix Operations
========================================================
class:small-code

- Linear Algebra

```r
boring.matrix
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```

```r
boring.matrix %*% boring.matrix
```

```
     [,1] [,2] [,3]
[1,]   30   66  102
[2,]   36   81  126
[3,]   42   96  150
```

Naming Matrices
========================================================
class:small-code


```r
colnames( boring.matrix ) <- c( "c1","c2","c3" )
rownames( boring.matrix ) <- c( "r1", "r2", "r3" )
boring.matrix
```

```
   c1 c2 c3
r1  1  4  7
r2  2  5  8
r3  3  6  9
```

```r
boring.matrix["r1",]
```

```
c1 c2 c3 
 1  4  7 
```

Relax, Break!
=========================================================

![Happy cat](cats/happy_cat.jpg)

Data Frames: Matrices of Many Data Types
========================================================
class:small-code


```r
x <- 11:16
y <- seq(0,1,.2)
z <- c( "one", "two", "three", "four", "five", "six" )
a <- factor( z )
```

Data Frames: Matrices of Many Data Types
========================================================
class:small-code

* Data frames are column major


```r
data.frame(x,y,z,a)
```

```
   x   y     z     a
1 11 0.0   one   one
2 12 0.2   two   two
3 13 0.4 three three
4 14 0.6  four  four
5 15 0.8  five  five
6 16 1.0   six   six
```

```r
test.dataframe <- data.frame(x,y,z,a)
```

Data Frames are Column Major
========================================================
class:small-code




```r
test.dataframe
```

```
   x   y     z     a
1 11 0.0   one   one
2 12 0.2   two   two
3 13 0.4 three three
4 14 0.6  four  four
5 15 0.8  five  five
6 16 1.0   six   six
```

```r
class( test.dataframe[3] )
```

```
[1] "data.frame"
```

Data Frames Hold Different Data Modes
========================================================
class:small-code


```r
class( test.dataframe[[1]] )
```

```
[1] "integer"
```

```r
class( test.dataframe[[2]] )
```

```
[1] "numeric"
```

```r
class( test.dataframe[[3]] )
```

```
[1] "factor"
```

Warning!
========================================================

* Data frames can change your data modes

![Mad Cat](cats/mad_cat.jpg)

Warning!
========================================================
class:small-code


```r
LETTERS
```

```
 [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q"
[18] "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
```

```r
class( LETTERS )
```

```
[1] "character"
```

```r
data.mode.df <- data.frame( LETTERS )
class( data.mode.df[[ 1 ]] )
```

```
[1] "factor"
```

Combining Data Frames
========================================================
class:small-code


```r
mini.frame.one <- data.frame( "one" = 1:4 )
mini.frame.two <- data.frame( "two" = 6:9 )
```

Combining Data Frames
========================================================
class:small-code

* binding columns with common row names

```r
cbind( mini.frame.one, mini.frame.two )
```

```
  one two
1   1   6
2   2   7
3   3   8
4   4   9
```
* rbind for binding rows ( with common column names )

Updating Data Frames
========================================================
class:small-code


```r
test.dataframe
```

```
   x   y     z     a
1 11 0.0   one   one
2 12 0.2   two   two
3 13 0.4 three three
4 14 0.6  four  four
5 15 0.8  five  five
6 16 1.0   six   six
```

Updating Data Frames
========================================================
class:small-code


```r
test.dataframe[[1]] = 21:26
test.dataframe
```

```
   x   y     z     a
1 21 0.0   one   one
2 22 0.2   two   two
3 23 0.4 three three
4 24 0.6  four  four
5 25 0.8  five  five
6 26 1.0   six   six
```

Updating Data Frames
========================================================
class:small-code


```r
test.dataframe[[3,1]] = 111
test.dataframe
```

```
    x   y     z     a
1  21 0.0   one   one
2  22 0.2   two   two
3 111 0.4 three three
4  24 0.6  four  four
5  25 0.8  five  five
6  26 1.0   six   six
```

Lists are Filing Cabinets
========================================================
class:small-code

So I have a person with:
- 5 medical measurements, 10 self-reported measurements, no children, Two parent names


```
[1]  1.3  1.6  3.2  9.8 10.2
```

```
 [1] 13  6  4  7  6  5  8  9  7  4
```

```
[1] FALSE
```

```
[1] "Parent1.name" "Parent2.name"
```

Lists are Filing Cabinets
========================================================
class:small-code


```r
measurements <- c( 1.3, 1.6, 3.2, 9.8, 10.2 )
self.reporting <- c( 13, 6, 4, 7, 6, 5, 8, 9, 7, 4 )
children <- FALSE
parents <- c( "Parent1.name", "Parent2.name" )
```

Lists are Filing Cabinets
========================================================
class:small-code


```r
my.person <- list( measurements, self.reporting, children, parents )
my.person
```

```
[[1]]
[1]  1.3  1.6  3.2  9.8 10.2

[[2]]
 [1] 13  6  4  7  6  5  8  9  7  4

[[3]]
[1] FALSE

[[4]]
[1] "Parent1.name" "Parent2.name"
```

Lists are Filing Cabinets
========================================================
class:small-code

- Single bracket accessing

```r
my.person[4]
```

```
[[1]]
[1] "Parent1.name" "Parent2.name"
```

```r
my.person[1:2]
```

```
[[1]]
[1]  1.3  1.6  3.2  9.8 10.2

[[2]]
 [1] 13  6  4  7  6  5  8  9  7  4
```

Lists are Filing Cabinets
========================================================
class:small-code

- Double bracket accessing

```r
my.person[[1]]
```

```
[1]  1.3  1.6  3.2  9.8 10.2
```

Lists are Filing Cabinets
========================================================
class:small-code

 - Access by name
 

```r
my.person <- list( measure = measurements, self.measure = self.reporting, child = children, parents = parents )
my.person
```

```
$measure
[1]  1.3  1.6  3.2  9.8 10.2

$self.measure
 [1] 13  6  4  7  6  5  8  9  7  4

$child
[1] FALSE

$parents
[1] "Parent1.name" "Parent2.name"
```

Lists are Filing Cabinets
========================================================
class:small-code

 - Access by name
 

```r
my.person$parents
```

```
[1] "Parent1.name" "Parent2.name"
```

A Data Object for Every Occasion
========================================================

What data type would you use?
- Basic Data Type
- Vector
- Matrix
- Data Frame
- List

Data Structures the Others
========================================================

Oops, I may have missed somethings...
- Named Vectors
- Table
- Raw
- S3 objects
- S4 objects

---

![](cats/surprised_cat-2.jpg)

Control Structures
========================================================
class:small-code

- Running code conditionally
- Always use brackets


```r
x = 1
if( x < 5){
  print( "Mew." )
}
```

```
[1] "Mew."
```

Control Structures
========================================================
class:small-code

- Multiple Conditional operation


```r
x = 10
if( x < 3 ){
  print( "Less than three!")
} else {
  print( "Greater than or equal to three!")
}
```

```
[1] "Greater than or equal to three!"
```

Control Structures
========================================================
class:small-code

- Multiple Conditional operation


```r
x = 3
if( x < 3 ){
  print( "Less than three!" )
} else if( x > 3 ) {
  print( "Greater than three!")
} else {
  print( "Equal to three." )
}
```

```
[1] "Equal to three."
```

Control Structures
========================================================
class:small-code

- For loops

```r
measurements <- 1:10
for( value in measurements ){
  print( value * 10 )
}
```

```
[1] 10
[1] 20
[1] 30
[1] 40
[1] 50
[1] 60
[1] 70
[1] 80
[1] 90
[1] 100
```

Control Structures
========================================================
class:small-code

- For loops
- Avoid as much as possible
- Nested for loops are possible but slower

```r
print( measurements * 10 )
```

```
 [1]  10  20  30  40  50  60  70  80  90 100
```

- First: builtin functions
- Second: vectorized methods
- Third: spin your own loop

Control Structures
========================================================
class:small-code

Switches run code based on a key word


```r
measures = rlnorm(1000)
centrality = "Mean"
#centrality = "Median"
#centrality = "Mew"
switch( centrality,
  Mean = mean( measures ),
  Median = median( measures ),
  stop("Dave, I don't understand.")
)
```

```
[1] 1.540744
```

Control Structures
========================================================
class:small-code

- Vectorized ifelse operation
- This is NOT equivalent to if else


```r
measures = 1:10
ifelse( measures < 5, 0, 1)
```

```
 [1] 0 0 0 0 1 1 1 1 1 1
```

Control Structures the Others
========================================================

- Yeah, forgot about...
- while loops

Control Structures the R Way
========================================================

![Boss Cat](cats/boss_cat.jpg)

Control Structures the R Way
========================================================
class:small-code

You should avoid loops as much as possible.
- builtin functions

```
   c1 c2 c3
r1  1  4  7
r2  2  5  8
r3  3  6  9
```

```r
colSums( boring.matrix )
min( boring.matrix )
max( boring.matrix )
```

Control Structures the R Way
========================================================
class:small-code

You should avoid loops as much as possible.

- Vector indexing

```r
x = 11:20
x < 14
```

```
 [1]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```

```r
x[ x < 14 ]
```

```
[1] 11 12 13
```

Control Structures the R Way
========================================================
class:small-code

You should avoid loops as much as possible.

- Vector indexing

```r
x
```

```
 [1] 11 12 13 14 15 16 17 18 19 20
```

```r
which( x < 14 )
```

```
[1] 1 2 3
```
- How can we leverage this to impute NAs ?

Imputing NAs ... Like a Boss
========================================================
class:small-code


```r
x = 1:10
x[ c(1,3,5,7) ] <- NA
x
```

```
 [1] NA  2 NA  4 NA  6 NA  8  9 10
```

```r
x[ x == NA ] <- mean( x, na.rm = TRUE )
```
- ???

Control Structures the R Way
========================================================
class:small-code

You should avoid loops as much as possible.

- apply, sapply, tapply, mapply
- matrix[r,c]
- matrix[1,2]

---


```r
colSums( boring.matrix )
```

```
c1 c2 c3 
 6 15 24 
```

```r
apply( boring.matrix, 2, sum )
```

```
c1 c2 c3 
 6 15 24 
```

Control Structures the R Way
========================================================
class:small-code

You should avoid loops as much as possible.

- apply, sapply, tapply, mapply
- matrix[r,c]
- matrix[1,2]

---


```r
rowSums( boring.matrix )
```

```
r1 r2 r3 
12 15 18 
```

```r
apply( boring.matrix, 1, sum )
```

```
r1 r2 r3 
12 15 18 
```

Reusing Code with Functions
========================================================

- Never copy paste code
- Modularity is important to maintaining code
- Modularity is everywhere
- Builtin functions, custom functions, sourced scripts, proper libraries

Reusing Code with Functions
========================================================
class:small-code


```r
arithmetic.means <- function( values.to.measure ){
  measure.mean = sum( values.to.measure ) / length( values.to.measure )
  return( measure.mean )
}

measurements <- 1:10
arithmetic.means( measurements )
```

```
[1] 5.5
```

```r
mean( measurements )
```

```
[1] 5.5
```

Make Your First Function
========================================================

- Name the function "critical.cat"
- Should expect a number
- If the number is even should print "Mew"
- If the number is odd, should print "Eww"
- Make a comment using '#'
- Returns the number minus 1

Make Your First Function
========================================================
class:small-code


```r
critical.cat <- function( number ){
  # Making functions like a boss
  if( number %% 2 == 0 ){
    print( "Mew" )
  } else {
    print( "Eww")
  }
  return( number - 1 )
}
```

Questions on Functions?
=======================================================

![Questions](cats/professor_cat.jpg)


Reading Tables
========================================================

- Most likely the hardest task in R
- Mostly because of human error...I mean collaboration.

---

![Working with other peoples data](cats/wet_cat.jpg)

Reading Tables
========================================================
class:small-code

- read.table
- read.csv
- read.delim


```r
new.df = read.table( "data/super_fun.txt" )
dim( new.df )
```

```
[1] 3 6
```

```r
head( new.df )
new.df
```

Reading Tables
========================================================
class:small-code


```r
new.df = read.table( "data/not_so_fun.txt" )
dim( new.df )
```

```
[1] 4 7
```

```r
head( new.df )
```

```
     V1    V2    V3    V4    V5    V6    V7
1    ID col_1 col_2 col_3 col_4 col_5 col_6
2 row_1    11    12    13    14    15    16
3 row_2    21    22    23    24    25    26
4 row_3    31    32    33    34    35    36
```

Reading Tables
=========================================================

![Surprised Cat](cats/surprised_cat.jpg)

Writing Tables
========================================================
class:small-code

- write.table
- write.csv


```r
write.table( boring.matrix, "data/boring_matrix.txt")
write.csv( test.dataframe, "data/test_dataframe.csv", quote=FALSE)
```

Importing Excel
========================================================
class:small-code

- install.packages("xlsx")
- library( xlsx )

```r
library(xlsx)
read.xlsx( "data/super_fun.xlsx", 1 )
```

```
    NA. col_1 col_2 col_3 col_4 col_5 col_6
1 row_1    11    12    13    14    15    16
2 row_2    21    22    23    24    25    26
3 row_3    31    32    33    34    35    36
```

Getting Help
========================================================

- ? mean
- help.search( "mean" )
- find( "lowess")
- apropos( "lm" )
- CRAN
- Vignettes
- Manuals

Questions?
========================================================

!["win"](cats/win_cat.jpg)
