install.packages("sqldf")
library(sqldf)
getwd()
setwd("C:\\Users\\v-sanjro\\Downloads\\exdata%2Fdata%2Fhousehold_power_consumption")
df <- read.csv.sql("household_power_consumption.txt"
                   ,header = TRUE,sep=";","select * from file where Date = '1/2/2007' or Date = '2/2/2007'" )

summary(df$Time)

df$datetime<-as.POSIXct(strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %H:%M:%S"))
df$day<-weekdays(as.Date(df$datetime))


#plot 1


png(filename = "plot1.png",width = 480,height = 480,units = "px")
with(df,hist(Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab="Frequency",col="red"))
dev.off()
