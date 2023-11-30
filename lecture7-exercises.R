#Exercise 1 - Function to convert pounds to grams
pounds_to_grams <- function(x) {
  grams <- (x * 453.592)
  return(grams)
}

pounds_to_grams(3.75)

#Exercise 2

#This function uses allometric scaling to predict mass based on length for Theropod dinosaurs.
get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

Spinosaurus_mass <- get_mass_from_length_theropoda(16) ; Spinosaurus_mass

#Function to estimate mass (kg) for length (m) from any organism
get_mass_from_length <- function(a, length, b) {
  mass <- a * length^b
  return(mass)
}

sauropoda <- get_mass_from_length(214.44, 26, 1.46) ; sauropoda

#Exercise 3

#Function with
get_mass_from_length1 <- function(a = 39.9, length, b = 2.6) {
  mass <- a * length^b
  return(mass)
}

sauropoda1 <- get_mass_from_length1(214.44, 22, 1.46) ; sauropoda1
unknown <- get_mass_from_length1(length = 16) ; unknown

#Exercise 4
kg_to_lb <-function(x) {
  lb <- (x * 2.205)
  return(lb)
}

stegosaurus <- get_mass_from_length(10.95, length = 12, 2.64)
stegosaurus_lb <- kg_to_lb(stegosaurus) ; stegosaurus_lb


