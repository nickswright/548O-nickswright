#Part 1
library(tidyverse)

#LOTR Data
fship <- read_csv(file.path("data", "The_Fellowship_Of_The_Ring.csv"))
ttow <- read_csv(file.path("data", "The_Two_Towers.csv"))
rking <- read_csv(file.path("data", "The_Return_Of_The_King.csv"))

rking

lotr_untidy <- bind_rows(fship, ttow, rking)
str(lotr_untidy)

lotr_tidy <-
 pivot_longer(lotr_untidy, cols=c(Female, Male), names_to = 'Gender', values_to = 'Words')
lotr_tidy

write_csv(lotr_tidy, path = file.path("data", "lotr_tidy.csv"))

#Gender Data
female <- read_csv(file.path("data", "Female.csv"))
male <- read_csv(file.path("data", "Male.csv"))

lotr_gender <- bind_rows(female, male)
lotr_gender


#Compute Number of Words Method 1 Untidy
words_per_film <- lotr_gender %>%
  group_by(Film) %>%
  summarise(
    Words_Elf = sum(Elf),
    Words_Hobbit = sum(Hobbit),
    Words_Man = sum(Man)
  )

words_per_film

#Compute Number of Words Method 2 Tidy
lotr_tidy
by_race_film <- lotr_tidy %>%
    group_by(Film, Race) %>%
  summarize(Words = sum(Words))
by_race_film

#Part 2

#Spread
lotr_tidy <- read_csv(file.path("data", "lotr_tidy.csv"))
lotr_tidy
lotr_tidy %>%
  spread(key = Race, value = Words)

lotr_tidy %>%
  spread(key = Gender, value = Words)

lotr_tidy %>%
  unite(Race_Gender, Race, Gender) %>%
  spread(key = Race_Gender, value = Words)

#Pivot Wider
race_wide <- lotr_tidy %>% pivot_wider(names_from = Race, values_from = Words)
race_wide

gender_wide<- lotr_tidy %>% pivot_wider(names_from = Gender, values_from = Words)
gender_wide
