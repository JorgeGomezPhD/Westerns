# This script takes the unknon absorbances and averages them.
# NOTE: Your sample must have 2 replicates in order for the script to work.

{
  uknown_row_start <- readline("Enter starting row number for unknown sample : ");
  uknown_row_end <- readline("Enter ending row number for unknown sample : ");
  #starting_column <- readline("Enter starting column number for unknown sample : ");
  #ending_column <- readline("Enter ending column number for unknown sample : ");
  starting_column <- 1;
  ending_column <- 2;
}

# converting variables to numeric values
{
  uknown_row_start = as.integer(uknown_row_start);
  uknown_row_end = as.integer(uknown_row_end);
  #starting_column <- as.integer(starting_column);
  #ending_column <- as.integer(ending_column);
}

df3 <- my_data2[uknown_row_start:uknown_row_end,starting_column:ending_column]

# Convert both columns to numeric values
i <- c(1, 2) # Specify columns you want to change

df3[ , i] <- apply(df3[ , i], 2,            # Specify own function within apply
                  function(x) as.numeric(as.character(x)))

df4 <- rowMeans(df3)
