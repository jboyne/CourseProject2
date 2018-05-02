#Exploratory Data Analysis Project
#Assignment 2 - Question 4
#Author: Jonathan Boyne  5/1/2018

#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Load ggplot2 library
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal combustion data
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge NEI and SCC
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

#Set the ouput device as plot4.png
png(filename='plot4.png')

ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) 	+ 
geom_line(aes(group=1, col=Emissions)) 	+ 
ggtitle(expression('Total Coal Combustion Emissions of PM'[2.5])) 	+ 
ylab(expression(paste('Coal Combustion PM', ''[2.5], ' in kilotons'))) 	+ 
theme(legend.position='none') 	

dev.off()