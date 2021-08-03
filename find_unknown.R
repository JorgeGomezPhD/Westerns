# This script will determine the unknown concentration by plotting a best fit line.
# It will also add a CSV file with the unknown concentrations and save a PDF containing the 
# data and best fit line plotted on a graph.

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
plot(x, y, xlab="Concentration", ylab="Absorbance")

# Finding best fit line
best_fit <- lm(formula = y ~ x)

# Adding a red best fit line to plot
abline(best_fit$coefficients[1], best_fit$coefficients[2], pch=20, col="red")

# Save a PDF file of the graph with a best fit line
dev.copy(pdf, paste0(dir_name, "/", rem_ext, ".pdf"))
#dev.copy(pdf,'myplot.pdf')
dev.off()

#extract variables from linear model
Intercept <- best_fit$coefficients[1] # y intercept from linear model
slope <- best_fit$coefficients[2]  # slope from linear model

# takes how many times to run the code
num_replicates <- as.integer(
    readline(prompt="Enter number of unknown samples: ")) 

# Find the concentration of the unknown samples
x <- 1
li <- c( ) # makes an empty list to store unknown concentrations
while(x <= num_replicates){
    sample_number <- as.integer(readline("Enter sample number : "))
    abs_samp <- df4[sample_number]
    unknown_sample <- (abs_samp-Intercept)/slope
    print(paste0("Your unknown concentration is: ",unknown_sample, " ug/ml"))
    li<-c(li,unknown_sample)
    x<- x+1
}

df5 <- read.csv(paste0(dir_name, "/", rem_ext, ".csv"))
# remove all the rows and columns that are not being used
df5 <- df5[-c((uknown_row_end+1):8),-c(10:42 ) ]
# divide the unknown concentration by 1000 to convert to ug/ml
li1000 <- (li/1000)
# add new column to store the data
unknown_concentration <- c(" ", " ", li1000) 
df5 <- cbind(df5, unknown_concentration)
write.csv(df5, paste0(dir_name, "/", rem_ext, ".csv"))
