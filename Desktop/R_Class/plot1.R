## Read the data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Subset the dates that we need
data <- data[66637:69516, ]

## Create a numeric vector for Global Active Power
GAP <- data$Global_active_power
GAP <- as.vector(GAP)
GAP <- as.numeric(GAP)

## Create the histogram with specifications
hist(GAP, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Copy the histogram to a png file
dev.copy(png, file = "plot1.png")
dev.off()