
## Loading the data

raw_data_directory <- "C:/Users/Kenneth/exdata-data-household_power_consumption/"
raw_data_file_name <- "household_power_consumption.txt"
theFile <- paste(raw_data_directory, raw_data_file_name, sep="")

# load the data and subset the data
the_data <- read.table(theFile, sep=";", na.strings="?" , header=TRUE, colClasses=c(rep("character",2),rep("numeric",7)))
the_data_split <- split(the_data, the_data$Date)
the_data <- rbind(the_data_split$"1/2/2007", the_data_split$"2/2/2007")

# reformat the date and time
the_date_time <- paste(the_data$Date, the_data$Time, sep=' ')
the_date_time <- strptime(the_date_time, "%d/%m/%Y %H:%M:%S")

# replace the original date and time with the 'the_data_time'
the_data <- cbind(date_time=the_date_time, the_data[,3:9])


## Making Plots
# *note:image is saved to the current directory
png(filename="plot2.png")

ylable = "Global Active Power (kilowatts)"
plot(the_data$date_time, the_data$Global_active_power, main='', xlab='', ylab=ylable, type="l")

dev.off()