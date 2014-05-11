##read file        
        powerD <- read.table("./data/household_power_consumption.txt", header=T,sep=";",stringsAsFactors=F,na.string="?")

##subset data to required dates        
        subpowerD <- powerD[powerD$Date %in% c("1/2/2007","2/2/2007"),]

##create date time column
        subpowerD$datetime <- as.POSIXct(paste(subpowerD$Date,subpowerD$Time), format="%d/%m/%Y %H:%M:%S")


##open png device
        png("./plots/plot4.png", w=480, h=480)

##plot 4 set par for 4 plots in 1     
        par(mfrow=c(2,2), mar=c(4,4,2,1)) ##set to 2 x 2 grid
        
        ##plot1
        plot(subpowerD$datetime, subpowerD$Global_active_power
             , ylab="Global Active Power"
             , xlab=""
             , type="l")
        
        ##plot2
        plot(subpowerD$datetime, subpowerD$Voltage
             , ylab="Voltage"
             , xlab="datetime"
             , type="l")
        
        ##plot3
        plot(subpowerD$datetime, subpowerD$Sub_metering_1
             , ylab="Energy sub metering"
             , xlab=""
             , main=""
             , type="l"
        )
        lines(subpowerD$datetime,subpowerD$Sub_metering_2, col="red")
        lines(subpowerD$datetime,subpowerD$Sub_metering_3, col="blue")
        legend("topright"
               , lty=c(1,1,1)
               , col=c("black", "red", "blue")
               , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
               , bty="n"
        )
        
        ##plot4
        plot(subpowerD$datetime, subpowerD$Global_reactive_power
             , ylab="Global_active_power"
             , xlab="datetime"
             , type="l")

##close png device
        dev.off()



