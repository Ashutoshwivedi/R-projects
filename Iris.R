# Inbuilt functions

View(Iris.csv)

str(Iris.csv)

head(Iris.csv)

head(Iris.csv,3)
head(Iris.csv,10)

tail(Iris.csv)
table(Iris.csv$Species)

min(Iris.csv$SepalLengthCm) #4.3
min(Iris.csv$SepalWidthCm) #2
max(Iris.csv$SepalLengthCm) #7.9
max(Iris.csv$SepalWidthCm) #4.4

mean(Iris.csv$SepalWidthCm) #3.054
mean(Iris.csv$SepalLengthCm) #5.8

range(Iris.csv$SepalLengthCm) #4.3-7.9
range(Iris.csv$SepalWidthCm) #2.0-4.4

#Decision Making Statement
#if -if-else Statment

if(Iris.csv$SepalLengthCm[1]>4){
  print("Sepal Length is greater than 4")
}

# if.else
if(Iris.csv$SepalLengthCm[1]<4){
  print("Sepal Length is less than 4")
}else{
  print("Sepal Length is greater than 4")
}

#Looping Statement(for,While)

#for loop
vec1 <- 1:9

for(i in vec1){
    print(i+5)
}

#while loop
i = 1
while(i<10){
  print(i+5)
  i=i+1
}

#User defined function
add5<-function(x){
  print(x+5)
}
add5(10)

add5(100)

sub5<-function(x){
  print(x-5)
}
sub5(10)
sub5(100)

mul5<-function(x){
  print(x*5)
}
mul5(10)
mul5(100)

div5<-function(x){
  print(x/5)
}
div5(50)
div5(500)

#Scatter plot
plot(Iris.csv$SepalLengthCm- Iris.csv$PetalLengthCm)

#Time to modify labels
plot(Iris.csv$SepalLengthCm- Iris.csv$PetalLengthCm,ylab="SepalLengthCm",xlab="PetalLengthCm",main="SepalLengthCm vs PetalLengthCm")

#Let's add some color
plot(Iris.csv$SepalLengthCm- Iris.csv$PetalLengthCm,ylab="SepalLengthCm",xlab="PetalLengthCm",main="SepalLengthCm vs PetalLengthCm",col="blue",pch=16)

#Histogram
hist(Iris.csv$SepalWidthCm)
hist(Iris.csv$SepalWidthCm,xlab="SepalWidthCm",main="Distribution of Sepal Width",col="aquamarine3")

#Boxplot
table(Iris.csv$Species)
boxplot(Iris.csv$SepalLengthCm-Iris.csv$PetalLengthCm)
boxplot(Iris.csv$SepalLengthCm-Iris.csv$PetalLengthCm,ylab="SepalLengthCm",xlab="PetalLengthCm",main="Sepal Length of different PetalLengthCm",col="burlywood",pch=16)
#--------------------------------------------

#load ggplot2 package
library(ggplot2)
ggplot(data=Iris.csv)
ggplot(data=Iris.csv,aes(y=SepalLengthCm,x=PetalLengthCm))
ggplot(data=Iris.csv,aes(y=SepalLengthCm,x=PetalLengthCm))+geom_point()

#Aesthetic
ggplot(data=Iris.csv,aes(y=SepalLengthCm,x=PetalLengthCm,col=Species))+geom_point()
ggplot(data=Iris.csv,aes(y=SepalLengthCm,x=PetalLengthCm,col=Species,shape=Species))+geom_point()

#house dataset














