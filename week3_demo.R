# File download from BB and inserted into data frame
# Missing content replaced with NA

managers_data <- read.csv("managers.csv", na="")

# view structure of the data frame
str(managers_data)

# view data of data frame
View(managers_data)

# Convert date to a date variable 
# it is currently in dd/mm/yy format 

converted_date <- as.Date(managers_data$Date, "%m/%d/%y")
converted_date
str(converted_date)  

managers_data$Date <- converted_date
str(managers_data)

# Convert age variable to int

converted_age <- as.integer(managers_data$Age)
managers_data$Age <- converted_age
str(managers_data)

# select records within 15-10-18 and 01-11-18

start_date <- as.Date("2018-10-18")
end_date <- as.Date("2018-11-01")
new_date <- managers_data[
  managers_data$Date >= start_date & 
    managers_data$Date <= end_date,]  # put a coma , so that it search, mandatory condition

new_date

# drop atributes (Var) from data 
# shows where specific var names are
include_list <- names(managers_data) %in% c("Q3", "Q4") 
# will search header and find if Q3, Q4 exists and TRUE means columns exists
include_list

include_list <- names(managers_data) %in% c("Car", "Green") 
# will search header and find if Q3, Q4 exists and gives al FALSE means columns does not exists
include_list


# this data frame only contains Q3 and Q4
new_managers <- managers_data[(include_list)]
new_managers
str(new_managers)

# this data frame only except Q3 and Q4 using !
new_managers <- managers_data[!(include_list)]
new_managers
str(new_managers)

# using the subset function
# to extract all records where age > 35 or age < 24
# only select Q1 to Q4

# Attach function helps not to use again and again datafareme$column name instead we can use 
# simply column name like below but once attach we must use detach function call as well.

attach(managers_data)
new_data <- subset(managers_data, Age > 35 | Age < 24, 
  c(Q1, Q2, Q3, Q4))
new_data

# select a subset of managers_data
# where gender = M or age> 25, only show records
# only select gender to Q4

new_data <- subset(managers_data, Age > 25 | Gender == "M", 
                   c(Gender, Age, Q1, Q2, Q3, Q4))
new_data 

# another way to do it
new_data <- subset(
  managers_data, Age > 25 | Gender == "M", 
                   select = Gender:Q4)
new_data

# Random Sampling 
# sample 3 records from managers data frame
# x = 
new_sample <- managers_data[sample(1:nrow(managers_data), 3, replace = FALSE),]
new_sample

# Can we sample 10 records from data frame?
# with condition TRUE we can sample same data multiple times 
# but FALSE can allow 1 time to sample same data
managers_data
new_sample <- managers_data[sample(1:nrow(managers_data), 10, replace = TRUE),]
new_sample

# detach
detach(managers_data)

# sorting data by age
attach(managers_data)
my_data <- managers_data[order(Age), ]
my_data


# sort by genger and then age within each gender 
# and sort in data frame called sorted data

sorted_data <- managers_data[order(Gender, Age), ]
sorted_data


# save the random sample file to a .csv file
write.csv(new_sample, file = "Random_Sample.csv")

