load("5.R.RData")
attach(Xy)
model1 <- lm(y ~X1 + X2)
summary(model1)
?matplot
matplot(Xy,type="l")
library(boot)
alpha = function(x,y){
  vx = var(x)
  vy = var(y)
  cxy= cov(x,y)
  (vy-cxy)/(vx+vy-2*cxy)
}
alpha(Xy$X1,Xy$y)

alpha.fn = function(data,index){
  with(data[index,],alpha(Xy$X1,Xy$y))
}

alpha.fn<-function(data, index) {
  fit1<-lm(y~., data=Xy[index,])
  coefficients(fit1)[['X1']]
}

set.seed(1)
alpha.fn (Xy,sample(1:100,100,replace=TRUE))


boot.out=boot(Xy,alpha.fn,R=1000)
boot.out
?tsboot
boot.fn.ts = function(data){
  fit <- lm(y ~ ., data)
  return(coef(fit))
}

#Now use block bootstrapp using the tsboot function
tsboot(Xy, boot.fn.ts, R = 1000, sim = "fixed", l = 100)
