---
title: "Data reading example"
author: "Levi Waldron"
date: "October 17, 2015"
output: html_document
---

This example we did at the end of the day shows three different ways to load in a csv file.  You can get this file at http://goo.gl/x87GY6 .

# Traditional

First, let's read the file the traditional way:


```r
chs = read.csv("chs2012_codedforR.csv")
```

```
## Warning in file(file, "rt"): cannot open file 'chs2012_codedforR.csv': No
## such file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

Summarize it:


```r
summary(chs)
```

```
## Error in summary(chs): object 'chs' not found
```

# data.table


```r
library(data.table)
```

```
## data.table 1.9.6  For help type ?data.table or https://github.com/Rdatatable/data.table/wiki
## The fastest way to learn (by data.table authors): https://www.datacamp.com/courses/data-analysis-the-data-table-way
```

```r
chs2 = fread("chs2012_codedforR.csv", data.table=FALSE)
```

```
## Error in fread("chs2012_codedforR.csv", data.table = FALSE): File 'chs2012_codedforR.csv' does not exist. Include one or more spaces to consider the input a system command.
```

Summarize again:


```r
summary(chs2)
```

```
## Error in summary(chs2): object 'chs2' not found
```

```r
class(chs2)
```

```
## Error in eval(expr, envir, enclos): object 'chs2' not found
```

# readr


```r
library(readr)
```

```
## Error in library(readr): there is no package called 'readr'
```

```r
chs3 = read_csv("chs2012_codedforR.csv")
```

```
## Error in eval(expr, envir, enclos): could not find function "read_csv"
```

Summarize:

```r
summary(chs3)
```

```
## Error in summary(chs3): object 'chs3' not found
```

```r
class(chs3)
```

```
## Error in eval(expr, envir, enclos): object 'chs3' not found
```
