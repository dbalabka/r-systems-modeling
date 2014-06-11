#
# Make distribution proof with Chi-square and K.S. tests
#
generatorTest <- function (x, fName, ...) {
  result <- list(ks = FALSE, chisq1 = FALSE, chisq2 = FALSE)
  
  f <- get(fName, mode = "function")
  result$ks <- ks.test(x, fName, ...)
  
  xHist <- hist(x,breaks="Sturges",plot=FALSE)
  breaks <- xHist$breaks
  
  #  O <- table(cut(x,breaks=breaks))
  #  p <- diff(f(breaks, ...))
  #  result$chisq1 <- chisq.test(O,p=p, rescale.p=T)
  
  k <- length(breaks) - 1
  breaks[1] <- (-Inf);
  breaks[k+1] <- (+Inf)
  p <- f(breaks, ...)
  p <- p[2:(k+1)] - p[1:k]
  round(p, 2)
  result$chisq2 <- chisq.test(xHist$counts, p=p, rescale.p=TRUE)
  
  result
}

#
# Helper method to generate histogram 
# for specific random numbers and theoretical distribution
#
distrHist <- function (x, fName, ...) {
  f <- get(fName, mode = "function")
  #hist(x, freq = FALSE, breaks = 100, xlim = c(0, quantile(x, 0.95)))
  hist(x, freq = FALSE, breaks = 100, xlim = c(quantile(x, 0.01), quantile(x, 0.99)))
  curve(f(x, ...), col = "red", add = TRUE)
}

#
# Exponential distribution random number generator
#
expDist <- function (lambda, n=1) {
  -1/lambda*log(runif(n));
}

#
# Erlang distribution random number generator
#
erlangDist <- function (l, lambda) {
  sum(expDist(lambda, l)); # passing l argument is incorrect?
}

#
# Normal distribution random number generator
#
normDist <- function (mu, sigma, n) {
  if (n %% 12) {
    warning("n should be devidable by 12 without reminder")
  }
  z <- (sum(runif(n)) - n/2)/sqrt(n/12)
  z * sigma + mu
}