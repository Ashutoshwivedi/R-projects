
install.packages("dplyr")
library(dplyr)
colnames(Pokeman)

#Grass_pokemon

Pokeman%>%filter(primary_type=="Grass") -> Grass_Pokemon
View(Grass_Pokemon)

min(Grass_Pokemon$Speed) #10
max(Grass_Pokemon$Speed) #120

mean(Grass_Pokemon$Sp_Atk) #74.33
mean(Grass_Pokemon$Sp_Def) #68.86

#visualizing stats of grass-pokemon
library(ggplot2)

#HP map
ggplot(data=Grass_Pokemon,aes(x=HP)) +geom_histogram()
ggplot(data=Grass_Pokemon,aes(x=HP)) +geom_histogram(fill="palegreen4")

#Hieght Variation
ggplot(data=Grass_Pokemon,aes(x=Height_m)) +geom_histogram(fill="orange1")

#Weight Variation
ggplot(data=Grass_Pokemon,aes(x=Weight_kg)) +geom_histogram(fill="red")

#isLegendary vs not-isLegendary
ggplot(data=Grass_Pokemon,aes(x=isLegendary)) +geom_bar(fill="orange1")


