# Load the relevant library
library(dplyr)
library(tidyr)

# Load the data sets
data("starwars")

# Cleaning and Managing the data set
starwars_clean <- starwars %>% 
  select(gender, mass, height,species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height/100)

# Calculating BMI
BMI <- starwars_clean %>% 
  mutate(BMI = mass/height^2)

# Calculating Average BMI
Average_BMI <- BMI %>% 
  group_by(gender) %>% 
  summarise(Average_BMI = mean(BMI))
