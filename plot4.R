#get data
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_zip = './data.zip'
if(!file.exists(data_file)){download.file(Url, data_file)}
unzip(data_file, exdir = './data')
#read data in 01/02/2007 and 02/02/2007
data_txt = './data/household_power_consumption.txt'
data<-read.csv(data_txt,sep=";")
d1 <- data[grep(as.Date('1/2/2007',"%d/%m/%Y"), as.Date(data$Date,"%d/%m/%Y")),]
d2 <- data[grep(as.Date('2/2/2007',"%d/%m/%Y"), as.Date(data$Date,"%d/%m/%Y")),]
dt <- rbind(d1, d2)
#create the plot
#subplot1
par(mfrow=c(2,2))
act_pow <- dt$Global_active_power
plot(as.numeric(as.character(act_pow)), type = 'l', xlab = '', ylab = 'Global Active Power(kilowatts)',axes=FALSE)
axis(1, at = c(0,1440,2880),labels = c('Thu','Fri','Sat'))
axis(2)
box(lty = 1, col = 'black')
#subplot2
volt <- dt$Voltage
plot(as.numeric(as.character(volt)), type = 'l', xlab = 'datetime', ylab = 'Voltage',axes=FALSE)
axis(1, at = c(0,1440,2880),labels = c('Thu','Fri','Sat'))
axis(2)
box(lty = 1, col = 'black')
#subplot3
eng_sub1 <- dt$Sub_metering_1
eng_sub2 <- dt$Sub_metering_2
eng_sub3 <- dt$Sub_metering_3
plot(as.numeric(as.character(eng_sub1)), type = 'l', xlab = '', ylab = 'Energy sub metring', ylim=c(0,40), axes=FALSE)
par(new= T) 
plot(as.numeric(as.character(eng_sub2)), type = 'l', col = 'red', xlab = '', ylab = '',ylim=c(0,40), axes=FALSE)
par(new= T) 
plot(as.numeric(as.character(eng_sub3)), type = 'l', col = 'blue', xlab = '', ylab = '',ylim=c(0,40), axes=FALSE)
axis(1, at = c(0,1440,2880),labels = c('Thu','Fri','Sat'))
axis(2)
box(lty = 1, col = 'black')
#subplot4
plot(as.numeric(as.character(dt$Global_reactive_power)), type="l", ylab="Global_reactive_power",xlab="datetime",axes=FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2)
box(lty = 1, col = 'black')
#save the pic
dev.copy(png,"plot4.png")
dev.off()




