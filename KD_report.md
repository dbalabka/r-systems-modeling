

Overview
========
Following libraries will be used

```r
source("./generators.R")
source("./Model.R")
```

Set random seed

```r
set.seed(1)
```


Random number generators
========================
Uniform Distribution
-------------------

```r
x = runif(n = 1e+06, min = 0, max = 1)
```


![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


Exponential Distribution
------------------------

```r
lambda = 2
x <- expDist(1/lambda, 1000)
```


![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 


<table>
 <thead>
  <tr>
   <th> Real.Mean </th>
   <th> Real.S.D. </th>
   <th> Expected.Mean </th>
   <th> Expected.S.D. </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> 1.96 </td>
   <td> 1.973 </td>
   <td> 2 </td>
   <td> 2 </td>
  </tr>
</tbody>
</table>


### Distribution fitting

```
## Warning: Chi-squared approximation may be incorrect
```

```
## $ks
## 
## 	One-sample Kolmogorov-Smirnov test
## 
## data:  x
## D = 0.0333, p-value = 0.2173
## alternative hypothesis: two-sided
## 
## 
## $chisq1
## [1] FALSE
## 
## $chisq2
## 
## 	Chi-squared test for given probabilities
## 
## data:  xHist$counts
## X-squared = 7.348, df = 14, p-value = 0.9204
```


Erlang distribution
-------------------

```r
l = 3
lambda = 0.25
x <- NULL
for (i in 1:5000) {
    x <- c(x, erlangDist(l, lambda))
    # x <- c(x,erlangDist(l, 1/lambda))
}
```


![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 


<table>
 <thead>
  <tr>
   <th> Real.Mean </th>
   <th> Real.S.D. </th>
   <th> Expected.Mean </th>
   <th> Expected.S.D. </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> 11.94 </td>
   <td> 6.84 </td>
   <td> 12 </td>
   <td> 6.928 </td>
  </tr>
</tbody>
</table>


### Distribution fitting

```
## Warning: Chi-squared approximation may be incorrect
```

```
## $ks
## 
## 	One-sample Kolmogorov-Smirnov test
## 
## data:  x
## D = 0.0084, p-value = 0.8678
## alternative hypothesis: two-sided
## 
## 
## $chisq1
## [1] FALSE
## 
## $chisq2
## 
## 	Chi-squared test for given probabilities
## 
## data:  xHist$counts
## X-squared = 14.34, df = 11, p-value = 0.2145
```


Poisson distribution
--------------------

```r
lambda = 0.5
x <- expDist(1/lambda, 1000)
```


![plot of chunk unnamed-chunk-15](figure/unnamed-chunk-15.png) 


<table>
 <thead>
  <tr>
   <th> Real.Mean </th>
   <th> Real.S.D. </th>
   <th> Expected.Mean </th>
   <th> Expected.S.D. </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> 0.4913 </td>
   <td> 0.4932 </td>
   <td> 0.5 </td>
   <td> 0.5 </td>
  </tr>
</tbody>
</table>


### Distribution fitting

```
## Warning: Chi-squared approximation may be incorrect
```

```
## $ks
## 
## 	One-sample Kolmogorov-Smirnov test
## 
## data:  x
## D = 0.019, p-value = 0.8626
## alternative hypothesis: two-sided
## 
## 
## $chisq1
## [1] FALSE
## 
## $chisq2
## 
## 	Chi-squared test for given probabilities
## 
## data:  xHist$counts
## X-squared = 2.572, df = 7, p-value = 0.9215
```


Normal distribution
-------------------

```r
mu = 12
sigma = 2
n = 120000
x <- NULL
for (i in 1:1000) {
    x <- c(x, normDist(mu, sigma, n))
}
```


![plot of chunk unnamed-chunk-19](figure/unnamed-chunk-19.png) 


<table>
 <thead>
  <tr>
   <th> Real.Mean </th>
   <th> Real.S.D. </th>
   <th> Expected.Mean </th>
   <th> Expected.S.D. </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> 12.05 </td>
   <td> 1.983 </td>
   <td> 12 </td>
   <td> 2 </td>
  </tr>
</tbody>
</table>


### Distribution fitting

```
## Warning: Chi-squared approximation may be incorrect
```

```
## $ks
## 
## 	One-sample Kolmogorov-Smirnov test
## 
## data:  x
## D = 0.0245, p-value = 0.5854
## alternative hypothesis: two-sided
## 
## 
## $chisq1
## [1] FALSE
## 
## $chisq2
## 
## 	Chi-squared test for given probabilities
## 
## data:  xHist$counts
## X-squared = 26.29, df = 14, p-value = 0.02374
```


Queueing System model
=====================

```r
q <- new("QueueingSystem")
q <- mm1(q)
```

Queue statistics
----------------
### Queue length statistics

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0     221     420     416     601     832
```

### Queue time statistics

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##       0     133     247     248     365     500
```

### Queue zero time statistics

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     1.3   133.0   247.0   248.0   365.0   500.0
```

### Server statistics
<table>
 <thead>
  <tr>
   <th> Entries.count </th>
   <th> Total.time </th>
   <th> Util..time </th>
   <th> Avg..time </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> 204 </td>
   <td> 495.6 </td>
   <td> 0.9912 </td>
   <td> 2.429 </td>
  </tr>
</tbody>
</table>

Report
------
<table>
 <thead>
  <tr>
   <th> eventType </th>
   <th> time </th>
   <th> S </th>
   <th> n </th>
   <th> e1 </th>
   <th> e2 </th>
   <th> h </th>
   <th> Q </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td>  </td>
   <td>  0.00 </td>
   <td> 0 </td>
   <td>  0 </td>
   <td>  4.32 </td>
   <td>  1.33 </td>
   <td> 501.00 </td>
   <td>  </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  1.33 </td>
   <td> 1 </td>
   <td>  0 </td>
   <td>  4.32 </td>
   <td>  1.86 </td>
   <td>   5.15 </td>
   <td>  </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  1.86 </td>
   <td> 1 </td>
   <td>  1 </td>
   <td>  4.32 </td>
   <td>  2.11 </td>
   <td>   5.15 </td>
   <td> 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  2.11 </td>
   <td> 1 </td>
   <td>  2 </td>
   <td>  4.32 </td>
   <td>  2.34 </td>
   <td>   5.15 </td>
   <td> 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  2.34 </td>
   <td> 1 </td>
   <td>  3 </td>
   <td>  4.32 </td>
   <td>  2.43 </td>
   <td>   5.15 </td>
   <td> 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  2.43 </td>
   <td> 1 </td>
   <td>  4 </td>
   <td>  4.32 </td>
   <td>  3.56 </td>
   <td>   5.15 </td>
   <td> 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  3.56 </td>
   <td> 1 </td>
   <td>  5 </td>
   <td>  4.32 </td>
   <td>  3.71 </td>
   <td>   5.15 </td>
   <td> 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  3.71 </td>
   <td> 1 </td>
   <td>  6 </td>
   <td>  4.32 </td>
   <td>  4.25 </td>
   <td>   5.15 </td>
   <td> 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  4.25 </td>
   <td> 1 </td>
   <td>  7 </td>
   <td>  4.32 </td>
   <td>  4.51 </td>
   <td>   5.15 </td>
   <td> 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e1 </td>
   <td>  4.32 </td>
   <td> 1 </td>
   <td>  8 </td>
   <td> 14.29 </td>
   <td>  4.51 </td>
   <td>   5.15 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 1 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  4.51 </td>
   <td> 1 </td>
   <td>  9 </td>
   <td> 14.29 </td>
   <td>  4.66 </td>
   <td>   5.15 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 1, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  4.66 </td>
   <td> 1 </td>
   <td> 10 </td>
   <td> 14.29 </td>
   <td>  5.41 </td>
   <td>   5.15 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 1, 2, 2 </td>
  </tr>
  <tr>
   <td> h </td>
   <td>  5.15 </td>
   <td> 1 </td>
   <td>  9 </td>
   <td> 14.29 </td>
   <td>  5.41 </td>
   <td>   5.54 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  5.41 </td>
   <td> 1 </td>
   <td> 10 </td>
   <td> 14.29 </td>
   <td>  6.75 </td>
   <td>   5.54 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> h </td>
   <td>  5.54 </td>
   <td> 1 </td>
   <td>  9 </td>
   <td> 14.29 </td>
   <td>  6.75 </td>
   <td>   8.59 </td>
   <td> 2, 2, 2, 2, 2, 1, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  6.75 </td>
   <td> 1 </td>
   <td> 10 </td>
   <td> 14.29 </td>
   <td>  7.83 </td>
   <td>   8.59 </td>
   <td> 2, 2, 2, 2, 2, 1, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  7.83 </td>
   <td> 1 </td>
   <td> 11 </td>
   <td> 14.29 </td>
   <td>  8.55 </td>
   <td>   8.59 </td>
   <td> 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  8.55 </td>
   <td> 1 </td>
   <td> 12 </td>
   <td> 14.29 </td>
   <td>  9.48 </td>
   <td>   8.59 </td>
   <td> 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> h </td>
   <td>  8.59 </td>
   <td> 1 </td>
   <td> 11 </td>
   <td> 14.29 </td>
   <td>  9.48 </td>
   <td>   9.91 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  9.48 </td>
   <td> 1 </td>
   <td> 12 </td>
   <td> 14.29 </td>
   <td>  9.77 </td>
   <td>   9.91 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  9.77 </td>
   <td> 1 </td>
   <td> 13 </td>
   <td> 14.29 </td>
   <td>  9.78 </td>
   <td>   9.91 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  9.78 </td>
   <td> 1 </td>
   <td> 14 </td>
   <td> 14.29 </td>
   <td>  9.93 </td>
   <td>   9.91 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> h </td>
   <td>  9.91 </td>
   <td> 1 </td>
   <td> 13 </td>
   <td> 14.29 </td>
   <td>  9.93 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td>  9.93 </td>
   <td> 1 </td>
   <td> 14 </td>
   <td> 14.29 </td>
   <td> 10.02 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 10.02 </td>
   <td> 1 </td>
   <td> 15 </td>
   <td> 14.29 </td>
   <td> 10.03 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 10.03 </td>
   <td> 1 </td>
   <td> 16 </td>
   <td> 14.29 </td>
   <td> 10.21 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 10.21 </td>
   <td> 1 </td>
   <td> 17 </td>
   <td> 14.29 </td>
   <td> 11.49 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 11.49 </td>
   <td> 1 </td>
   <td> 18 </td>
   <td> 14.29 </td>
   <td> 12.14 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 12.14 </td>
   <td> 1 </td>
   <td> 19 </td>
   <td> 14.29 </td>
   <td> 12.55 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 12.55 </td>
   <td> 1 </td>
   <td> 20 </td>
   <td> 14.29 </td>
   <td> 12.91 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 12.91 </td>
   <td> 1 </td>
   <td> 21 </td>
   <td> 14.29 </td>
   <td> 13.31 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 13.31 </td>
   <td> 1 </td>
   <td> 22 </td>
   <td> 14.29 </td>
   <td> 13.80 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 13.80 </td>
   <td> 1 </td>
   <td> 23 </td>
   <td> 14.29 </td>
   <td> 13.88 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 13.88 </td>
   <td> 1 </td>
   <td> 24 </td>
   <td> 14.29 </td>
   <td> 15.81 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e1 </td>
   <td> 14.29 </td>
   <td> 1 </td>
   <td> 25 </td>
   <td> 38.19 </td>
   <td> 15.81 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 15.81 </td>
   <td> 1 </td>
   <td> 26 </td>
   <td> 38.19 </td>
   <td> 15.84 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 15.84 </td>
   <td> 1 </td>
   <td> 27 </td>
   <td> 38.19 </td>
   <td> 16.23 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 16.23 </td>
   <td> 1 </td>
   <td> 28 </td>
   <td> 38.19 </td>
   <td> 16.34 </td>
   <td>  16.23 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> h </td>
   <td> 16.23 </td>
   <td> 1 </td>
   <td> 27 </td>
   <td> 38.19 </td>
   <td> 16.34 </td>
   <td>  16.34 </td>
   <td> 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> h </td>
   <td> 16.34 </td>
   <td> 1 </td>
   <td> 26 </td>
   <td> 38.19 </td>
   <td> 16.34 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 16.34 </td>
   <td> 1 </td>
   <td> 27 </td>
   <td> 38.19 </td>
   <td> 16.64 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 16.64 </td>
   <td> 1 </td>
   <td> 28 </td>
   <td> 38.19 </td>
   <td> 18.96 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 18.96 </td>
   <td> 1 </td>
   <td> 29 </td>
   <td> 38.19 </td>
   <td> 19.10 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 19.10 </td>
   <td> 1 </td>
   <td> 30 </td>
   <td> 38.19 </td>
   <td> 19.50 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 19.50 </td>
   <td> 1 </td>
   <td> 31 </td>
   <td> 38.19 </td>
   <td> 19.83 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 19.83 </td>
   <td> 1 </td>
   <td> 32 </td>
   <td> 38.19 </td>
   <td> 20.07 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 20.07 </td>
   <td> 1 </td>
   <td> 33 </td>
   <td> 38.19 </td>
   <td> 20.80 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 20.80 </td>
   <td> 1 </td>
   <td> 34 </td>
   <td> 38.19 </td>
   <td> 21.02 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 21.02 </td>
   <td> 1 </td>
   <td> 35 </td>
   <td> 38.19 </td>
   <td> 21.11 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
  <tr>
   <td> e2 </td>
   <td> 21.11 </td>
   <td> 1 </td>
   <td> 36 </td>
   <td> 38.19 </td>
   <td> 22.08 </td>
   <td>  24.34 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 </td>
  </tr>
</tbody>
</table>

.........................
<table>
 <thead>
  <tr>
   <th>   </th>
   <th> eventType </th>
   <th> time </th>
   <th> S </th>
   <th> n </th>
   <th> e1 </th>
   <th> e2 </th>
   <th> h </th>
   <th> Q </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> 1193 </td>
   <td> e2 </td>
   <td> 479.2 </td>
   <td> 1 </td>
   <td> 801 </td>
   <td> 499.9 </td>
   <td> 479.4 </td>
   <td> 481.1 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1194 </td>
   <td> e2 </td>
   <td> 479.4 </td>
   <td> 1 </td>
   <td> 802 </td>
   <td> 499.9 </td>
   <td> 479.9 </td>
   <td> 481.1 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1195 </td>
   <td> e2 </td>
   <td> 479.9 </td>
   <td> 1 </td>
   <td> 803 </td>
   <td> 499.9 </td>
   <td> 481.8 </td>
   <td> 481.1 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1196 </td>
   <td> h </td>
   <td> 481.1 </td>
   <td> 1 </td>
   <td> 802 </td>
   <td> 499.9 </td>
   <td> 481.8 </td>
   <td> 482.1 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1197 </td>
   <td> e2 </td>
   <td> 481.8 </td>
   <td> 1 </td>
   <td> 803 </td>
   <td> 499.9 </td>
   <td> 482.3 </td>
   <td> 482.1 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1198 </td>
   <td> h </td>
   <td> 482.1 </td>
   <td> 1 </td>
   <td> 802 </td>
   <td> 499.9 </td>
   <td> 482.3 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1199 </td>
   <td> e2 </td>
   <td> 482.3 </td>
   <td> 1 </td>
   <td> 803 </td>
   <td> 499.9 </td>
   <td> 482.3 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1200 </td>
   <td> e2 </td>
   <td> 482.3 </td>
   <td> 1 </td>
   <td> 804 </td>
   <td> 499.9 </td>
   <td> 482.3 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1201 </td>
   <td> e2 </td>
   <td> 482.3 </td>
   <td> 1 </td>
   <td> 805 </td>
   <td> 499.9 </td>
   <td> 482.6 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1202 </td>
   <td> e2 </td>
   <td> 482.6 </td>
   <td> 1 </td>
   <td> 806 </td>
   <td> 499.9 </td>
   <td> 482.6 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1203 </td>
   <td> e2 </td>
   <td> 482.6 </td>
   <td> 1 </td>
   <td> 807 </td>
   <td> 499.9 </td>
   <td> 482.9 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1204 </td>
   <td> e2 </td>
   <td> 482.9 </td>
   <td> 1 </td>
   <td> 808 </td>
   <td> 499.9 </td>
   <td> 483.1 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1205 </td>
   <td> e2 </td>
   <td> 483.1 </td>
   <td> 1 </td>
   <td> 809 </td>
   <td> 499.9 </td>
   <td> 483.5 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1206 </td>
   <td> e2 </td>
   <td> 483.5 </td>
   <td> 1 </td>
   <td> 810 </td>
   <td> 499.9 </td>
   <td> 484.3 </td>
   <td> 483.5 </td>
   <td> 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1207 </td>
   <td> h </td>
   <td> 483.5 </td>
   <td> 1 </td>
   <td> 809 </td>
   <td> 499.9 </td>
   <td> 484.3 </td>
   <td> 483.7 </td>
   <td> 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1208 </td>
   <td> h </td>
   <td> 483.7 </td>
   <td> 1 </td>
   <td> 808 </td>
   <td> 499.9 </td>
   <td> 484.3 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1209 </td>
   <td> e2 </td>
   <td> 484.3 </td>
   <td> 1 </td>
   <td> 809 </td>
   <td> 499.9 </td>
   <td> 484.4 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1210 </td>
   <td> e2 </td>
   <td> 484.4 </td>
   <td> 1 </td>
   <td> 810 </td>
   <td> 499.9 </td>
   <td> 484.5 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1211 </td>
   <td> e2 </td>
   <td> 484.5 </td>
   <td> 1 </td>
   <td> 811 </td>
   <td> 499.9 </td>
   <td> 484.5 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1212 </td>
   <td> e2 </td>
   <td> 484.5 </td>
   <td> 1 </td>
   <td> 812 </td>
   <td> 499.9 </td>
   <td> 484.9 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1213 </td>
   <td> e2 </td>
   <td> 484.9 </td>
   <td> 1 </td>
   <td> 813 </td>
   <td> 499.9 </td>
   <td> 485.3 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1214 </td>
   <td> e2 </td>
   <td> 485.3 </td>
   <td> 1 </td>
   <td> 814 </td>
   <td> 499.9 </td>
   <td> 485.8 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1215 </td>
   <td> e2 </td>
   <td> 485.8 </td>
   <td> 1 </td>
   <td> 815 </td>
   <td> 499.9 </td>
   <td> 486.6 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1216 </td>
   <td> e2 </td>
   <td> 486.6 </td>
   <td> 1 </td>
   <td> 816 </td>
   <td> 499.9 </td>
   <td> 488.8 </td>
   <td> 487.6 </td>
   <td> 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1217 </td>
   <td> h </td>
   <td> 487.6 </td>
   <td> 1 </td>
   <td> 815 </td>
   <td> 499.9 </td>
   <td> 488.8 </td>
   <td> 488.3 </td>
   <td> 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1218 </td>
   <td> h </td>
   <td> 488.3 </td>
   <td> 1 </td>
   <td> 814 </td>
   <td> 499.9 </td>
   <td> 488.8 </td>
   <td> 490.2 </td>
   <td> 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1219 </td>
   <td> e2 </td>
   <td> 488.8 </td>
   <td> 1 </td>
   <td> 815 </td>
   <td> 499.9 </td>
   <td> 488.9 </td>
   <td> 490.2 </td>
   <td> 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1220 </td>
   <td> e2 </td>
   <td> 488.9 </td>
   <td> 1 </td>
   <td> 816 </td>
   <td> 499.9 </td>
   <td> 489.1 </td>
   <td> 490.2 </td>
   <td> 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1221 </td>
   <td> e2 </td>
   <td> 489.1 </td>
   <td> 1 </td>
   <td> 817 </td>
   <td> 499.9 </td>
   <td> 490.2 </td>
   <td> 490.2 </td>
   <td> 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1222 </td>
   <td> e2 </td>
   <td> 490.2 </td>
   <td> 1 </td>
   <td> 818 </td>
   <td> 499.9 </td>
   <td> 490.8 </td>
   <td> 490.2 </td>
   <td> 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1223 </td>
   <td> h </td>
   <td> 490.2 </td>
   <td> 1 </td>
   <td> 817 </td>
   <td> 499.9 </td>
   <td> 490.8 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1224 </td>
   <td> e2 </td>
   <td> 490.8 </td>
   <td> 1 </td>
   <td> 818 </td>
   <td> 499.9 </td>
   <td> 491.8 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1225 </td>
   <td> e2 </td>
   <td> 491.8 </td>
   <td> 1 </td>
   <td> 819 </td>
   <td> 499.9 </td>
   <td> 492.1 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1226 </td>
   <td> e2 </td>
   <td> 492.1 </td>
   <td> 1 </td>
   <td> 820 </td>
   <td> 499.9 </td>
   <td> 492.8 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1227 </td>
   <td> e2 </td>
   <td> 492.8 </td>
   <td> 1 </td>
   <td> 821 </td>
   <td> 499.9 </td>
   <td> 493.6 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1228 </td>
   <td> e2 </td>
   <td> 493.6 </td>
   <td> 1 </td>
   <td> 822 </td>
   <td> 499.9 </td>
   <td> 493.9 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1229 </td>
   <td> e2 </td>
   <td> 493.9 </td>
   <td> 1 </td>
   <td> 823 </td>
   <td> 499.9 </td>
   <td> 494.3 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1230 </td>
   <td> e2 </td>
   <td> 494.3 </td>
   <td> 1 </td>
   <td> 824 </td>
   <td> 499.9 </td>
   <td> 494.5 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1231 </td>
   <td> e2 </td>
   <td> 494.5 </td>
   <td> 1 </td>
   <td> 825 </td>
   <td> 499.9 </td>
   <td> 495.0 </td>
   <td> 494.6 </td>
   <td> 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1232 </td>
   <td> h </td>
   <td> 494.6 </td>
   <td> 1 </td>
   <td> 824 </td>
   <td> 499.9 </td>
   <td> 495.0 </td>
   <td> 496.9 </td>
   <td> 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1233 </td>
   <td> e2 </td>
   <td> 495.0 </td>
   <td> 1 </td>
   <td> 825 </td>
   <td> 499.9 </td>
   <td> 495.7 </td>
   <td> 496.9 </td>
   <td> 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1234 </td>
   <td> e2 </td>
   <td> 495.7 </td>
   <td> 1 </td>
   <td> 826 </td>
   <td> 499.9 </td>
   <td> 496.7 </td>
   <td> 496.9 </td>
   <td> 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1235 </td>
   <td> e2 </td>
   <td> 496.7 </td>
   <td> 1 </td>
   <td> 827 </td>
   <td> 499.9 </td>
   <td> 497.6 </td>
   <td> 496.9 </td>
   <td> 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1236 </td>
   <td> h </td>
   <td> 496.9 </td>
   <td> 1 </td>
   <td> 826 </td>
   <td> 499.9 </td>
   <td> 497.6 </td>
   <td> 504.8 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1237 </td>
   <td> e2 </td>
   <td> 497.6 </td>
   <td> 1 </td>
   <td> 827 </td>
   <td> 499.9 </td>
   <td> 497.8 </td>
   <td> 504.8 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1238 </td>
   <td> e2 </td>
   <td> 497.8 </td>
   <td> 1 </td>
   <td> 828 </td>
   <td> 499.9 </td>
   <td> 498.1 </td>
   <td> 504.8 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1239 </td>
   <td> e2 </td>
   <td> 498.1 </td>
   <td> 1 </td>
   <td> 829 </td>
   <td> 499.9 </td>
   <td> 499.5 </td>
   <td> 504.8 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1240 </td>
   <td> e2 </td>
   <td> 499.5 </td>
   <td> 1 </td>
   <td> 830 </td>
   <td> 499.9 </td>
   <td> 500.2 </td>
   <td> 504.8 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1241 </td>
   <td> e1 </td>
   <td> 499.9 </td>
   <td> 1 </td>
   <td> 831 </td>
   <td> 519.3 </td>
   <td> 500.2 </td>
   <td> 504.8 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
  <tr>
   <td> 1242 </td>
   <td> e2 </td>
   <td> 500.2 </td>
   <td> 1 </td>
   <td> 832 </td>
   <td> 519.3 </td>
   <td> 500.5 </td>
   <td> 504.8 </td>
   <td> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ... </td>
  </tr>
</tbody>
</table>

