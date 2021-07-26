# This script will calcululate concentration for an unknown samples from bradford data collected
# on Varioskan.
# The packages required to run this are: tidyverse, readxl, filesstrings

# Import file to clean up data
source("clean_data.R")

# Import file to determine your unknown absorbace number
# NOTE: your unknown sample must have 2 replicates for this to
# You can get this data from the "my_data2" data frame from the global enrioment tab.
source("absorbance_unknown.R")

# Import file to determine unknown concentration
source("find_unknown.R")
