# Exercise 2

## Exercise 2.1 

#
set.seed(10000)

# runif random uniform deviates with 100 observations between 1 and 100
x <- runif(100, 1, 100)
# mean rounded to two digists
mean_x <- round(mean(x), 2)

mean_x
# runif generates pseudo random values, if we specify the seed the mean will
# stay the same

## Exercise 2.2

x <- c(1:1000)

y <- c(999:0)

x + y 

# amount of money that all people posses
sum(x+y)

## Exercise 2.3
library(ggplot2) # only load (run) once

n <- 1e4
scale <- 10e6
income <- round( rbeta(n=n, shape1=1, shape2=100) * scale, 2)




# Plot the resulting curve
ggplot(data.frame(x = income), aes(x=x)) +
  geom_histogram(color = "#0065BD", fill = "#0065BD", alpha=0.5, bins = 100) +
  scale_x_continuous(breaks = seq(0, scale, 1e3)) + 
  labs(x = "Gross income", 
       y = "Counts") + 
  theme_minimal()



income_share <- income/sum(income)

income_share

income_s <- sort(income)
group <- c("Lower 1%", "Lower 50%", "Top 10%", "Top 1%")
p <- c(.1, .5, .9, .99)

boundary <- round(income_s[p*n], 0)

low10_m <- mean( income_s[c(1:(.1*n))] )
low50_m <- mean( income_s[c(1:(.5*n))] )
top10_m <- mean( income_s[c((.9*n):n)] )
top1_m <- mean( income_s[c((.99*n):n)] )

means <-  round( c(low10_m, low50_m, top10_m, top1_m) , 0)

income_summary <- data.frame(group, boundary, means)
income_summary

## group boundary means
## 1  Lower 1%      221   108
## 2 Lower 50%     1381   619
## 3   Top 10%     4597  6449
## 4    Top 1%     8899 10838


## Exercise 3


d1 <- runif(5, 1, 100)
d2 <- runif(5, 50, 100)
d3 <- runif(5, 1, 50)
d4 <- runif(5, 5, 10)
d5 <- runif(5, 95, 100)
data <- data.frame(d1,d2,d3,d4,d5)
vec <- colMeans(data)

library(tidyverse)

names(diamonds)
view(diamonds)


# matrix notation
diamonds[diamonds$cut == "Ideal",]

# with filter power! cmd shift m
diamonds %>% filter(diamonds$cut == "Ideal") %>% summarize(Mean = mean(price, na.rm=TRUE))



