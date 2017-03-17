getwd()
NEI <-readRDS("summarySCC_PM25.rds")
View(NEI)
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
blatimore <- subset(NEI,fips =='24510')
View(blatimore)
png(filename ='plot2.png')
barplot(tapply(X=blatimore$Emissions, INDEX=blatimore$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()