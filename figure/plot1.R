data <- read.table("~/householdpowerconsumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
dateone <- as.Date('2007-02-01')
datetwo <- as.Date('2007-02-02')
datatwo <- data[data$Date >= dateone & data$Date <= datetwo,]
datatwo[,3:9] <- apply(datatwo[,3:9], 2, as.numeric)
datatwo$datetime <- paste(datatwo$Date, datatwo$Time)
datatwo$datetime <- as.POSIXct(datatwo$datetime)

png(file='C:/Users/Brian/Documents/exploratorydataanalysis/projectonegit/ExData_Plotting1/figure/plot1.png')
with(datatwo, hist(Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red'))
dev.off()