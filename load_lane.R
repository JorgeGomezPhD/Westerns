# How to determine how much volume to load per gel

x <- 1
con_samp <- as.integer(readline(prompt = "Enter number of concentrations being run: "))
test_li <- c( ) # empty list to store data in

while(x <= con_samp){
  total_volume_lane <- 25 # what is the total volume per lane
  num_lanes <- as.integer(readline("Enter sample number : "))
    vol_master <- (total_volume_lane*num_lanes)*1.1 # volume of master sample 
    prot_lane <- as.integer(readline("Amount of protein to be loaded per lane (ug) : ")) 
    stock_conc <- as.integer(readline("stock concentration from bradford in (ug/ul): "))
    stock_vol <- round((prot_lane/stock_conc) * (num_lanes*1.1), digits = 3) # stoc volume needed
    load_buffer <- round((vol_master/4), digits = 2) # Volume of loading buffer mix needed
    dil_vol <- round((vol_master-(stock_vol+load_buffer)), digits = 2)   # amount of RIPA or water needed
    tot_volume <- round((stock_vol + load_buffer + dil_vol), digits = 2) 
    test_li<-c(test_li,stock_vol, load_buffer, dil_vol, tot_volume)
  x<- x+1
}

y <- round(test_li, 2)
y1 <- c("Sample volume need (ul): ", "Volume of Loadding buffer(ul): ", "Volume of Dilutent (RIPA or water): ", "Total volume: ")
y2 <- cbind(y1, y)

print(y2)
df5 <- read.csv(paste0(dir_name, "/", rem_ext, ".csv"))
write_csv(y2, "test.csv")
write.csv(df5, "concentration.csv")


