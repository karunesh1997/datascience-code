# ARIMA Models  ###########
amts<-ts(Aviation$Sales,frequency = 4,start=c(86))
train<-amts[1:38]
test<-amts[39:42]
train<-ts(train,frequency = 4)
test<-ts(test,frequency = 4)
plot(train)
acf(train)
pacf(train)
a<-arima(train,order=c(1,1,8),method="ML")# by giving manual pdq values
a

# Auto.Arima model on the price agg data 
library(forecast)
model_AA <- auto.arima(train)# to let the model decide what the pdq values will be
model_AA
pred_AA <- data.frame(forecast(model_AA))
pred_AA
acf(model_AA$residuals)
pacf(model_AA$residuals)
windows()
plot(forecast(model_AA,h=12),xaxt="n")
