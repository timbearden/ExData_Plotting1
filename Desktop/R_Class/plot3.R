## Read the data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Subset the dates that we need
data <- data[66637:69516, ]

## Create numeric vectors for 3 desired variables
Sub1 <- data$Sub_metering_1
Sub1 <- as.vector(Sub1)
Sub1 <- as.numeric(Sub1)

Sub2 <- data$Sub_metering_2
Sub2 <- as.vector(Sub2)
Sub2 <- as.numeric(Sub2)

Sub3 <- data$Sub_metering_3
Sub3 <- as.vector(Sub3)
Sub3 <- as.numeric(Sub3)

## Create a vector of times
times <- seq(as.POSIXct("2007-02-01 00:00:00"), by = "min", length.out = 24*60*2)

## Create a blank plot
plot(times, Sub1, type = "n", xlab = "", ylab = "Energy sub metering")

## Add lines to the plot
lines(times, Sub1)
lines(times, Sub2, col = "red")
lines(times, Sub3, col = "blue")

## Add a legend to the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = 0.55)

## Copy the plot to a png file
dev.copy(png, file = "plot3.png")
dev.off()