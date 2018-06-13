library(tidyverse)

surveys <- read.csv("data/portal_data_joined.csv")

select(surveys, plot_id, species_id, weight)

filter(surveys, year == 1995)

surveys2 <- filter(surveys, weight < 5)
surveys_sml <- select(surveys2, species_id, sex, weight)

surveys_sml <- select(filter(surveys, weight < 5), species_id,sex,weight)

surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight)

surveys_sml <- surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight)

# Challenge 
# Using pipes, subset the surveys data to include individuals collected before
# 1995 and retain only the columns year, sex, and weight.

challenge <- surveys %>% 
  filter(year < 1995) %>% 
  select(year, sex, weight)

surveys %>% 
  mutate(weight_kg = weight/1000,
         weight_kg_double = weight_kg*2)

# Challenge
# Create a new data frame from the surveys data that meets the following
# criteria: contains only the species_id column and a new column called
# hindfoot_half containing values that are half the hindfoot_length values. In
# this hindfoot_half column, there are no NAs and all values are less than 30.
# Hint: think about how the commands should be ordered to produce this data
# frame!

surveys_hindfoot_half <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  mutate(hindfoot_half = hindfoot_length / 2) %>% 
  filter(hindfoot_half < 30) %>% 
  select(species_id, hindfoot_half)
  
head(surveys_hindfoot_half)