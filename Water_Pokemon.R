
colnames(Pokeman)

#Water_pokemon

Pokeman%>%filter(primary_type=="Water") -> Water_Pokemon
View(Water_Pokemon)

min(Water_Pokemon$Speed) #15
max(Water_Pokemon$Speed) #122

mean(Water_Pokemon$Sp_Atk) #71.095
mean(Water_Pokemon$Sp_Def) #67.095

#visualizing status of Water-pokemon
library(ggplot2)

#against ice
ggplot(data=Water_Pokemon,aes(x=against_Ice)) +geom_histogram()

#against poison
ggplot(data=Water_Pokemon,aes(x=against_Poison)) +geom_histogram()

#against grass
ggplot(data=Water_Pokemon,aes(x=against_Grass)) +geom_histogram()
