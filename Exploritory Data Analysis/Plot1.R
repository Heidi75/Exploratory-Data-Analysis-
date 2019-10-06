library("data.table")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

str(SCC)
str(NEI)
#showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
aggTotals <- aggregate(Emissions ~ year,NEI, sum)
dim(aggTotals)
aggTotals
plot(aggTotals$year, aggTotals$Emissions, xlab = "Years", ylab = "Emissions", main="Total PM2.5 Emissions over Years", type = "l")

