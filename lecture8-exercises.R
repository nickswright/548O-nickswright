# Exercise 1
w>10
"green" %in% colors
x>y
masses > 40

#Exercise 2
age_class = "sapling"
if (age_class == "sapling"){
  y <- 10
}
y

#Exercise 3
age_class = "seedling"
if (age_class == "sapling") {
  y <- 10
} else if (age_class == "seedling") {
  y <- 5
}
y

age_class = "adult"
if (age_class == "sapling") {
  y <- 10
} else if (age_class == "seedling") {
  y <- 5
}else {
  y <- 0
}
y

#Exercise 4
get_mass_from_length_by_name <- function(length, name){
  if (name == "Stegosauria") {
    mass <- 10.95 * length^2.64
  } else if (name == "Theropoda") {
    mass <- 0.73 * length^3.63
  } else if (name == "Sauropoda") {
    mass <- 214.44 * length^1.46
  } else {
    print("I don't know how to calculate mass for this dinosaur taxon")
    mass <- NA * length^NA
  }
  return(mass)
}

get_mass_from_length_by_name(10, "Stegosauria")
#4779.848
get_mass_from_length_by_name(8, "Theropoda")
#1385.286
get_mass_from_length_by_name(12, "Sauropoda")
#8070.685
get_mass_from_length_by_name(10, "Ankylosauria")
#NA

#Exercise 5
for (i in 2:16){
  print(i)
}

for (i in 1:5){
  print(i * 3)
}

birds = c('robin', 'woodpecker', 'blue jay', 'sparrow')
for (i in 1:length(birds)){
  print(birds[i])
}

radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = length(radius))
for (i in 1:length(radius)){
  areas[i] <- pi * radius[i] ^ 2
}
areas

lengths = c(1.1, 2.2, 1.6)
widths = c(3.5, 2.4, 2.8)
areas <- vector(length = length(lengths))
for (i in 1:length(lengths)) {
  areas[i] <- lengths[i] * widths[i]
}
areas


