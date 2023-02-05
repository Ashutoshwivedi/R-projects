# Pokemon Data Analysis through visualization in R

getwd()

# Importing Dataset

Pokeman<-read.csv("D:/Data Science Course/TOP Mentors/R_files/Pokeman/Pokemon_Data.csv")

View(Pokeman)

# Checking number of rows and columns
nrow(Pokeman)
ncol(Pokeman)

# Tabulation of categorical columns
table(Pokeman$isLegendary)
table(Pokeman$Generation)
table(Pokeman$Type_1)

#min-max hp
min(Pokeman$HP)
max(Pokeman$HP)

min(Pokeman$Speed)
max(Pokeman$Speed)

#checking missing values
is.na(Pokeman$hasMegaEvolution)
sum(is.na(Pokeman$hasMegaEvolution))

#Renaming columns
colnames(Pokeman)
colnames(Pokeman) =='Type_1'
colnames(Pokeman)[colnames(Pokeman) == 'Type_1'] <- "primary_type"
View(Pokeman)

colnames(Pokeman) =='Type_2'
colnames(Pokeman)[colnames(Pokeman) == 'Type_2'] <- "secondary_type"
View(Pokeman)

colnames(Pokeman) =='Name'
colnames(Pokeman)[colnames(Pokeman) == 'Name'] <- "pokemon_name"
View(Pokeman)

