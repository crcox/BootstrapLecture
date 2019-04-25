# Sampling distribution figures
source('bootstrap_se_mean.R')

n <- 20
par(mfrow=c(1,2))
x <- rnorm(n)
bootstrap_se_mean(x, plots=TRUE, main = "Histogram of resampled means\n(normal pop., n=20)")

x <- rexp(n, 1/3)
bootstrap_se_mean(x, plots=TRUE, main = "Histogram of resampled means\n(exponential pop., n=20)")