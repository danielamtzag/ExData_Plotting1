
##Read the data 

table<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
table$Date<-as.Date(table$Date, "%d/%m/%Y" )


##We will only be using data from the dates 2007-02-01 and 2007-02-02. 
table<-table[table$Date=="2007-2-1" |  table$Date=="2007-2-2" ,]


###plot 2
##Install "lubridate" package to use the dates and times
install.packages("lubridate")
library("lubridate")

##In the column Data_Time we have date and time
join<-paste(as.character(table$Date), as.character(table$Time))
table$Date_Time<-ymd_hms(join)

##This is the default
par(mfrow	=	c(1,	1), mar= c( 5.1, 4.1, 4.1, 2.1))

##Create the plot with type="l" lines

with(table, plot( Date_Time , Global_active_power , ylab="Global Active Power (Kilowatts)", xlab="", type="l" ))


##Save the graph
dev.copy(png, "plot2.png",  width=480,  height=480)
dev.off()
