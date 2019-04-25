library('boot')

# d should be you data or some data you make up.

my_stat <- function(data, indices, formula, getse) {
  d <- data[indices,]
  fit <- lm(formula, data = d)
  if (getse) {
    b <- boot(d, statistic = f, R = 100, formula = y~x1*x2, getse=FALSE)
    return(rbind(coef(fit),diag(var(b$t))))
  }
  return(coef(fit))
}
b <- boot(d, statistic = f, R = 1000, formula = y~x1*x2, getse = TRUE)
boot.ci(b, type = 'stud', index = c(1,2)) # CI for intercept
boot.ci(b, type = 'stud', index = c(3,4)) # CI for B_1
boot.ci(b, type = 'bca', index = 1) # CI for intercept
boot.ci(b, type = 'bca', index = 3) # CI for B_1
