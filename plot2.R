#Exploratory Data Analysis Project
#Assignment 2 - Question 2
#Author: Jonathan Boyne  5/1/2018

#Have total emissions from PM2.5 decreased in the Baltimore, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEIBaltimore <- subset(NEI,fips == "24510" )
totalPMBaltimore <- with(NEIBaltimore, tapply(Emissions, year, sum, na.rm =T))


#Set the ouput device as plot2.png
png(filename='plot2.png')

barplot(totalPMBaltimore, main='Total Emission in Baltimore, Maryland', xlab='Year', ylab=expression('PM'[2.5]))

dev.off()
