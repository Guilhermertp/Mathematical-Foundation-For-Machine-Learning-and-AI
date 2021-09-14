# Building a Covariance Matrix in R - Two Ways

# Create column vectors
a <- c(1,2,3,4,5,6)
b <- c(6,12,18,24,30,36)
c <- c(5,10,15,20,25,30)
d <- c(0,4,6,7,9,2)
e <- c(4,5,6,7,8,9)

#create a matrix from vectors
M <- cbind(a, b, c, d, e)
k <- ncol(M)
n <- nrow(M)
print(M)

# Find the mean of each column
k_mean <- matrix(data = 1, nrow = n) %*% cbind(mean(a), mean(b), mean(c), mean(d), mean(e))
print(k_mean)

# Create a difference matrix
diffM <- M - k_mean
print(diffM)

#Create the covariance matrix
covarM <- (n-1)^-1 * t(diffM) %*% diffM #sample covariance
print(covarM)

# Find variances from the covariance matrix
variance <- diag(covarM)
print(variance)

# Use R's built-in function
print(cov(M))