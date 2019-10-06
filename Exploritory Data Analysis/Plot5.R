#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset of the NEI data which corresponds to vehicles
vehicle <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case=TRUE)
vehiclesSCC <- SCC[vehicle, SCC]
vehiclesNEI <- NEI[NEI[, SCC] %in% vehiclesSCC,]

#subset balitimore
baltimore <-subset( vehiclesNEI, vehiclesNEI$fips == "24510")

png("plot5a.png")

ggplot(baltimore,aes(factor(year),Emissions, fill=year))+
  geom_bar(stat = "identity")+ 
  labs(y="Emissions from Baltimore motor vehicles",x="Year (1999 - 2008)")
dev.off()

#This one is assuming the type on road is the vehicles

baltimoreMotor <- subset(NEI, NEI$fips="24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)

# plot motor vehicle emissions in balitmore by year
png("plot5b.png")

ggplot(baltimoreMotorAGG,aes(factor(year),Emissions, fill=year))+
  geom_bar(stat = "identity")+ 
  labs(y="Emissions from Baltimore motor vehicles, where as vehicles = type on-Road",x="Year (1999 - 2008)")

dev.off()

getwd()

