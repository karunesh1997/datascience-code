
NewspaperData <- read.csv("/Volumes/Data/Excelr/Course Content/Data Science/Week 1/NewspaperData.csv")

np<-NewspaperData[,-1]

model<-lm(sunday~daily,data=np)

summary(model)


prediction<- predict(model,newdata = data.frame(daily=250))
predicted=predict(model)
Errors<-model$residuals

data<-data.frame(np,"Predicted" = predicted, Errors)
