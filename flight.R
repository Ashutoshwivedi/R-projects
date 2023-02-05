
#Flights dataset
View(Flights_Data.csv)

str(Flights_Data.csv)

head(Flights_Data.csv)

head(Flights_Data.csv,5)
head(Flights_Data.csv,10)

tail(Flights_Data.csv)

#Data Manipulation
library(dplyr)
View(Flights_Data.csv)
#select
#---------

select(Flights_Data.csv,flight,arr_time,dep_time)->flight1
View(flight1)
select(Flights_Data.csv,5,6,8)->flight1
View(flight1)
select(Flights_Data.csv,contains("time"))->flight1
View(flight1)
select(Flights_Data.csv,year:arr_time)->flight1
View(flight1)
select(Flights_Data.csv,1:6)->flight1
View(flight1)
select(Flights_Data.csv,starts_with("day"),ends_with("time"))->flight1
View(flight1)

#Mutate
#---------
str(Flights_Data.csv)
mutate(Flights_Data.csv,sched_dep_time=sched_arr_time:-air_time)->flight1
mutate(Flights_Data.csv,averagespeed=distance/air_time*60)->flight1
mutate(Flights_Data.csv,timeloss=arr_time+dep_delay)->flight1

#Filter
#----------------
filter(Flights_Data.csv,distance>3000)->flight1
View(flight1)
range(flight1$distance)
table(Flights_Data.csv$carrier)
filter(Flights_Data.csv,carrier %in% c("UA","US","AA"))->flight1
View(flight1)
filter(Flights_Data.csv,dep_time<500|arr_time>2200)->flight1

#Arrange
#--------
arrange(Flights_Data.csv,dep_delay)->flight1
View(flight1)
arrange(Flights_Data.csv,air_time)->flight1
arrange(Flights_Data.csv,dep_delay+arr_delay)->flight1
View(flight1)

#Summarise
#-----------
summarise(Flights_Data.csv,min_dist=min(distance),max_dist=max(distance))
summarise(Flights_Data.csv,earliest=min(arr_delay,na.rm = T),average=mean(arr_delay,na.rm = T),latest=max(arr_delay,na.rm = T),sd=sd(arr_delay,na.rm = T)
)

#Pipe
#--------
Flights_Data.csv %>% select(contains("time")) %>% filter(arr_time>60)->flight1
View(flight1)
str(flight1)
range(flight1$air_time)
Flights_Data.csv %>% select(carrier=="US") %>% summarise(Min_Time=min(air_time,na.rm = T))
Min_Time






