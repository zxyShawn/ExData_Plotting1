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
act_pow <- dt$Global_active_power
hist(as.numeric(as.character(act_pow)), col = 'red', main = 'Global Active Power', xlab = 'Global Active Power(kilowatts)')
#save the pic
dev.copy(png,"plot1.png")
dev.off()

