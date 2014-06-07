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

# Create line plot of Sub Metering Values
png("plot3.png")
with(house.data,{
     plot(DateTime,Sub_metering_1,type="l",col="black",xlab=NA,ylab="Energy Sub Metering")
     lines(DateTime,Sub_metering_2,col="red")
     lines(DateTime,Sub_metering_3,col="blue")
     legend("topright",cex=.5,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))
     })
dev.off()