######################### DELIVERABLE 1 #########################


# Use the library() function to load the dplyr package.
library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe.
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform linear regression using the lm() function. 
# In the lm() function, pass in all six variables (i.e., columns), 
# and add the dataframe you created (MechaCar_mpg.csv) as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=MechaCar_mpg)

# Using the summary() function, determine the p-value 
# and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=MechaCar_mpg))


######################### DELIVERABLE 2 #########################


# import and read in the Suspension_Coil.csv file as a table.
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# create a total_summary dataframe using the summarize() function 
# to get the mean, median, variance, and standard deviation 
# of the suspension coil’s PSI column.
total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

# create a lot_summary dataframe using the group_by() 
# and the summarize() functions to group each manufacturing lot 
# by the mean, median, variance, and standard deviation 
# of the suspension coil’s PSI column.
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI) , .groups = 'keep') 


######################### DELIVERABLE 3 #########################


# use the t.test() function to determine if the PSI across all manufacturing lots 
# is statistically different from the population mean of 1,500 pounds per square inch.
t.test(Suspension_Coil$PSI, mu=1500)


# use the t.test() function and its subset() argument 
# to determine if the PSI for each manufacturing lot 
# is statistically different from the population mean of 
# 1,500 pounds per square inch.

#Subset summary tables for each manufacturing lot
lot1 <- Suspension_Coil %>% filter(Manufacturing_Lot=='Lot1')
lot2 <- Suspension_Coil %>% filter(Manufacturing_Lot=='Lot2')
lot3 <- Suspension_Coil %>% filter(Manufacturing_Lot=='Lot3')

# t-test for lot 1
t.test(lot1$PSI, mu=1500)

# t-test for lot 2
t.test(lot2$PSI, mu=1500)

# t-test for lot 3
t.test(lot3$PSI, mu=1500)

