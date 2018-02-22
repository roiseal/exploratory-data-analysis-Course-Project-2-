#-- Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#-- Have total emissions from PM2.5 decreased in the United States from 1999 to # 2008?
total.emissions <- aggregate(Emissions ~ year, NEI, sum)

#-- Display results in a plot
png('plot1.png')
barplot(height=total.emissions$Emissions, names.arg=total.emissions$year,
        xlab="Years", ylab=expression('Total PM'[2]*' Emission'),
        main=expression('Total PM'[2]*' Emissions at various years'))
dev.off()