j<-c(21,62,10,53)
i<-c("london","newyork","singapore","mumbai")
pie(j,labels=i,col="red",main="cities")
legend("topright",legend=i,fill=c("red"),main="cities")
