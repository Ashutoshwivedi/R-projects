
colnames(Pokeman)

#Fire_pokemon

Pokeman%>%filter(primary_type=="Fire") -> Fire_Pokemon
View(Fire_Pokemon)

min(Fire_Pokemon$Speed) #20
max(Fire_Pokemon$Speed) #126

mean(Fire_Pokemon$Sp_Atk) #81.78
mean(Fire_Pokemon$Sp_Def) #67.87

#visualizing stats of Fire-pokemon
library(ggplot2)

#Generation
ggplot(data=Fire_Pokemon,aes(x=Generation)) +geom_bar()
ggplot(data=Fire_Pokemon,aes(x=Generation,fill=as.factor(Generation))) +geom_bar()

#secondary_type
ggplot(data=Fire_Pokemon,aes(x=secondary_type,fill=as.factor(secondary_type))) +geom_bar()

#Sp_Atk vs Sp_Def (ploting in scatter point by using geom point because it is numerial data)
ggplot(data=Fire_Pokemon,aes(x=Sp_Atk, y=Sp_Def)) +geom_point(col="coral")

#Weight vs Height
ggplot(data=Fire_Pokemon,aes(x=Height_m, y=Weight_kg)) +geom_point()



