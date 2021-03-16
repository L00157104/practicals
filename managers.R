# Practical -2 - 16.03.2021
# Enter data into vectors before constructing the data frame
# creating vector with c
date_col <- c("10/15/18", "01/11/18", "10/21/18", "10/28/18", "05/01/18")
country_col <- c("US","US","IRL","IRL","IRL")
gender_col <- c("M", "F", "F", "M", "Fage")
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2)  # NA is inserted in place of missing data
q5_col <- c(5, 5, 2, NA, 1)


# construct a data frame from above vectors
managers_data <- data.frame(date_col, 
                            country_col, 
                            gender_col, 
                            age_col, 
                            q1_col, 
                            q2_col, 
                            q3_col, 
                            q4_col, 
                            q5_col
                            )

managers_data

# change column names
column_names <- c("Date",
                  "Country",
                  "Gender",
                  "Age", 
                  "1",
                  "q2",
                  "q3",
                  "q4",
                  "q5")

# add column naes to the data frame
colnames(managers_data) <- column_names

managers_data

# recode the incorrect age to NA
managers_data$Age[managers_data$Age == 99] <- NA

managers_data$q4[managers_data$q4 == " "] <- NA
managers_data$q5[managers_data$q5 == " "] <- NA

# 2 options to create a new variable
# 1. create a new vector and store the logical check in it
# 2. create the new var when doing the logical check

managers_data$age_cat[managers_data$Age <=25] <- "young"
managers_data$age_cat[(managers_data$Age >=26) & (managers_data$Age <=44)] <- "Middle aged"
managers_data$age_cat[managers_data$Age >=45] <- "elder"

managers_data
managers_data$age_cat[is.na(managers_data$Age)] <- "elder" # logical check
managers_data

# recode the age_cat so that it is ordinal and factored
# with the order young, middle aged and elder
agecat <- factor(managers_data$age_cat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))
agecat

managers_data$age_cat <- agecat
managers_data

str(managers_data)

