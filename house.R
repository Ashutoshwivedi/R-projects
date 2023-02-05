#house dataset
View(kc_house_data)

str(kc_house_data)

head(kc_house_data)

head(kc_house_data,3)
head(kc_house_data,10)

tail(kc_house_data)

#Data Visualizatiion

library(dplyr)
kc_house_data %>% select(c(-1))->house
View(house)
#-------------------------------------
#geometry
#--------

#Histogram
library(ggplot2)
ggplot(data=house,aes(x=price))+geom_histogram()
ggplot(data=house,aes(x=price))+geom_histogram(bins=50)
ggplot(data=house,aes(x=price))+geom_histogram(bins=50,fill="palegreen4")
ggplot(data=house,aes(x=price))+geom_histogram(bins=50,fill="palegreen4",col="green")

#position
ggplot(data=house,aes(x=price,fill=condition))+geom_histogram()
ggplot(data=house,aes(x=price,fill=condition))+geom_histogram(position="fill")

#Bar-plot
ggplot(data=house,aes(x=waterfront))+geom_bar()

#waterfront-condition
ggplot(data=house,aes(x=waterfront,fill=condition))+geom_bar()
ggplot(data=house,aes(x=waterfront,fill=condition))+geom_bar(position="fill")

#waterfront-grade
ggplot(data=house,aes(x=waterfront,fill=grade))+geom_bar()
ggplot(data=house,aes(x=waterfront,fill=grade))+geom_bar(position="fill")

#---------------

#Frequency-Polygon
ggplot(data=house,aes(x=price))+geom_freqpoly()
ggplot(data=house,aes(x=price))+geom_freqpoly(bins=60)
ggplot(data=house,aes(x=price,col=condition))+geom_freqpoly(bins=60)

#Boxplot
ggplot(data=house,aes(x=factor(bedrooms),y=price))+geom_boxplot()
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=factor(bedrooms)))+geom_boxplot()
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=condition)+geom_boxplot()

#--------------

#Smooth-Line
ggplot(data=house,aes(y=price,x=sqft_living))+geom_smooth()
ggplot(data=house,aes(y=price,x=sqft_living,col=condition))+geom_smooth(se=F)
ggplot(data=house,aes(y=price,x=sqft_living,col=heat))+geom_smooth(se=F)

#method="lm"
ggplot(data=house,aes(y=price,x=sqft_living))+geom_point()+geom_smooth(method="lm",se=F)
ggplot(data=house,aes(y=price,x=sqft_living,col=condition))+geom_point()+geom_smooth(method="lm",se=F)

#----------

#FACETING
ggplot(data=house,aes(y=price,x=sqft_living,col=condition))+geom_point()+geom_smooth(method="lm",se=F)+facet_grid(condition)
ggplot(data=house,aes(y=price,x=sqft_living,col=factor(fireplaces)))+geom_point()+geom_smooth(method="lm",se=F)+facet_grid(-fireplaces)
ggplot(data=house,aes(y=price,x=age,col=factor(fireplaces)))+geom_point()+geom_smooth(method="lm",se=F)+facet_grid(-fireplaces)

#----------

#Theme-1
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=factor(bedrooms)))+geom_boxplot()->obj1
obj1+labs(title="Price w.r.t bedrooms",x="bedrooms",fill="bedrooms")->obj2
obj2+theme(panel.background = element_rect(fill="palegreen1"))->obj3
obj3+theme(plot.title = element_text(hjust = 0.5, face = "bold",colour = "cadetblue")->obj4
obj4+scale_y_countinous(labels = dollar)


#Theme-2
ggplot(data=house,aes(y=price,x=bedrooms,col=condition))+geom_point()+geom_smooth(method="lm",se=F)+facet_grid()->g1
g1+theme(panel.background = element_rect(fill="lemonchiffon2"))->g2
g2+theme(legend.background = element_rect(fill="lightcyan4"))->g3
g3+theme(plot.background = element_rect(fill="lightcoral"))
           
#Theme-3
ggplot(data=house,aes(x=price,col=condition))+geom_freqpoly(size=1,bins=60)+scale_x_continuous()->p1
p1+theme(panel.background = element_rect(fill="peachpuff"))->p2
p2+labs(title = "frequency polygon for price")->p3
p3+theme(plot.title = element_text(hjust = 0.5),plot.background = element_rect("aquamarine4"))


  
















