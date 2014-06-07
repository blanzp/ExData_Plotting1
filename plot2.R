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


# Create line plot of Global Active Power over time
png("plot2.png")
with(house.data,{
  plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
})
dev.off()

