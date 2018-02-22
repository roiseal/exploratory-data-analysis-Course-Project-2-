#-- Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#-- How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#-- Get Baltimore emissions from motor vehicle sources
bmore.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
bmore.emissions.aggr <- aggregate(Emissions ~ year, data=bmore.emissions, FUN=sum)

#-- Display results in a plot
library(ggplot2)
png("plot5.png")
ggplot(bmore.emissions.aggr, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression("Total PM"[2.5]*" Emissions")) +
    ggtitle("Emissions from Motor Vehicle Sources in Baltimore City")
dev.off()
