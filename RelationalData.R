library(nycflights13)
glimpse(flights)

flights

#2.1

a <- flights %>%
  group_by(dest) %>%
  summarize(delay = mean(arr_delay, na.rm = TRUE))
a

b <- left_join(flights, a, by = "dest")
b

c <- airports %>% rename(dest = faa)
c

d <- left_join(b, c, by = "dest")
d

d %>%
  ggplot(aes(lon, lat, color=delay)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

#2.2

flights_new <- flights %>%
  left_join(airports,c("dest" = "faa")) %>%
  rename(lat_dest = lat, long_dest = lon) %>%
  left_join(airports, c("origin" = "faa")) %>%
  rename(lat_origin = lat, long_origin = lon)
flights_new

#2.3
age <- planes %>% mutate(age = 2013-year)
age

delay <- left_join(flights, age, by = "tailnum")
delay

delay %>% ggplot(aes(age, dep_delay)) +
  geom_point() +
  geom_smooth()


#3.1
flights %>% group_by(tailnum) %>%
  summarize(abundance = n()) %>%
  filter(abundance >= 100)
# 1218 flights

#3.2
# anti_join(flights, airports, by = c("dest" = "faa")) would drop all
# observations in flights that don't have an observation in airport.

# anti_join(airports, flights, by = c("faa" = "dest")) would drop all
# observations in airports that don't have an observation in flights.









