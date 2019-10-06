#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland fips=="24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

baltimore <- subset(NEI, NEI$fips == "24510")
totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)
png("plot2.png")
plot(totalBaltimore$year, totalBaltimore$Emissions, xlab = "Years", ylab = "Emissions", main="Total Baltimore PM2.5 Emissions over Years", type = "l")
dev.off()
