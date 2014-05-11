##read file        
        powerD <- read.table("./data/household_power_consumption.txt", header=T,sep=";",stringsAsFactors=F,na.string="?")

##subset data to required dates        
        subpowerD <- powerD[powerD$Date %in% c("1/2/2007","2/2/2007"),]

##open png device
        png("./plots/plot1.png", w=480, h=480)

##write plot
        hist(subpowerD$Global_active_power
             , xlab="Global Active Power (kilowatts)"
             , main="Global Active Power"
             , col="red")

##close png device
        dev.off()



