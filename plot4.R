## Read the data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Subset the dates that we need
data <- data[66637:69516, ]

## Create a numeric vector for Global Active Power
GAP <- data$Global_active_power
GAP <- as.vector(GAP)
GAP <- as.numeric(GAP)

## Create a vector of times
times <- seq(as.POSIXct("2007-02-01 00:00:00"), by = "min", length.out = 24*60*2)

## Create numeric vectors for Engergy sub metering
Sub1 <- data$Sub_metering_1
Sub1 <- as.vector(Sub1)
Sub1 <- as.numeric(Sub1)

Sub2 <- data$Sub_metering_2
Sub2 <- as.vector(Sub2)
Sub2 <- as.numeric(Sub2)

Sub3 <- data$Sub_metering_3
Sub3 <- as.vector(Sub3)
Sub3 <- as.numeric(Sub3)

## Create numeric vectors for Global Reactive Power and Voltage
GRP <- data$Global_reactive_power
GRP <- as.vector(GRP)
GRP <- as.numeric(GRP)

Volt <- data$Voltage
Volt <- as.vector(Volt)
Volt <- as.numeric(Volt)

## Specify the number of plots to graph
par(mfcol = c(2, 2))

## Plot the first graph
plot(times, GAP, type = "l", ylab = "Global Active Power")

## Plot the second graph
plot(times, Sub1, type = "n", xlab = "", ylab = "Energy sub metering")

## Add lines to the second plot
lines(times, Sub1)
lines(times, Sub2, col = "red")
lines(times, Sub3, col = "blue")

## Add a legend to the second plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = 0.4, xjust = 1, bty = "n")

## Plot the third graph
plot(times, Volt, type = "l", ylab = "Voltage", xlab = "datetime")

## Plot the final graph
plot(times, GRP, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

## Copy the plots to a png file
dev.copy(png, file = "plot4.png")
dev.off()