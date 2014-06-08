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

## Plot the graph
plot(times, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Copy the graph to a png file
dev.copy(png, file = "plot2.png")
dev.off()
