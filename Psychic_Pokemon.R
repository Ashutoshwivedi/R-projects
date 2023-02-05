
colnames(Pokeman)

#Psychic_pokemon

Pokeman%>%filter(primary_type=="Psychic") -> Psychic_Pokemon
View(Psychic_Pokemon)

min(Psychic_Pokemon$Speed) #20
max(Psychic_Pokemon$Speed) #150

mean(Psychic_Pokemon$Sp_Atk) #90
mean(Psychic_Pokemon$Sp_Def) #82

#visualizing status of Psychic-pokemon
library(ggplot2)

#In case of Numerical column
ggplot(data=Psychic_Pokemon,aes(x=Total)) +geom_histogram(fill="hotpink")

#In case of Gen=Categorical col and Sp_Def is Numerical col
ggplot(data=Psychic_Pokemon,aes(x=as.factor(Generation),y=Sp_Def)) +geom_boxplot(fill="blue")

#In case of Categorical column
ggplot(data=Psychic_Pokemon,aes(x=isLegendary)) +geom_bar(fill="red")