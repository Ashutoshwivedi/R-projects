# Uber data Analysis through visualization in R

getwd()

#Importing Dataset

April<-read.csv("D:/Data Science Course/TOP Mentors/R_files/Uber_dataset Using R/uber-raw-data-apr14.csv")
May<-read.csv("D:/Data Science Course/TOP Mentors/R_files/Uber_dataset Using R/uber-raw-data-may14.csv")
June<-read.csv("D:/Data Science Course/TOP Mentors/R_files/Uber_dataset Using R/uber-raw-data-jun14.csv")
July<-read.csv("D:/Data Science Course/TOP Mentors/R_files/Uber_dataset Using R/uber-raw-data-jul14.csv")
august<-read.csv("D:/Data Science Course/TOP Mentors/R_files/Uber_dataset Using R/uber-raw-data-aug14.csv")
September<-read.csv("D:/Data Science Course/TOP Mentors/R_files/Uber_dataset Using R/uber-raw-data-sep14.csv")

Combined_data<-rbind(April,May,June,July,august,September)

View(Combined_data)

str(Combined_data)

#Importing necessary libraries
#ggplot2:used for data visualization
#lubridate:Use time-frames in the dataset
#dplyr:Tidy the data
#DT: datatables in JS
#scales:Used to map the data at the correct scales with well placed axis automatically

#install.packages("ggplot2")
#install.packages("ggthemes")
#install.packages("lubridate")
#install.packages("dplyr")
#install.packages("tidyr")
#install.packages("tidyverse")#metapackages of all tidyverse packages
#install.packages("DT")
#install.packages("scales")

#Loading Packages

library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(tidyverse)
library(DT)
library(scales)

#Creating vector of colors for the plots

colors<-c("#cc1011","#665555","#05a399","#cfcaca", "#f5e840", "#0683c9", "#e075b0")
colors

head(Combined_data)

#Format Date.Time variable into a readable format using functions in lubridate

Combined_data$Date.Time <- as.POSIXct(Combined_data$Date.Time, format="%m/%d/%Y %H:%M:%S")
Combined_data$Time <- format(as.POSIXct(Combined_data$Date.Time, format = "%m/%d/%Y %H:%M:%S"), format="%H:%M:%S")

head(Combined_data)
Combined_data$Date.Time <- ymd_hms(Combined_data$Date.Time)

#Create Individual Columns/Variables for Month Day and Year

Combined_data$day <- factor(day(Combined_data$Date.Time))
Combined_data$month <- factor(month(Combined_data$Date.Time, label=TRUE))
Combined_data$year <- factor(year(Combined_data$Date.Time))
Combined_data$dayofweek <- factor(wday(Combined_data$Date.Time, label=TRUE))

# Add Time variables as well 
Combined_data$second = factor(second(hms(Combined_data$Time)))
Combined_data$minute = factor(minute(hms(Combined_data$Time)))
Combined_data$hour = factor(hour(hms(Combined_data$Time)))

head(Combined_data)

#Data Visualization

#plotting the trips by hours in a day

hourly_data <- Combined_data %>% 
  group_by(hour) %>% 
  dplyr::summarize(Total = n())

# Shos data in a searchable js table
datatable(hourly_data)

#Plot the data by hour
ggplot(hourly_data, aes(hour, Total)) + 
  geom_bar(stat="identity", 
           fill="steelblue", 
           color="red") + 
  ggtitle("Trips Every Hour", subtitle = "aggregated today") + 
  theme(legend.position = "none", 
        plot.title = element_text(hjust = 0.5), 
        plot.subtitle = element_text(hjust = 0.5)) + 
  scale_y_continuous(labels=comma)

# Aggregate the data by month and hour
month_hour_data <- Combined_data %>% group_by(month, hour) %>%  dplyr::summarize(Total = n())

ggplot(month_hour_data, aes(hour, Total, fill=month)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Trips by Hour and Month") + 
  scale_y_continuous(labels = comma)

# Aggregate data by day of the month 
day_data <- Combined_data %>% group_by(day) %>% dplyr::summarize(Trips = n())
day_data

# Plot the data for the day
ggplot(day_data, aes(day, Trips)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  ggtitle("Trips by day of the month") + 
  theme(legend.position = "none") + 
  scale_y_continuous(labels = comma)

# Collect data by day of the week and month

day_month_data <- Combined_data %>% group_by(dayofweek, month) %>% dplyr::summarize(Trips = n())
day_month_data

# Plot the above data
ggplot(day_month_data, aes(dayofweek, Trips, fill = month)) + 
  geom_bar(stat = "identity", aes(fill = month), position = "dodge") + 
  ggtitle("Trias by Day and Month") + 
  scale_y_continuous(labels = comma) + 
  scale_fill_manual(values = colors)

month_data <- Combined_data %>% group_by(month) %>% dplyr::summarize(Total = n())

month_data

ggplot(month_data, aes(month, Total, fill = month)) + 
  geom_bar(stat = "Identity") + 
  ggtitle("Trips in a month") + 
  theme(legend.position = "none") + 
  scale_y_continuous(labels = comma) + 
  scale_fill_manual(values = colors)

Combined_data_hour_data <- Combined_data %>% group_by(day, hour) %>% dplyr::summarize(Total = n())
datatable(Combined_data_hour_data)

# Plot a heatmap 

ggplot(Combined_data_hour_data, aes(day, hour, fill = Total)) + 
  geom_tile(color = "white") + 
  ggtitle("Heat Map by Hour and Day")

# Collect data by month and day

month_day_data <- Combined_data %>% group_by(month, day) %>% dplyr::summarize(Trips = n())
month_day_data

# Plot a heatmap 

ggplot(month_day_data, aes(day, month, fill = Trips)) + 
  geom_tile(color = "white") + 
  ggtitle("Heat Map by Month and Day")

# Plot a heatmap by day of the week and month

ggplot(day_month_data, aes(dayofweek, month, fill = Trips)) + 
  geom_tile(color = "white") + 
  ggtitle("Heat Map by Month and Day")

# Set Map Constants
min_lat <- 40 
max_lat <- 40.91
min_long <- -74.15
max_long <- -73.7004

ggplot(Combined_data,aes(x=Lon, y=Lat))+
  geom_point(size=1, color = "blue") +
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2014 (April-May)")


