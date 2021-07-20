# import data 
df <- read.csv(paste0(dir_name, "/", rem_ext, ".csv"), header = TRUE)

# Select only the data for the standards
df2 <- df[0:2, ]

# Take the average of all the standards
A <- mean(df2$A)
B <- mean(df2$B)
C <- mean(df2$C)
D <- mean(df2$D)
E <- mean(df2$E)
F <- mean(df2$F)
G <- mean(df2$G)
I <- mean(df2$I)

# y values to plot
y <- c(A, B, C, D, E, F, G, I)

# x values to plot in ug/ml
x <- c(2000,
    1500,
    1000,
    750,
    500,
    250,
    125,
    0)

# Plot graph
plot(x, y)

# Finding best fit line
best_fit <- lm(formula = y ~ x)

# Adding best fit line to plot
abline(best_fit$coefficients[1], best_fit$coefficients[2])

#extract variables from linear model
Intercept <- best_fit$coefficients[1] # y intercept from linear model
slope <- best_fit$coefficients[2]  # slope from linear model

# takes how many times to run the code
num_traces <- as.integer(
    readline(prompt="Enter number of unknown samples: ")) 

# Find the concentration of the unknown samples
x<- 1
while(x <= num_traces){
    sample_number = as.integer(readline("Enter sample number : "))
    abs_samp <- df4[sample_number]
    unknown_sample <- (abs_samp-Intercept)/slope
    print(paste0("Your unknown concentration is: ",unknown_sample, " ug/ml"))
    x<- x+1
}


