#### Preamble ####
# Purpose: Download the data from Open Data Toronto.
# Author: Zihan Zhang
# Data: 25 May 2022
# Contact: zhanzihan.zhang@mail.utoronto.ca 
# License: MIT




#### Workspace setup ####

# Load all the packages
library(tidyverse)
library(opendatatoronto)
library(dplyr)



# get package
package <- show_package("64b54586-6180-4485-83eb-81e8fae3b8fe")
package

# get all resources for this package
resources <- list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

# export raw data
write_csv(raw_data,"inputs/data/raw.csv")



