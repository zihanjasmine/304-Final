

#### Preamble ####
# Purpose: Stimuate COVID-19 Cases in Toronto dataset.
# Author: Zihan Zhang
# Email: zhanzihan.zhang@mail.utoronto.ca
# Date: 27 May 2022
 

#### Workspace set-up ####
library(janitor)
library(lubridate)
library(tidyverse)

#### Simulate data ####
set.seed(623)
simulated_data <-
  tibble(
    gender = c(
      rep('male', 497),
      rep('female', 503)
    ),
    outbreak_associated = 
      c(
        rep('Outbreak Associated', 162),
        rep('Sporadic', 838)
      ),
    outcome = 
      c(
        rep('Resolved', 979),
        rep('Fatal', 21)
      ),
    classification = 
      c(
        rep('Confirmed', 984),
        rep('Probable', 16)
      ),
    age_group = c(
      rep('19 and younger', 147),
      rep('20-29', 199),
      rep('30-39', 165),
      rep('40-49', 144),
      rep('50-59', 144),
      rep('60-69', 95),
      rep('70-79', 45),
      rep('80-89', 38),
      rep('over 90', 23)

    ),
    ever_hospitalized = 
      c(
        rep('Yes', 54),
        rep('No', 946)
      ),
    source_of_infection = c(
      rep('Close Contact', 56),
      rep('Community', 118),
      rep('Household Contact', 166),
      rep('No Information', 486),
      rep('Outbreaks, Congregate Settings', 8),
      rep('Outbreaks, Healthcare Institutions', 98),
      rep('Outbreaks, Other Settings', 63),
      rep('Travel', 5)
      
    ),
    ever_in_icu = 
      c(
        rep('Yes', 10),
        rep('No', 990)
      ),
    ever_intubated = 
      c(
        rep('Yes', 6),
        rep('No', 994)
      ),
    

  )


library(modelsummary)

simulated_data %>% 
  datasummary_skim(type = "categorical",
                   title = "Summary of categorical variables for test dataset")





# Note: there are 9 variables in total: gender,age group,classification,outcome,
# outbreak associated, ever hospitalized,ever in icu, ever intubated, and 
# source of infection. The stimulated data has 1000 observations in total. 