## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(linearRegression)

## -----------------------------------------------------------------------------
# Let’s set up our data with the constant column of 1’s
set.seed(61)
x <- runif(100, 0, 10)
X <- cbind(1, x)
y <- runif(100, 5, 100)
eps <- rnorm(100, 0, 0.5)
# add some noise to the output
y <- (y + eps)
## t(X) transposes the matrix X
## solve(X) calculates the inverse of matrix X
## use %*% for matrix multiplication
OLS_coef <- solve(t(X) %*% X) %*% t(X) %*% y
lm_coef <- lm(y~X)$coef

m <- cbind(OLS_coef,lm_coef)

mat <- matrix(m, nrow=2, byrow = TRUE) 
colnames(mat, do.NULL = FALSE)
colnames(mat) <- c("OLS_coef", "lm_coef")
rownames(mat) <- c("Intercept(w0)", "w1")
# print matrix 
print(mat) 

