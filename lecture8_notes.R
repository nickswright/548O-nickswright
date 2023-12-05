# Operators
10 > 5
"aang" == "aang"
3 != 3
"dog" %in% c("cat", "dog", "rabbit")
5 > 2 & 6 >=10
5 > 2 | 6 < 10
site = c('a', 'b', 'c', 'd')

#Variables
w <- 10.2
x <- 1.3
y <- 2.8
z <- 17.5
colors <- c("red", "blue", "green")
masses <- c(45.2, 36.1, 27.8, 81.6, 42.4)
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"

#Conditionals
x <- 6
if (x > 5){
  x <- x^2
}
x

x=6
if (x > 5){
  x <- x^2
}
x

veg_type <- "tree"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
}
mass

#Alternative conditioning
veg_type <- "grass"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
} else if (veg_type == "grass") {
  mass <- 0.65 * volume^1.2
}
mass

veg_type <- "shrub"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
} else if (veg_type == "grass") {
  mass <- 0.65 * volume^1.2
} else {
  mass <- NA
}
mass

#Multiple ifs vs else if
x <- 5
if (x > 2){
  x * 2
}
if (x > 4){
  x * 4
}

x <- 5
if (x > 2){
  x * 2
} else if (x > 4){
  x * 4
}

#Wrap conditionals within a function
est_mass <- function(volume, veg_type){
  if (veg_type == "tree") {
    mass <- 2.65 * volume^0.9
  } else if (veg_type == "grass") {
    mass <- 0.65 * volume^1.2
  } else {
    print("I don't know how to convert volume to mass for that vegetation type")
    mass <- NA
  }
  return(mass)
}

est_mass(1.6, "tree")
est_mass(1.6, "grass")
est_mass(1.6, "shrub")

#Nested conditionals
est_mass <- function(volume, veg_type, age){
  if (veg_type == "tree") {
    if (age < 5) {
      mass <- 1.6 * volume^0.8
    } else {
      mass <- 2.65 * volume^0.9
    }
  } else if (veg_type == "grass" | veg_type == "shrub") {
    mass <- 0.65 * volume^1.2
  } else {
    print("I don't know how to convert volume to mass for that vegetation type")
    mass <- NA
  }
  return(mass)
}

est_mass(1.6, "tree", age = 2)
est_mass(1.6, "shrub", age = 5)

#Iteration

#Basic for loop
for (item in list_of_items) {
  do_something(item)
}

volumes = c(1.6, 3, 8)
for (volume in volumes){
  print(2.65 * volume^0.9)
}

for (volume in volumes){
  mass <- 2.65 * volume ^ 0.9
  mass_lb <- mass * 2.2
  print(mass_lb)
}


#Looping with an index & storing results

for (i in 1:length(volumes)){
  mass <- 2.65 * volumes[i] ^ 0.9
  print(mass)
}

masses <- vector(mode = "numeric", length = length(volumes))
masses

for (i in 1:length(volumes)){
  mass <- 2.65 * volumes[i] ^ 0.9
  masses[i] <- mass
}
masses

b0 <- c(2.65, 1.28, 3.29)
b1 <- c(0.9, 1.1, 1.2)
masses <- vector(mode="numeric", length=length(volumes))
for (i in seq_along(volumes)){
  mass <- b0[i] * volumes[i] ^ b1[i]
  masses[i] <- mass
}
