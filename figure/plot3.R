#Read the data with read.table. With stringsAsFactors equal to False, then all 
#columns will be character columns.
data <- read.table("~/householdpowerconsumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)

#Format the dates inorder to subset by the date period.
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
dateone <- as.Date('2007-02-01')
datetwo <- as.Date('2007-02-02')
datatwo <- data[data$Date >= dateone & data$Date <= datetwo,]

#With the new subset format  all the non date and time columns to numeric.
datatwo[,3:9] <- apply(datatwo[,3:9], 2, as.numeric)

#Create and format an addional date and time column
datatwo$datetime <- paste(datatwo$Date, datatwo$Time)
datatwo$datetime <- as.POSIXct(datatwo$datetime)

#Open a png device
png(file='C:/Users/Brian/Documents/exploratorydataanalysis/projectonegit/ExData_Plotting1/figure/plot3.png')

#Plot the information
with(datatwo, plot(datetime, Sub_metering_1, ylab='Energy sub metering', xlab='', type='l'))
with(datatwo, lines(datetime, Sub_metering_2, type='l', col='red'))
with(datatwo, lines(datetime, Sub_metering_3, type='l', col='blue'))
legend('topright', lty = 1, col=c('black','red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#Turn off the device
dev.off()