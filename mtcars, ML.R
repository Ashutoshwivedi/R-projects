#mtcars dataset
View(mtcars.csv)

str(mtcars.csv)

head(mtcars.csv)

head(mtcars.csv,5)
head(mtcars.csv,10)

tail(mtcars.csv)

?mtcars.csv

Data_cars <- mtcars.csv # create a vairiable of the mtcars data set of better organization

#Use dim() to find the dimension of the dataset
dim(Data_cars)

# Use names() to find the names of the variables from the data set
names(Data_cars)

rownames(Data_cars)
colnames(Data_cars)

Data_cars$cyl
Data_cars$mpg # dataframe_names$field_name

sort(Data_cars$cyl) # sort all the data in cyl

# summary method
summary(Data_Cars)

Data_cars <-mtcars.csv

#min-max hp
min(Data_cars$hp)
max(Data_cars$hp)

# In the data what is the particular index of the max and the minimum value
which.max(Data_cars$hp)
which.min(Data_cars$hp)

rownames(Data_cars)[which.max(Data_cars$hp)]
rownames(Data_cars)[which.min(Data_cars$hp)]

mean(Data_cars$wt)
median(Data_cars$wt)

names(sort(-table(Data_cars$wt)))[1]

# c() specifies which percentile you want
quantile(Data_Cars$wt, c(0.25))
quantile(Data_Cars$wt, c(0.50))
quantile(Data_Cars$wt, c(0.75))
quantile(Data_Cars$wt, c(1))
  

#Machine Learning
#----------------

#Linear regression
#-----------------
View(mtcars.csv)
#install.packages("caTools")
library(caTools)
sample.split(mtcars.csv$mpg,SplitRatio = 0.65)->mysplit
train<-subset(mtcars.csv,mysplit==T)
nrow(train)
test<-subset(mtcars.csv,mysplit==F)
nrow(test)
lm(mpg~.,data=train)->mod1
predict(mod1, train)->result
View(result)
predict(mod1, test)->result
View(result)
cbind(actual=test$mpg,predicted=result)->final
View(final)
cbind(actual=train$mpg,predicted=result)->final
View(final)
as.data.frame(final)->final

cbind(final,error=final$actual-final$predicted)->final
rmse1<-sqrt(mean((error)^2))
View(rmse1)

lm(mpg~.-gear,-carb,data=test)->mod2
predict(mod2,train)->result
lm(mpg~.-gear,-carb,data=train)->mod2
predict(mod2,test)->result
cbind(actual=test$mpg,predicted=result)->final
as.data.frame(final)->final
cbind(final,error=final$actual-final$predicted)->final
rmse2<-sqrt(mean((error)^2))
rmse2
View(final)



