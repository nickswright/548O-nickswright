library(stringr)
gDat <- gapminder::gapminder
str(gDat)
library(tidyverse)



#Quantifiers
(strings <- c("a", "ab", "acb", "accb", "acccb", "accccb"))
grep("ac*b", strings, value = TRUE)
grep("ac+b", strings, value = TRUE)
grep("ac?b", strings, value = TRUE)
grep("ac{2}b", strings, value = TRUE)
grep("ac{2,}b", strings, value = TRUE)
grep("ac{2,3}b", strings, value = TRUE)

#Exercise 1
grep("e{2,}", gDat$country, value = TRUE)

#Position of pattern within the string
(strings <- c("abcd", "cdab", "cabd", "c abd"))
grep("ab", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("ab$", strings, value = TRUE)
grep("\\bab", strings, value = TRUE)

#Operators
(strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12"))
grep("ab.", strings, value = TRUE)
grep("ab[c-e]", strings, value = TRUE)
grep("ab[^c]", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("\\^ab", strings, value = TRUE)
grep("abc|abd", strings, value = TRUE)

gsub("(ab) 12", "\\1 34", strings)

#Exercise 2
grep(".R$", dir(), value = TRUE)

#Exercise 3
i_t <- grep("i|t|I|T", gDat$country, value = TRUE)
i_t
land <- unique(grep("land$", i_t, value = TRUE))
land
LAND <- gsub("land", "LAND", land)
LAND

#General modes for patterns
(strings <- c("Axbc", "A.bc"))
pattern <- "A.b"
grep(pattern, strings, value = TRUE)
grep(pattern, strings, value = TRUE, fixed = TRUE)

pattern <- "a.b"
grep(pattern, strings, value = TRUE)
grep(pattern, strings, value = TRUE, ignore.case = TRUE)


#Exercise 4
unique(grep("o", gDat$continent, value = TRUE, ignore.case = TRUE))


