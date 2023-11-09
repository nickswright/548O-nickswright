#This code takes the fish data cv and then creates a new data frame named fish_data_cat
#in which the length_cat column is mutated into big (length>300) and small (length<300) categories.
fish_data = read.csv("data/Gaeta_etal_CLC_data.csv")

fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))



