#Import Dataset
library(readxl)
Data3 <- read_excel("Documents/BAPM /Fall 24/Web Analytics/Project/Data3.xlsx")
View(Data3)



#Clicks = A + B Student Type + C Ad version + D (Student Type * Ad version)

#install package car to run linear hypothesis
install.packages("car")
#load package 'car'
library(car)


#Setting up base for reference

Data3$Adversion <- as.factor(Data3$Adversion)
Data3$Adversion <- relevel(Data3$Adversion, ref = "Project")

#Regression Model
m1 <-lm(Clicks ~ as.factor(StudentType) + as.factor(Adversion) + as.factor(StudentType):as.factor(Adversion), data=Data3)
summary(m1)


#Hypothesis of C+D to check effect of ad version on International Students

linearHypothesis(m1,"as.factor(Adversion)Analytics + as.factor(StudentType)International:as.factor(Adversion)Analytics")



