# This script builds the managers dataset
# and populates it with data

# Load data from previous session
column_names <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

# Enter data into vectors before constructing the data frame
date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

# Construct a data frame using the data from all vectors above
managers <- data.frame(date_col, country_col, gender_col, age_col, q1_col, q2_col, q3_col, q4_col, q5_col)

# Add column names to data frame using column_names vector
colnames(managers) <- column_names

# Recode the incorrect 'age' data to NA
managers$Age[managers$Age == 99] <- NA

# Create a new attribute called AgeCat and set valuess
# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly
# We will also recode age 'NA' to Elder

managers$AgeCat[managers$Age >= 45] <- "Elder"
managers$AgeCat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Aged"
managers$AgeCat[managers$Age <= 25] <- "Young"
managers$AgeCat[is.na(managers$Age)] <- "Elder"

str(managers)
managers
summary(managers)

# Recode age_cat variable to make it
# ordinal and factored
factor_AgeCat <- factor(managers$AgeCat, 
                 ordered = TRUE, 
                 levels = c("Young", "Middle Aged", "Elder"))

# Replace managers age_cat 
# with newly factored variable
managers$AgeCat <- factor_AgeCat
str(managers)

# Create new col called row_summary
# that contains a summary of each row
# and then create a new col called
# mean_value to contain means of the answers

attach(managers)
managers$summary_col <- Q1 + Q2 + Q3 + Q4 + Q5
detach(managers)

managers_Q <- cbind(managers$Q1, managers$Q2, managers$Q3, managers$Q4, managers$Q5)

managers$row_summary <- rowSums(managers_Q, na.rm = FALSE)
str(managers)
managers

managers$mean_value <- rowMeans(managers_Q, na.rm = TRUE)
summary(managers)
managers


# rename summary_col and mean_col
# Summary and Mean

colnames(managers)[colnames(managers) == "mean_value"] <- "Mean"

names(managers)[names(managers) == "row_summary"] <- "Summary"

colnames(managers)

managers

# We cant convert vector to date
# so it needs to be converted to chr first
managers$Date

managers$Date <- as.Date(managers$Date, "%Y-%d-%m")
str(managers)
