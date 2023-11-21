library(tidyverse)
surveys <- read_csv("data/surveys.csv")

#Select
select(surveys, year, month, day)
select(surveys, month, day, year)

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
