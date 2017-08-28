##Read the data 


table<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
table$Date<-as.Date(table$Date, "%d/%m/%Y" )


##We will only be using data from the dates 2007-02-01 and 2007-02-02. 
table<-table[table$Date=="2007-2-1" |  table$Date=="2007-2-2" ,]

###plot 1

##This is the default
par(mfrow	=	c(1,	1), mar= c( 5.1, 4.1, 4.1, 2.1))


## Create the histogram
hist(table$Global_active_power, col="red", xlab="Global Active Power (Kilowatts)", main="Global Active Power")


##Save the graph
dev.copy(png, "plot1.png",  width=480,  height=480)
dev.off()



