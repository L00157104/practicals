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
