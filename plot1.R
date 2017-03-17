getwd()
NEI <-readRDS("summarySCC_PM25.rds")
View(NEI)
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
View(Emissions)
Emissions$PM <- round(Emissions[,2]/1000,2)
png(filename='plot1.png')
barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()