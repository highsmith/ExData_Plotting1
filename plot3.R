##read file        
        powerD <- read.table("./data/household_power_consumption.txt", header=T,sep=";",stringsAsFactors=F,na.string="?")

##subset data to required dates        
        subpowerD <- powerD[powerD$Date %in% c("1/2/2007","2/2/2007"),]

##create date time column
        subpowerD$datetime <- as.POSIXct(paste(subpowerD$Date,subpowerD$Time), format="%d/%m/%Y %H:%M:%S")

##open png device
        png("./plots/plot3.png", w=480, h=480)

##write  plot3
        par(mar=c(3,4,1,1))
        plot(subpowerD$datetime, subpowerD$Sub_metering_1
             , ylab="Energy sub metering"
             , xlab=""
             , main=""
             , type="l")
        lines(subpowerD$datetime,subpowerD$Sub_metering_2, col="red")
        lines(subpowerD$datetime,subpowerD$Sub_metering_3, col="blue")
        legend("topright"
               , lty=c(1,1,1)
               , col=c("black", "red", "blue")
               , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        )


##close png device
        dev.off()



