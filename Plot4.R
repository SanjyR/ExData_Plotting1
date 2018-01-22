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

#plot 4

png(filename = "plot4.png",width = 480,height = 480,units = "px")
par(mfcol=c(2,2))
with(df,plot(datetime,Global_active_power,ylab="Global Active Power",type = "l",xlab = ""))
with(df,plot(datetime,Sub_metering_1,ylab="Energy sub metering",type = "l",xlab = ""))
with(df, lines(datetime,Sub_metering_2,col="red"))
with(df, lines(datetime,Sub_metering_3,col="blue"))
with(df,plot(datetime,Voltage,ylab="Voltage",type = "l"))

with(df,plot(datetime,Global_reactive_power,ylab="Global_reactive_power",type = "l"))
dev.off()
