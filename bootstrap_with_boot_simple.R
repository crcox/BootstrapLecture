library('boot')

# Define your statistic with a function
my_stat <- function(data, indices, extra) {
  # Extra is not used, just for demo ...
  xr <- data[indices]
  return(mean(xr))
}
# Run boot on your data (x), using your statistic, with R resamples.
# stype "i" tells boot that the second argument of your statistic
# function expects the resampling index.
b <- boot(x, statistic = my_stat, R = 10000, stype = "i", extra = "fun!")
boot.ci(b, type = 'bca', index = 1)
