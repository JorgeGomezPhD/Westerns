# import libraries to use
library(tidyverse)
library(readxl)
library(filesstrings)


# What is the file name?
file_name <- paste0(readline("Enter file name : "), ".xlsx") # Get file name from user
file_loc <- paste0('data/', file_name)

# Create new directory to store files in using the original file name from line 8.
rem_ext <- unlist(strsplit(file_name, split='.', fixed=TRUE))[1]
dir_name <- paste0('data/', rem_ext)
dir.create(dir_name)

# Import data
my_data <- read_excel(file_loc, sheet = 3)


# Remove the first 15 rows containing no usable data
my_data2 <- my_data[-c(1: 15), ]

# Add headers
newheaders <- c(" ","A", "B", "C","D", "E", "F", "G", "I")
#newheaders <- c(" ","A", "B", "C","D", "E", "F", "G", "I", "[unknown]")
colnames(my_data2) <- newheaders

# Remove first column
my_data2 <- my_data2[-1]

# Save cleaned up csv file in new directory
write.csv(my_data2, paste0(dir_name, '/', rem_ext, '.csv'))

# Move original file to new directory
file.move(file_loc, dir_name)


