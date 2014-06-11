
source('./generators.R')
set.seed(1)

#
# The Uniform distribution
#
U_test=runif(n=1000000, min=0, max=1);
hist(U_test)

#
# The Exponential Distribution
#
lambda=2
# Compute 
expData <- expDist(lambda, 1000)
#lambda <- fitdistr(expData, "exponential") 
distrHist(expData, "dexp", lambda);
generatorTest(expData, "pexp", lambda)

#
# The Erlang distributed random number
#
l=3; lambda=0.25;
U <- NULL
for(i in 1:1000) { 
  U <- c(U,erlangDist(l, 1/lambda))  
}
hist(U)
distrHist(U, "dgamma", scale=lambda, shape=l);
generatorTest(U, "pgamma", scale=lambda, shape=l)

#
# The Poisson distribution
#
lambda=0.5
U <- expDist(lambda, 1000);
hist(U)
distrHist(U, "dexp", rate=lambda);
generatorTest(U, "pexp", rate=lambda)

#
# Normal distribution
#
mu=12; sigma=2; n=100000;
U <- NULL
for(i in 1:1000) { 
  U <- c(U,normDist(mu, sigma, n))  
}
hist(U)
distrHist(U, "dnorm", mean=mu, sd=sigma);
generatorTest(U, "pnorm", mean=mu, sd=sigma);

source("./Model.R");
set.seed(1)
q <- new("QueueingSystem");
trace("mm1", browser, exit = browser, signature = c("QueueingSystem"))
q <- mm1(q);
