#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California fips=="06037".
#Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreMotor <- subset(NEI, NEI$fips=="24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)

LosAngelesMotor <- subset(NEI, NEI$fips=="06037" & NEI$type == "ON-ROAD")
LosAngelesMotorAGG <- aggregate(Emissions ~ year, LosAngelesMotor, sum)

png("plot6.png")
ggplot() + 
  geom_line(data = baltimoreMotorAGG, aes(x = year, y = Emissions), color = "blue") +
  geom_line(data = LosAngelesMotorAGG, aes(x = year, y = Emissions), color = "red") +
  ggtitle('Compairson of Balitimore to LA Vehicle PM2.5 Emissions over Years')+
  xlab('Years, Baltimore is Blue and Los Angeles is Red') +
  ylab('Emissions ')
  
dev.off()
 
  

