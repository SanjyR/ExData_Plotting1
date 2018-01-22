rm(list = ls())

install.packages("sqldf")
library(sqldf)
getwd()
setwd("C:\\Users\\v-sanjro\\Downloads\\exdata%2Fdata%2Fhousehold_power_consumption")
df <- read.csv.sql("household_power_consumption.txt"
                   ,header = TRUE,sep=";","select * from file where Date = '1/2/2007' or Date = '2/2/2007'" )

summary(df$Time)

df$datetime<-as.POSIXct(strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %H:%M:%S"))
df$day<-weekdays(as.Date(df$datetime))

#plot 3

png(filename = "plot3.png",width = 480,height = 480,units = "px")
with(df,plot(datetime,Sub_metering_1,ylab="Energy sub metering",type = "l",xlab = ""))
with(df, lines(datetime,Sub_metering_2,col="red"))
with(df, lines(datetime,Sub_metering_3,col="blue"))
legend("topright", lty = 1,col = c("black","red","blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
