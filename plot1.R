
# Read household power consumption data
household_power_consumption <- 
  read.table("household_power_consumption.txt", 
                                          sep=";", 
                                          quote="\"",
                                          header=TRUE, 
                                          colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                                          na.strings="?")
# Convert date to date type
household_power_consumption$Date<-as.Date(strptime(household_power_consumption$Date,format="%d/%m/%Y"))

# Subset data
house.data<-household_power_consumption[household_power_consumption$Date==as.Date("2007-02-01")|household_power_consumption$Date==as.Date("2007-02-02"),]
# Create datetime field for plots
house.data$DateTime<-as.POSIXct(strptime(paste(as.character(house.data$Date),house.data$Time),format="%Y-%m-%d %H:%M:%S"))

# Create histogram of Global Active Power
h<-hist(house.data$Global_active_power,breaks=16)
png("plot1.png")
plot(h,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()