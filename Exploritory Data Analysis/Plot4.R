#Across the United States, how have emissions from
#coal combustion-related sources changed from 1999–2008?

SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
str(SCC)
str(NEI)