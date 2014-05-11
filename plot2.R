##read file        
        powerD <- read.table("./data/household_power_consumption.txt", header=T,sep=";",stringsAsFactors=F,na.string="?")

##subset data to required dates        
        subpowerD <- powerD[powerD$Date %in% c("1/2/2007","2/2/2007"),]

##create datetime column
        subpowerD$datetime <- as.POSIXct(paste(subpowerD$Date,subpowerD$Time), format="%d/%m/%Y %H:%M:%S")

##open png device
        png("./plots/plot2.png", w=480, h=480)

##write plot2
        par(mar=c(3,4,1,1))
        plot(subpowerD$datetime, subpowerD$Global_active_power
             , ylab="Global Active Power (kilowatts)"
             , xlab=""
             , type="l"
        )

##close png device
        dev.off()



