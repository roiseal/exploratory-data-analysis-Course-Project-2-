#-- Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#-- Across the United States, how have emissions from coal combustion-related
#-- sources changed from 1999 to 2008?

#-- Find coal combustion-related sources
is.combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[is.combustion.coal,]

#-- Find emissions from coal combustion-related sources
emissions <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]

#-- group emissions by year
emissions.by.year <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

#-- Display results in a plot
library(ggplot2)
png("plot4.png")
ggplot(emissions.by.year, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression("Total PM"[2.5]*" Emissions")) +
    ggtitle("Emissions from Coal Combustion-Related Sources")
dev.off()
