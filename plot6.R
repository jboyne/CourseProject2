#Exploratory Data Analysis Project
#Assignment 2 - Question 6
#Author: Jonathan Boyne  5/1/2018

#Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

# Load ggplot2 library
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))



# Subset the data for Baltimore City, Maryland
Baltimore.onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
# Subset the data for Los Angeles County, California
LosAngeles.onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Summarize Baltimore Data
Baltimore.DF <- aggregate(Baltimore.onroad[, 'Emissions'], by=list(Baltimore.onroad$year), sum)
colnames(Baltimore.DF) <- c('year', 'Emissions')
Baltimore.DF$City <- paste(rep('Baltimore', 4))

# Summarize LosAngeles Data
LosAngeles.DF <- aggregate(LosAngeles.onroad[, 'Emissions'], by=list(LosAngeles.onroad$year), sum)
colnames(LosAngeles.DF) <- c('year', 'Emissions')
LosAngeles.DF$City <- paste(rep('LosAngeles', 4))

#Merge both sources
MergedData <- as.data.frame(rbind(Baltimore.DF, LosAngeles.DF))

#Set the ouput device as plot6.png
png('plot6.png')

ggplot(data = MergedData, aes(x = year, y = Emissions)) + 
geom_bar(aes(fill = year),stat = "identity") + 
guides(fill = F) + 
ggtitle('Total Emissions of Motor Vehicle Sources\nBaltimore vs. Los Angeles') + 
ylab(expression('PM'[2.5])) + 
xlab('Year') + 
theme(legend.position = 'none') + 
facet_grid(. ~ City) + 
geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))

dev.off()