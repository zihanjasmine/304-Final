

#### Preamble ####
# Purpose: Clean the data downloaded from Open Data Toronto.
# Author: Zihan Zhang  
# Email: zhanzihan.zhang@mail.utoronto.ca
# Date:25 May 2022
 

#### Workspace set-up ####
library(janitor)
library(lubridate)
library(tidyverse)

#### Clean data ####


raw <- read_csv("inputs/data/raw.csv")


# clean variable names 
cleaned_data <- raw %>%
  clean_names()

cleaned_data <- cleaned_data %>%
# remove na values in age group
  filter(age_group != "NA") %>%
  select(-assigned_id) %>%
  mutate(hosptial= case_when(ever_hospitalized == "Yes" ~ "1",
                         TRUE ~"0"))
  
# export cleaned data
write_csv(cleaned_data, "inputs/data/cleaned_data.csv")