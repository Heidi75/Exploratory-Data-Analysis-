# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases 
# in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this
# question.
library(ggplot2)
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
str(SCC)
str(NEI)
#type is class of NEI$type
baltimore <- subset(NEI, NEI$fips == "24510")

#png("plot3.png")
qplot(factor(year), Emissions, data = baltimore, facets =.~type, color= type)

#dev.off()


