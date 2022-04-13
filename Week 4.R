# Builds the data frame using vectors
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# Store this info in a data frame called drugs
drugs <- data.frame(dose, drugA, drugB)

# colnames(drugs) <- c("Dosage", 
#                    "Response to Drug A", 
#                    "Response to Drug B")

plot(drugs)
attach(drugs)
plot(dose, type = "o", col = "blue")

# option type = "b" means
# we can plot both points and lines
plot(dose, drugA, type = "b")

# store the content of par() to add variable
opar <- par(no.readonly = TRUE)
plot(dose, drugB, type = "b")

# lty = 2 (dashed line)
# pch = 17 (triangle)
par(lty = 2, pch = 17)
plot(dose, drugA, type = "b")
par(opar)

# Specify graphical parameters
plot(dose, drugA, type = "b", lty = 2, pch = 17)

# dotted line 3 times wider than the default
plot(drugA, 
     type = "b", 
     lty = 3, 
     lwd = 3, 
     pch = 15, 
     ylim = c(0, 100))
title(main = "Drug dosage", 
      col.main = "blue", 
      font.main = 4)

# plot drug B with red dashed line and square points
# pch = 22
plot(drugB, 
     type = "b", 
     pch = 22, 
     lty = 2, 
     col = "red", 
     main = "Drug dosage", 
     ylim = c(0,graph_range[2]), 
     labels = FALSE)

# calculate the limitation of range
graph_range <- range(0, drugA, drugB)
graph_range

# lable the axis values
# Make the x-axis have ml labels
axis(1, at = 1:5, lab = c("20 ml", "40 ml", "60 ml", "80 ml", "100ml"))

# y-axis with tick every 5 points
# at = 5 * 0:graph_range
axis(2, at = 5 * 0:graph_range[2])

# Full example of charts
# plot dose with drug A
# with labels
plot(dose, 
     drugA, 
     type = "b", 
     col = "red", 
     lty = 2,
     pch = 2, 
     lwd = 2,
     main = "Clinical trial for Drug A", 
     sub = "This is hypothetical data", 
     xlab = "Dosage", 
     ylab = "Drug response", 
     xlim = c(0, 60), 
     ylim = c(0, 70))


# use mtcars
?mtcars

# Capture the parameters
opar <- par(no.readonly = TRUE)

# include mfrow = c(nrow, ncol)
par(mfrow = c(2, 2))
attach(mtcars)
str(mtcars)

plot(wt, 
     mpg, 
     main = "Scatterplot of weight vs mpg")

plot(wt, disp, main = "Scatterplot of weight vs disp")

par(opar)

# show 3 plots in 3 rows and 1 col
# of wt, mpg and disp
# show x and y labels
# Use graph range with the charts
par(mfrow = c(3, 1))

plot(wt,
     main = "Scatterplot of weight", 
     xlab = "Index",
     ylab = "Weight")

plot(disp, 
     main = "Scatterplot of disp", 
     xlab = "Index",
     ylab = "Disp")

plot(mpg, 
     main = "Scatterplot of mpg", 
     xlab = "Index", 
     ylab = "MPG")

par(opar)

pie(drugs$drugA)
