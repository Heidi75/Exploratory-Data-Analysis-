#Across the United States, how have emissions from
#coal combustion-related sources changed from 1999–2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#how we calculated agregate emmisions
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

head(SCC, 3)
head(SCC)
## Find all the coal combustion related sources from 'SCC'
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]

## Subset emissions due to coal combustion sources from 'NEI'
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]

## Calculate the aggregate emmissions by year as type coal
aggCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

## Create the plot 
png("plot4.png")
ggplot(aggCoal,aes(factor(year),Emissions, fill=year))+
  geom_bar(stat = "summary",fun.y="sum")+ labs(y="Emissions from coal combustion-related sources",x="Year (1999 - 2008)", color="dev")

dev.off()
