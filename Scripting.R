library(tidyverse)

#Function basics
function_name <- function(inputs) {
  output_value <- do_something(inputs)
  return(output_value)
}

{a = 2
  b = 3
  a + b}

#Shrub function
calc_shrub_vol <- function(length, width, height) {
  volume <- length * width * height
  return(volume)
}

calc_shrub_vol(0.8, 1.6, 2.0)

shrub_vol <- calc_shrub_vol(0.8, 1.6, 2.0)
