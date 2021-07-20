{
  uknown_row_start = readline("Enter starting row number for unknown sample : ");
  uknown_row_end <- readline("Enter ending row number for unknown sample : ");
  starting = readline("Enter starting column number for unknown sample : ");
  ending = readline("Enter ending column number for unknown sample : ");
}

# converting variables to numeric values
{
  uknown_row_start = as.integer(uknown_row_start);
  uknown_row_end = as.integer(uknown_row_end);
  starting = as.integer(starting);
  ending = as.integer(ending);
}

df3 <- my_data2[uknown_row_start:uknown_row_end,starting:ending]

# Convert both columns to numeric values
i <- c(1, 2) # Specify columns you want to change

df3[ , i] <- apply(df3[ , i], 2,            # Specify own function within apply
                  function(x) as.numeric(as.character(x)))

df4 <- rowMeans(df3)

#sample_number = readline("Enter sample number : ")
#abs_samp <- df4[sample_number]
