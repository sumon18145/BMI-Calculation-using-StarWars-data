library(dplyr)
library(tidyr)
data("starwars")

starwars_clean <- starwars %>% 
  select(gender, mass, height,species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height/100)

BMI <- starwars_clean %>% 
  mutate(BMI = mass/height^2)

Average_BMI <- BMI %>% 
  group_by(gender) %>% 
  summarise(Average_BMI = mean(BMI))
  
