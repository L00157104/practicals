# Enter data into vectors before constructing the data frame
date_col <- c("10/15/18", "01/11/18", "10/21/18", "10/28/18", "05/01/18")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

# Construct a data frame using the data from all the vectors
managers_data <- data.frame(date_col, 
                            country_col, 
                            gender_col, 
                            age_col, 
                            q1_col, 
                            q2_col, 
                            q3_col, 
                            q4_col, 
                            q5_col)

managers_data

column_names <- c("Date", 
                  "Country", 
                  "Gender", 
                  "Age", 
                  "Q1", 
                  "Q2", 
                  "Q3", 
                  "Q4", 
                  "Q5")

# Add column names to the managers_data dataframe
colnames(managers_data) <- column_names

managers_data

# Recode the incorrect 'age' to NA
managers_data$Age[managers_data$Age == 99] <- NA
managers_data

# 2 options to create a new variable
# 1 - create a new vector and store the logical check in it
# 2 - create the new var when doing the logical check

managers_data$AgeCat[managers_data$Age >= 45] <- "Elder"
managers_data$AgeCat[managers_data$Age >= 26 & managers_data$Age <= 44] <- "Middle Aged"
managers_data$AgeCat[managers_data$Age <= 25] <- "Young"
managers_data$AgeCat[is.na(managers_data$Age)] <- "Elder"
managers_data

# recode age_cat so that it is ordinal and factored
# with the order young, middle aged, elder
age_cat <- factor(managers_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))
age_cat

# replace mnager_data age_cat variable with
# the factored variable

managers_data$AgeCat <-age_cat
managers_data

# Look at the structure of the data frame
str(managers_data)

# create a new column called Summary_Col to contain sum of each row

Summary_Col <- managers_data$Q1 + 
  managers_data$Q2 + 
  managers_data$Q3 + 
  managers_data$Q4 + 
  managers_data$Q5

Summary_Col

# add summary col to end of the data frame
# take content of data frame and create a new data frame
# and add summary col vector to the data frame

managers_data <- data.frame(managers_data, Summary_Col)
managers_data

# calculate mean value for each row
# I used row means from column number 5 till 9 
mean_value <- rowMeans(managers_data[5:9])
mean_value

# add the mean value vector to the data frame as a new variable 
managers_data <- data.frame(managers_data, mean_value)
managers_data

# change variable titles for better readability
names(managers_data)[11] <- "Summary"
names(managers_data)[12] <- "Mean Value" 

managers_data
# show structure of managers data
str(managers_data)
# view data of data frame as an excel format
View(managers_data)


# convert date variable from Chr to date type
# using dd/mm/yy format

managers_data$Date
converted_date <- as.Date(managers_data$Date, "%m/%d/%y")
converted_date

# structure of a field
str(converted_date)

# overwrite the current date var with new date var
managers_data$Date <- converted_date
str(managers_data$Date)
str(managers_data)


# dealing with missing data

# listwise deletion = remove any rows that contains NA
# Listwise(managers_data, Summary = "NA")

managers_data
new_managers_data <- na.omit(managers_data)
new_managers_data

# use complete cases
# it is TRUE for each row which is complete and if we have missing values it will show FALSE

complete_managers_data <- complete.cases(managers_data)
complete_managers_data

# it will give sum of TRUE always
sum(complete_managers_data)

# list rows that do not have missing vals
complete_managers_data <- managers_data[complete.cases(managers_data),]
complete_managers_data

# list rows with missing values
managers_data[!complete.cases(managers_data),]

# show summary of all missing vals in a variable
sum(is.na(managers_data$Age))
sum(is.na(managers_data$`Mean Value`))

# install and use Mice package to show
# missing vars in the managers data frame

install.packages("mice")
library(mice)
md.pattern(managers_data)

# the VIM package also show missing values
install.packages("VIM")
library(VIM)
missing_values <- aggr(managers_data, prop = FALSE, numbers = TRUE)

# show summary of the content of missing_values
summary(missing_values)
