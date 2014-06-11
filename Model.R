library(MASS)
source('./generators.R')

setClass(
  Class="QueueingSystem",
  slots=c(
    e1func="function",
    e2func="function",
    h1func="function",
    h2func="function",
    time="numeric",
    timeEnd="numeric",
    h="numeric",
    e1="numeric",
    e2="numeric",
    n="numeric",
    S="numeric",
    Q="vector",
    stats="data.frame",
    hTotal="numeric",
    hEntriesCount="numeric"
  )
  );
setMethod (
  "initialize",
  "QueueingSystem",
  function (.Object, ...) {
    .Object@e1func <- function () {
      l=3; lambda=0.25;
      erlangDist(l, lambda)
      #erlangDist(l, 1/lambda)
      #rgamma(1, shape=l, scale=lambda)
      #rgamma(1, shape=l, scale=1/lambda)
    };
    .Object@e2func <- function () {
      lambda=0.5;
      expDist(1/lambda);
      #rexp(1, rate=lambda)
    };
    .Object@h1func <- function () {
      mu=12; sigma=2; n=120000;
      normDist(mu, sigma, n)
      #mu=12; sigma=2
      #rnorm(1, mean=mu, sd=sigma)
    };
    .Object@h2func <- function () {
      lambda=2 
      expDist(1/lambda)
      #rexp(1, rate=lambda)
    };
    .Object@time <- 0;
    .Object@timeEnd <- 500;
    .Object@S <- 0;
    .Object@n <- 0;
    .Object@e1 <- .Object@e1func();
    .Object@e2 <- .Object@e2func();
    .Object@h <- .Object@timeEnd + 1;
    .Object@Q <- vector(mode="numeric");
    .Object@stats <- mm1Stats(.Object);
    .Object@hTotal <- 0;
    .Object@hEntriesCount <- 0;
    
    .Object
  }
);
setGeneric(
  "mm1", 
  function(.Object) standardGeneric("mm1")
  )
setMethod(
  "mm1",
  signature = "QueueingSystem",
  definition = function(.Object){
    
    while (.Object@time < .Object@timeEnd) {
      .Object@time <- min(.Object@e1, .Object@e2, .Object@h)
      
      if (.Object@time == .Object@e1) {
        transactType <- 1
        eventType <- "e1"
      } else if (.Object@time == .Object@e2) {
        transactType <- 2
        eventType <- "e2"
      } else {
        eventType <- "h"
      }
      
      if (.Object@time == .Object@h) { # time to process transact by server
        
        .Object@S <- 0
        
        if (.Object@n > 0) {
          .Object@n <- .Object@n - 1
          transactType <- .Object@Q[1]
          .Object@Q <- .Object@Q[-1]
          .Object@S <- 1
          if (transactType == 1) {
            t <- .Object@h1func()
            .Object@h <- .Object@time + t
          } else if (transactType == 2) {
            t <- .Object@h2func()
            .Object@h <- .Object@time + t
          }
          if (.Object@h < .Object@timeEnd) {
            .Object@hTotal <- .Object@hTotal + t # collect server time
            .Object@hEntriesCount <- .Object@hEntriesCount + 1
          }
        } else {
          .Object@h <- .Object@timeEnd + 1
        }
        
      } else {
        
        if (.Object@S == 0) { # server is free
          .Object@S <- 1
          if (transactType == 1) {
            t <- .Object@h1func()
            .Object@h <- .Object@time + t
          } else if (transactType == 2) {
            t <- .Object@h2func()
            .Object@h <- .Object@time + t
          }
          if (.Object@h < .Object@timeEnd) {
            .Object@hTotal <- .Object@hTotal + t # collect server time
            .Object@hEntriesCount <- .Object@hEntriesCount + 1
          }
        } else { # othwerwise server is busy
          .Object@n <- .Object@n + 1 # increase queue length
          .Object@Q <- c(.Object@Q, transactType)
        }
        
        if (transactType == 1) {
          .Object@e1 <- .Object@time + .Object@e1func()
        } else if (transactType == 2) {
          .Object@e2 <- .Object@time + .Object@e2func()
        }
        
      }
      
      .Object@stats <- rbind(.Object@stats, mm1Stats(.Object, eventType))
    }
    .Object
  }
  );
setGeneric(
  "mm1Stats", 
  function(.Object, eventType='') standardGeneric("mm1Stats")
)
setMethod(
  "mm1Stats",
  signature = "QueueingSystem",
  definition = function(.Object, eventType=''){
    stats <- data.frame(
      eventType=c(eventType),
      time=c(round(.Object@time, 2)),
      S=c(.Object@S),
      n=c(.Object@n),
      e1=c(round(.Object@e1, 2)),
      e2=c(round(.Object@e2, 2)),
      h=c(round(.Object@h, 2)),
      Q=c(toString(.Object@Q)),
      stringsAsFactors=FALSE)
    stats
  }
)
setGeneric(
  "mm1QueueStats", 
  function(.Object) standardGeneric("mm1QueueStats")
)
setMethod(
  "mm1QueueStats",
  signature = "QueueingSystem",
  definition = function(.Object){
    summary(q@stats$n)
    summary(q@stats$time)
    summary(q@stats[q@stats$S == 1,]$time)
  }
)
setGeneric(
  "mm1ServerStats", 
  function(.Object) standardGeneric("mm1ServerStats")
)
setMethod(
  "mm1ServerStats",
  signature = "QueueingSystem",
  definition = function(.Object){
    data.frame(
      "Entries count"=c(.Object@hEntriesCount),
      "Total time"=c(.Object@hTotal),
      "Util. time"=c(.Object@hTotal/.Object@timeEnd),
      "Avg. time"=c(.Object@hTotal/.Object@hEntriesCount)
      )
  }
)

