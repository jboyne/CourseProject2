#Exploratory Data Analysis Project
#Assignment 2 - Question 1
#Author: Jonathan Boyne  5/1/2018

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalPM <- with(NEI, tapply(Emissions, year, sum, na.rm =T))

#Set the ouput device as plot1.png
png(filename='plot1.png')

barplot(round(totalPM/1000,2), main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()

