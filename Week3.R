# Load the managers dataset
managers_data <- read.csv("managers.csv", na = "")
managers_data
str(managers_data)

# Doesnt work with chr
# so needs to be converted to int
managers_data$Age <- as.integer((managers_data$Age))
managers_data$Q4 <- as.integer(managers_data$Q4)
managers_data$Q5 <- as.integer(managers_data$Q5)

# Dealing with missing data

# Listwise delection
new_date <- na.omit(managers_data)
new_date

# Use complete.cases to show where data
# rows are complete
complete_data <- complete.cases(managers_data)
complete_data
sum(complete_data)

# List the rows where date is not missing
complete_data <- managers_data[complete.cases(managers_data),]
complete_data

# list incomplete cases
incomplete_data <- managers_data[!complete.cases(managers_data),]
incomplete_data

# Find the sum of missing values
sum(is.na(managers_data))

mean(is.na(managers_data))

install.packages("mice")
library(mice)

md.pattern(managers_data)

# select NO when install lmtest
install.packages("lmtest")
library(lmtest)

# Use VIM package to show missing values
install.packages("VIM")
library(VIM)

missing_values <- aggr(managers_data, prop = FALSE, numbers = TRUE)

