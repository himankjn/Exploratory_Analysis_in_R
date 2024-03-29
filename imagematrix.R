load("C:/Users/himank/Downloads/face.rda")
image(t(faceData)[,nrow(faceData):1])
svd1<-svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2),pch=19,xlab="Singular vector",ylab="Variance explained")
##0:10 columns explain allmost all of variance.

#here svd1$d[1] is constant
approx1<-svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]

#here we need to make diagonal matrix out of d
approx5<-svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])

approx10<-svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])

par(mfrow=c(1,4))
image(t(approx1)[,nrow(approx1):1],main="(a)")
image(t(approx5)[,nrow(approx5):1],main="(b)")
image(t(approx10)[,nrow(approx10):1],main="(c)")
image(t(faceData)[,nrow(faceData):1],main="(d)")
View(faceData)
dim(faceData)