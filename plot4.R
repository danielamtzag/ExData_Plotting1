##Read the data 


table<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
table$Date<-as.Date(table$Date, "%d/%m/%Y" )


##We will only be using data from the dates 2007-02-01 and 2007-02-02. 
table<-table[table$Date=="2007-2-1" |  table$Date=="2007-2-2" ,]


###plot 4
##Install "lubridate" package to use the dates and times
install.packages("lubridate")
library("lubridate")

##In the column Data_Time we have date and time
join<-paste(as.character(table$Date), as.character(table$Time))
table$Date_Time<-ymd_hms(join)

##We have to do 4 graphs
par(mfrow=c(2,2), mar= c( 4, 4, 2, 4))
##Create the plot 1
with(table, plot( Date_Time , Global_active_power , ylab="Global Active Power (Kilowatts)", xlab="", type="l" ))
##Create the plot 2
with(table, plot( Date_Time , Voltage , ylab="Voltage", xlab="datetime", type="l" ))
##Create the plot 3
with(table,
     {plot(Date_Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
       lines(Date_Time, Sub_metering_2, type="l", col="red")
       lines(Date_Time, Sub_metering_3, type="l", col="blue")
     })
legend("topright", lwd=1, bty="n", cex=.8 , col=c("black", "red", "blue"), legend = c(" Sub_metering_1", " Sub_metering_2",  "Sub_metering_3"))
##Create the plot 4
with(table, plot( Date_Time , Global_reactive_power ,  xlab="datetime", type="l" ))


dev.copy(png, "plot4.png",  width=480,  height=480)
dev.off()   



