#Exploratory Data Analysis Project
#Assignment 2 - Question 5
#Author: Jonathan Boyne  5/1/2018

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Load ggplot2 library
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

#Set the ouput device as plot5.png
png('plot5.png')

ggplot(data=MD.df, aes(x=year, y=Emissions)) 	+ 
  geom_line(aes(group=1, col=Emissions)) 	+ 
  ggtitle(expression('Total Coal Combustion Emissions of PM'[2.5])) 	+ 
  ylab(expression(paste('Coal combustion PM', ''[2.5], ' in kilotons'))) 	+ 
  theme(legend.position='none') 	

dev.off()