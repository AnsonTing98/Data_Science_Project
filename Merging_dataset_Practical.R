# Load the dataset into data frame 
# called new_managers_data
new_managers_data <- read.csv("MoreData.csv")
new_managers_data
str(new_managers_data)

# Select a subset of the data you need
new_data <- subset(new_managers_data, select = c("Date", 
                                                 "Country", 
                                                 "Gender", 
                                                 "Age", 
                                                 "Q1", 
                                                 "Q2", 
                                                 "Q3", 
                                                 "Q4", 
                                                 "Q5"))
new_data <- new_managers_data[c("Date", 
                                "Country", 
                                "Gender", 
                                "Age", 
                                "Q1", 
                                "Q2", 
                                "Q3", 
                                "Q4", 
                                "Q5")]

new_data$AgeCat[new_data$Age >= 45] <- "Elder"
new_data$AgeCat[new_data$Age >= 26 & new_data$Age <= 44] <- "Middle Aged"
new_data$AgeCat[new_data$Age <= 25] <- "Young"
new_data$AgeCat[is.na(new_data$Age)] <- "Elder"

factor_AgeCat <- factor(new_data$AgeCat, 
                        ordered = TRUE, 
                        levels = c("Young", "Middle Aged", "Elder"))
new_data$AgeCat <- factor_AgeCat

managers_data <- managers_data[-1]

str(managers_data)
merged_manager_data <- rbind(new_data,managers_data)
merged_manager_data

str(merged_manager_data)


