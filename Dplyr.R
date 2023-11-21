library(tidyverse)
surveys <- read_csv("data/surveys.csv")
surveys
surveys1 <- surveys
#Select
select(surveys, year, month, day)
select(surveys, month, day, year)

#Exercise 1

#Filter
filter(surveys, species_id == "DS")

#Mutate
mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)

#Add to DF
surveys_plus <- mutate(surveys,
                       hindfoot_length_cm = hindfoot_length / 10)
surveys_plus

#Overwrite
surveys <- mutate(surveys,
                hindfoot_length_cm = hindfoot_length / 10)

#Shrub
shrub <- surveys <- read_csv("data/shrub-volume-data.csv")
names(shrub)
str(shrub)

#Select
select(shrub, length)
select(shrub, site, experiment)

#Filter
filter(shrub, height > 5)
shrub_data_w_vols <- mutate(shrub, volume = length * width)
shrub_data_w_vols

#Aggregation
group_by(surveys1, species_id)
surveys_by_species <- group_by(surveys1, species_id)

#Summarize
summarize(surveys_by_species, abundance = n())

surveys_by_species_plot <- group_by(surveys, species_id, plot_id)
summarize(surveys_by_species, abundance = n())

surveys_by_species_plot

#Weight
species_weight <- summarize(surveys_by_species_plot, avg_weight = mean(weight))
species_weight

#Weight with NA removed
species_weight <- summarize(surveys_by_species,
                            avg_weight = mean(weight, na.rm = TRUE))
species_weight

species_weight1 <- summarize(surveys_by_species,
                            avg_weight = mean(weight), na.omit(species_weight))
species_weight1

#Intermediate Variable
ds_data <- filter(surveys, species_id == "DS")
ds_data_by_year <- group_by(ds_data, year)
ds_weight_by_year <- summarize(ds_data_by_year,
                               avg_weight = mean(weight, na.rm = TRUE))
ds_weight_by_year

#Exercise 2
df <- select(surveys, year, month, day, species_id)

df1 <- select(surveys, year, species_id, weight)
df1

#Mass kg
df2 <- mutate(df1, weight_kg = weight/1000)
df2

df3<- na.omit(df2)
df3

#Filter for species SH
df4 <- filter(df3, species_id == "SH")
df4

#Number of indv/species
df5 <- group_by(df3, species_id)
df6 <- summarize(df5, abundance = n())
df6

#Number of indv/species/year
df7 <- group_by(df3, species_id, year)
df8 <- summarize(df7, abundance = n())
df8

#Mean mass of DO
df9 <- filter(df3, species_id == "DO")
df10 <- group_by(df9, year)
df11<- summarize(df10, mean_weight = mean(weight))
df11

#Pipes
x = c(1, 2, 3)
mean(x)

x %>% mean()

x = c(1, 2, 3, NA)
mean(x, na.rm = TRUE)
x %>% mean(na.rm = TRUE)

surveys %>%
  filter(species_id == "DS", !is.na(weight))

#Species DS weight/year
ds_weight_by_year <- surveys %>%
  filter(species_id == "DS") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))
ds_weight_by_year

#Exercise 3
surveys1 <- surveys %>%
  select(year, species_id, weight) %>%
  na.omit(weight) %>%
  mutate(weigh_kg = weight/1000)
surveys1

surveys2 <- surveys %>%
  select(year, month, day, species_id) %>%
  filter(species_id == "SH")
surveys2

#Number of indv/species
surveys3 <- surveys %>%
  group_by(species_id) %>%
  summarize(abundance = n())
surveys3

#Number of indv/species/year
surveys4 <- surveys %>%
  group_by(species_id, year) %>%
  summarize(abundance = n())
surveys4

#Mean mass of DO/year
surveys5 <- surveys %>%
  filter(species_id == "DO") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))
surveys5

#Multiple filter conditions

#AND
filter(surveys, species_id == "DS", year > 1995)
filter(surveys, species_id == "DS" & year > 1995)

#OR
filter(surveys, species_id == "DS" | species_id == "DM" | species_id == "DO")

#Filtering by aggregated properties
species_weights <- surveys1 %>%
  group_by(species_id) %>%
  filter(n() > 100) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))
species_weights

