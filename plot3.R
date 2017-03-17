getwd()
library(ggplot2)
NEI <-readRDS("summarySCC_PM25.rds")
View(NEI)
SCC <- readRDS("Source_Classification_Code.rds")
View(SCC)
blatimore <- subset(NEI,fips =='24510')
blatimore$year<-factor(blatimore$year,levels = c('1999', '2002', '2005', '2008'))
png(filename = 'plot3.png')
ggplot(data=blatimore, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') +
  geom_jitter(alpha=0.10)

dev.off()