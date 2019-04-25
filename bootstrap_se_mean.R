bootstrap_se_mean <- function(x, resamples=10000, plots=FALSE, ...) {
  # Select bootstrap samples and compute the mean of each.
  bs_means <- numeric(resamples)
  for (i in 1:resamples) {
    r <- sample(x, size=length(x), replace = TRUE)
    bs_means[i] <- mean(r)
  }
  # Standard error estimated from sample.
  se <- sd(x) / sqrt(length(x) - 1)
  if (plots) {
    # Histogram of resampled means
    b <- hist(bs_means, probability = TRUE, ...)
    # Distribution overlay based on mean and SE of base sample.
    ix <- seq(min(b$breaks),max(b$breaks),length=400)
    y <- dnorm(ix, mean = mean(x), sd = se)
    bsd <- density(bs_means)
    points(ix,y,type='l')
    points(bsd$x,bsd$y,type='l',col='red')
  }
  # Return the bootstrapped and sample-based SE
  # This whole exercise demonstrates their similarity.
  return( list( bs_se = sd(bs_means), se = se ) )
}