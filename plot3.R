#Exploratory Data Analysis Project
#Assignment 2 - Question 3
#Author: Jonathan Boyne  5/1/2018

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

# Load ggplot2 library
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset for Baltimore data
BaltimoreData <- subset(NEI, fips == 24510)

#Set the ouput device as plot3.png
png(filename='plot3.png', width=800, height=500, units='px')

g <- ggplot(BaltimoreData, aes(year, Emissions, color = type, group = type))
g + geom_line(stat = "summary", fun.y = "sum") + 
ylab(expression('Total PM'[2.5]*" Emissions")) + 
ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

dev.off()